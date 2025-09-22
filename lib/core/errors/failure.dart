import 'package:dio/dio.dart';

class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioError e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("connectionTimeout with api service");
      case DioExceptionType.sendTimeout:
        return ServerFailure("sendTimeout with api service");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receiveTimeout with api service");
      case DioExceptionType.badCertificate:
        return ServerFailure("badCertificate with api service");
      case DioExceptionType.cancel:
        return ServerFailure("cancel with api service");
      case DioExceptionType.connectionError:
        return ServerFailure("connectionError with api service");
      case DioExceptionType.unknown:
        return ServerFailure("unknown with api service...DioExceptionType ");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data);
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure("Your request not found");
    }else if( statusCode ==500) {
      return ServerFailure("there is a problem with  server");
    }else if( statusCode ==400 || statusCode ==401|| statusCode ==403) {
      return ServerFailure(response['error']['message']);
    }else{
      return ServerFailure("there was an error PLz Tray again");
    }

  }
}
