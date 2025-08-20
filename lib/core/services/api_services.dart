import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  // final Dio _dio;

  ApiServices(this._dio);

  //! get Methodes

  Future<Map<String, dynamic>> get(String endPoint) async {
    Response responce = await _dio.get('https://newsapi.org/v2/$endPoint');
    return responce.data;
  }
}
