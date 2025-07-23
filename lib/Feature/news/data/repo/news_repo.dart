import 'package:dartz/dartz.dart';
import 'package:untitled4/Feature/news/data/models/news_models/news_models.dart';
import 'package:untitled4/core/error/faliure.dart';

abstract class NewsRepo {
  Future<Either<Faliure, List<NewsModels>>> featchTopNews();
  Future<Either<Faliure, List<NewsModels>>> featchExploreNews({
    required int page,
    required int pageSize,
  });
  Future<Either<Faliure, List<NewsModels>>> featchLastednews(
      {required String source});
}
