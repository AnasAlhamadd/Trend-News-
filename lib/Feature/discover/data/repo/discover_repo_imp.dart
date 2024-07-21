import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled4/Feature/discover/data/models/categores_model/categores_model.dart';
import 'package:untitled4/Feature/discover/data/repo/discover_repo.dart';
import 'package:untitled4/core/error/faliure.dart';
import 'package:untitled4/core/services/api_services.dart';
import 'package:untitled4/core/utils/constant.dart';

class DiscoverRepoImp implements DiscoverRepo {
  final ApiServices apiServices;

  DiscoverRepoImp(this.apiServices);

  @override
  Future<Either<Faliure, List<CategoresModel>>> featchItemsbyCategores(
      {required String categores}) async {
    try {
      Map<String, dynamic> data = await apiServices.get(
          'top-headlines/sources?apiKey=$key&country=us&category=$categores');
      List<CategoresModel> listCategores = [];
      listCategores.add(
        CategoresModel.fromJson(data),
      );
      return right(listCategores);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFaliure.fromDioError(e),
        );
      } else {
        return left(ServerFaliure('Oops plase try later !'));
      }
    }
  }
}
