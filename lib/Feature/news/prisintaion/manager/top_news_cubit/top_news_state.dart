part of 'top_news_cubit.dart';

sealed class TopNewsState extends Equatable {
  const TopNewsState();

  @override
  List<Object> get props => [];
}

final class TopNewsInitial extends TopNewsState {}

final class TopNewsLoading extends TopNewsState {}

final class TopNewsSucces extends TopNewsState {
  final List<NewsModels> listTopNews;

  const TopNewsSucces(this.listTopNews);
}

final class TopNewsFaliure extends TopNewsState {
  final String errMesage;

  const TopNewsFaliure(this.errMesage);
}
