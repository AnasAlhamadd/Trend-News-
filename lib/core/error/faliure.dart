import 'package:dio/dio.dart';

abstract class Faliure {
  final String errMesage;
  Faliure(this.errMesage);
}

class ServerFaliure extends Faliure {
  ServerFaliure(super.errMesage);

  factory ServerFaliure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliure(
            "Connection Timeout with Api Server , Plase check your internet connection");
      case DioExceptionType.sendTimeout:
        return ServerFaliure(
            "Send Timeout with Api Server  , Please check your internet connection");
      case DioExceptionType.receiveTimeout:
        return ServerFaliure(
            "Receive Timeout with Api Server  , Please check your internet connection");
      case DioExceptionType.badCertificate:
        return ServerFaliure(
            "Bad Certificate with Api Server  ,Plase Try Later ! ");
      case DioExceptionType.badResponse:
        return ServerFaliure.fromResponce(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFaliure("Cancel with Api Server  ,Plase Try Later !");
      case DioExceptionType.connectionError:
        return ServerFaliure(
            "Connection Error with Api Server  , Please check your internet connection");
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFaliure(
              'No Internt Connection , Plase check your internet connection And try again');
        }
        return ServerFaliure('Unexpected Error  , Plase Try later');
      default:
        return ServerFaliure(
            'Oops Something went wrong  ,${dioException.message!}');
    }
  }
  factory ServerFaliure.fromResponce(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFaliure(response['message']);
    } else if (statusCode == 404) {
      return ServerFaliure('Your request Not Found  , Plase Try later!');
    } else if (statusCode == 500) {
      return ServerFaliure('Internal Server Error  , Plase Try later!');
    } else {
      return ServerFaliure(' Oops Something went wrong  , Plase Try later!');
    }
  }
}
