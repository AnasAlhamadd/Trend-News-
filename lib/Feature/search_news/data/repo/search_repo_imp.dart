import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled4/Feature/news/data/models/news_models/news_models.dart';
import 'package:untitled4/Feature/search_news/data/repo/search_repo.dart';
import 'package:untitled4/core/error/faliure.dart';
import 'package:untitled4/core/services/api_services.dart';
import 'package:untitled4/core/utils/constant.dart';

class SearchRepoImp implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImp(this.apiServices);
  @override
  Future<Either<Faliure, List<NewsModels>>> getItemsByQuery(
      {required String query}) async {
    try {
      Map<String, dynamic> data = await apiServices
          .get('everything?q=$query&sortBy=popularity&apiKey=$key');
      List<NewsModels> listnewsModels = [];
      listnewsModels.add(
        NewsModels.fromJson(data),
      );
      return right(listnewsModels);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.fromDioError(e));
      }
      return left(ServerFaliure('Oops something went wrong'));
    }
  }
}
