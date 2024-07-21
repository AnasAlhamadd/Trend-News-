part of 'search_news_cubit.dart';

sealed class SearchNewsState extends Equatable {
  const SearchNewsState();

  @override
  List<Object> get props => [];
}

final class SearchNewsInitial extends SearchNewsState {}

final class SearchNewsLoading extends SearchNewsState {}

final class SearchNewsSuccess extends SearchNewsState {
  final List<NewsModels> listnewsModels;

  const SearchNewsSuccess(this.listnewsModels);
}

final class SearchNewsFaliure extends SearchNewsState {
  final String errMesage;

  const SearchNewsFaliure(this.errMesage);
}
