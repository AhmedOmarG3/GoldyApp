import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout with API server');

      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send timeout with API server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Receive timeout with API server');

      case DioExceptionType.badCertificate:
        return ServerFailure(message: 'Bad certificate with API server');

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;
        if (statusCode != null) {
          return ServerFailure.fromResponse(statusCode, data);
        } else {
          return ServerFailure(message: 'Server error, try again later');
        }

      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request to API server was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure(message: 'No Internet connection');

      case DioExceptionType.unknown:
        final msg = error.message ?? '';
        if (msg.contains('SocketException')) {
          return ServerFailure(message: 'No Internet connection');
        } else {
          return ServerFailure(message: 'Unexpected error, try again');
        }

      default:
        return ServerFailure(message: 'Oops, there was an error, try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic error) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        message: _extractErrorMessage(error) ?? 'Unauthorized request',
      );
    } else if (statusCode == 404) {
      return ServerFailure(message: 'Not found');
    } else if (statusCode == 500) {
      return ServerFailure(message: 'Internal server error');
    } else {
      return ServerFailure(message: 'Oops, there was an error, try again');
    }
  }

  static String? _extractErrorMessage(dynamic error) {
    try {
      if (error is Map<String, dynamic>) {
        if (error['error'] != null && error['error']['message'] != null) {
          return error['error']['message'];
        }
        if (error['message'] != null) {
          return error['message'];
        }
      }
    } catch (_) {}
    return null;
  }
}
