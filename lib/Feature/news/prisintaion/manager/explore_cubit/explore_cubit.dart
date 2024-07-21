import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled4/Feature/news/data/models/news_models/news_models.dart';
import 'package:untitled4/Feature/news/data/repo/news_repo_imp.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this.newsRepoImp) : super(ExploreInitial());
  final NewsRepoImp newsRepoImp;
  Future<void> getExploreNews() async {
    emit(ExploreLoading());
    var data = await newsRepoImp.featchExploreNews();
    data.fold(
        (faliure) => emit(
              ExploreFailure(
                faliure.errMesage,
              ),
            ), (listRecommended) {
      emit(
        ExploreSuccess(
          listRecommended,
        ),
      );
    });
  }
}
