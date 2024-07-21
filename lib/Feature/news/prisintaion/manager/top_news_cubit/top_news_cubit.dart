import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/Feature/news/data/models/news_models/news_models.dart';
import 'package:untitled4/Feature/news/data/repo/news_repo_imp.dart';

part 'top_news_state.dart';

class TopNewsCubit extends Cubit<TopNewsState> {
  TopNewsCubit(this.newsRepoImp) : super(TopNewsInitial());
  final NewsRepoImp newsRepoImp;

  //! define variable curntPage
  int currntPage = 0;

  //! listNewsModel
  List<NewsModels> listTopHeadLines = [];

  //! controller PageView
  PageController pageController = PageController(
    viewportFraction: 0.9,
  );

  Future<void> getTopNews() async {
    emit(TopNewsLoading());
    var data = await newsRepoImp.featchTopNews();
    data.fold(
        (faliure) => emit(TopNewsFaliure(
              faliure.errMesage,
            )), (listTopheadlinesNews) {
      emit(
        TopNewsSucces(
          listTopheadlinesNews,
        ),
      );
      //! add data to listTopHeadLine in cubit
      listTopHeadLines = listTopheadlinesNews;
    });
  }
}
