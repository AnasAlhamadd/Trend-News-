import 'package:dartz/dartz.dart';
import 'package:untitled4/Feature/discover/data/models/categores_model/categores_model.dart';
import 'package:untitled4/core/error/faliure.dart';

abstract class DiscoverRepo {
  Future<Either<Faliure, List<CategoresModel>>> featchItemsbyCategores(
      {required String categores});
}
