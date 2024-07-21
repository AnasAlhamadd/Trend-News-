import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled4/Feature/news/data/models/news_models/news_models.dart';
import 'package:untitled4/Feature/news/data/repo/news_repo_imp.dart';
part 'lasted_news_state.dart';

class LastedNewsCubit extends Cubit<LastedNewsState> {
  LastedNewsCubit(this.newsRepoImp) : super(LastedNewsInitial());
  final NewsRepoImp newsRepoImp;

  Future<void> getDatelastednews({
    required String source,
  }) async {
    emit(LastedNewsLoading());
    var data = await newsRepoImp.featchLastednews(source: source);
    data.fold(
      (faliure) => emit(LastedNewsFaliure(faliure.errMesage)),
      (listlasetdnews) => emit(
        LastedNewsSuccess(
          listlasetdnews,
        ),
      ),
    );
  }
}
