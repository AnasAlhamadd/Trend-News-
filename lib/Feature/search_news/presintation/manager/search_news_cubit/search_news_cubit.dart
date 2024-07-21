import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled4/Feature/news/data/models/news_models/news_models.dart';
import 'package:untitled4/Feature/search_news/data/repo/search_repo.dart';

part 'search_news_state.dart';

class SearchNewsCubit extends Cubit<SearchNewsState> {
  SearchNewsCubit(this.searchRepo) : super(SearchNewsInitial());
  final SearchRepo searchRepo;
  Future<void> getSearchNews(String query) async {
    emit(SearchNewsLoading());
    var data = await searchRepo.getItemsByQuery(query: query);
    data.fold(
      (faliure) => emit(
        SearchNewsFaliure(faliure.errMesage),
      ),
      (listSearchNews) => emit(
        SearchNewsSuccess(listSearchNews),
      ),
    );
  }
}
