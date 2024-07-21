part of 'lasted_news_cubit.dart';

sealed class LastedNewsState extends Equatable {
  const LastedNewsState();

  @override
  List<Object> get props => [];
}

final class LastedNewsInitial extends LastedNewsState {}

final class LastedNewsLoading extends LastedNewsState {}

final class LastedNewsSuccess extends LastedNewsState {
  final List<NewsModels> listnewsModels;

  const LastedNewsSuccess(this.listnewsModels);
}

final class LastedNewsFaliure extends LastedNewsState {
  final String errMesage;

  const LastedNewsFaliure(this.errMesage);
}
