import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled4/Feature/news/data/models/news_models/news_models.dart';
import 'package:untitled4/Feature/news/data/repo/news_repo.dart';
import 'package:untitled4/core/services/api_services.dart';
import 'package:untitled4/core/error/faliure.dart';
import 'package:untitled4/core/utils/constant.dart';

class NewsRepoImp extends NewsRepo {
  final ApiServices apiServices;

  NewsRepoImp(this.apiServices);

  @override
  Future<Either<Faliure, List<NewsModels>>> featchTopNews() async {
    try {
      Map<String, dynamic> data = await apiServices.get(
        'top-headlines?sources=bbc-news&apiKey=$key',
      );
      List<NewsModels> listNews = [];
      listNews.add(
        NewsModels.fromJson(data),
      );
      return right(listNews);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFaliure.fromDioError(e),
        );
      } else {
        return left(ServerFaliure(
          'Oops Please Try Agin',
        ));
      }
    }
  }

  @override
  Future<Either<Faliure, List<NewsModels>>> featchExploreNews() async {
    try {
      Map<String, dynamic> data = await apiServices.get(
          // 'everything?domains=aljazeera.com&apiKey=$key',
          'everything?domains=techcrunch.com,aljazeera.com,bbc.co.uk&apiKey=$key');

      List<NewsModels> listNews = [];
      listNews.add(
        NewsModels.fromJson(data),
      );
      return right(listNews);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.fromDioError(e));
      } else {
        return left(
          ServerFaliure('Oops Please Try Agin'),
        );
      }
    }
  }

  @override
  Future<Either<Faliure, List<NewsModels>>> featchLastednews(
      {required String source}) async {
    try {
      Map<String, dynamic> data = await apiServices.get(
          // 'everything?q=$source&apiKey=$key',
          'everything?q=$source&sortBy=popularity&apiKey=$key');
      List<NewsModels> listnews = [];
      listnews.add(
        NewsModels.fromJson(data),
      );
      return right(listnews);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.fromDioError(e));
      } else {
        return left(
          ServerFaliure('Oops Please Try Agin'),
        );
      }
    }
  }
}
