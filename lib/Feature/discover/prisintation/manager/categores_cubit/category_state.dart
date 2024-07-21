part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<CategoresModel> listCategory;

  const CategorySuccess(this.listCategory);
}

final class CategoryFaliure extends CategoryState {
  final String errMesage;

  const CategoryFaliure(this.errMesage);
}
