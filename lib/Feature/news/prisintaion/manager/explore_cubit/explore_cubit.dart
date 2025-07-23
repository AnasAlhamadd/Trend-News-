import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled4/Feature/news/data/models/news_models/news_models.dart';
import 'package:untitled4/Feature/news/data/repo/news_repo_imp.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this.newsRepoImp) : super(ExploreInitial());
  final NewsRepoImp newsRepoImp;
  int _page = 1;
  final int _pageSize = 20;
  bool _isLoadingMore = false;
  bool _isLastPage = false;
  List<NewsModels> _allNews = [];

  Future<void> getExploreNews({bool isRefresh = false}) async {
    if (_isLastPage || _isLoadingMore) return;

    if (isRefresh) {
      _page = 1;
      _isLastPage = false;
      _allNews.clear();
      emit(ExploreLoading());
    } else if (_page == 1) {
      emit(ExploreLoading());
    } else {
      _isLoadingMore = true;
      emit(ExploreSuccess(_allNews, isLoadingMore: true));
    }

    final result = await newsRepoImp.featchExploreNews(
      page: _page,
      pageSize: _pageSize,
    );

    result.fold(
      (failure) {
        emit(ExploreFailure(failure.errMesage));
        _isLoadingMore = false;
      },
      (newsList) {
        if (newsList.length < _pageSize) _isLastPage = true;

        _allNews.addAll(newsList);
        _page++;
        _isLoadingMore = false;

        emit(ExploreSuccess(_allNews, isLoadingMore: false));
      },
    );
  }
}
