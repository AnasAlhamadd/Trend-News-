import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled4/Feature/discover/data/models/categores_model/categores_model.dart';
import 'package:untitled4/Feature/discover/data/repo/discover_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.discoverRepo) : super(CategoryInitial());
  final DiscoverRepo discoverRepo;
  Future<void> getItemsByCategors({required String category}) async {
    emit(CategoryLoading());
    var result = await discoverRepo.featchItemsbyCategores(categores: category);
    result.fold(
      (faliure) => emit(
        CategoryFaliure(faliure.errMesage),
      ),
      (listCategores) => emit(
        CategorySuccess(listCategores),
      ),
    );
  }
}
