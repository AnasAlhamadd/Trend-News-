part of 'explore_cubit.dart';

sealed class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object> get props => [];
}

final class ExploreInitial extends ExploreState {}

final class ExploreLoading extends ExploreState {}

final class ExploreSuccess extends ExploreState {
  final List<NewsModels> listNewsData;
  final bool isLoadingMore;

  const ExploreSuccess(this.listNewsData, {this.isLoadingMore = false});
}

final class ExploreFailure extends ExploreState {
  final String errMesage;

  const ExploreFailure(this.errMesage);
}
