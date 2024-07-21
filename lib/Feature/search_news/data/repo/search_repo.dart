import 'package:dartz/dartz.dart';
import 'package:untitled4/Feature/news/data/models/news_models/news_models.dart';
import 'package:untitled4/core/error/faliure.dart';

abstract class SearchRepo {
  Future<Either<Faliure, List<NewsModels>>> getItemsByQuery(
      {required String query});
}
