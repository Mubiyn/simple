import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/shared/utilities/string_setups/strings.dart';

class ApiException implements Exception {
  ApiException(this.message);

  final String message;

  static ApiException getException(err) {
    debugPrint('DioError: ${(err as DioException).message}');
    debugPrint('DioError: ${err.response?.data}');
    switch (err.type) {
      case DioExceptionType.cancel:
        return OtherExceptions(kRequestCancelledError);

      case DioExceptionType.connectionError:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
        return InternetConnectException(kTimeOutError);

      case DioExceptionType.unknown:
        if (err.error is FormatException) {
          return FormatException();
        }
        if (err.error is SocketException) {
          return InternetConnectException("No internet connection. Try again");
        }
        break;

      case DioExceptionType.badCertificate:
        return InternetConnectException(kTimeOutError);
      case DioExceptionType.badResponse:
        try {
          if (err.response?.data != null) {
            if ((err.response!.data as Map)['message'] is Map) {
              return OtherExceptions(
                ((err.response!.data as Map)['message'] as Map)['message'],
              );
            }
            return OtherExceptions((err.response!.data as Map)['message']);
          } else {
            switch (err.response?.statusCode) {
              case 500:
                return InternalServerException();
              case 404:
              case 502:
                return OtherExceptions(kNotFoundError);
              case 400:
                return OtherExceptions(kBadRequestError);
              case 403:
              case 401:
                return UnAuthorizedException();
              default:
                // default exception error message
                return OtherExceptions(kDefaultError);
            }
          }
        } catch (err) {
          log(err.toString());
          return OtherExceptions(kDefaultError);
        }
    }
    // default exception error message
    return OtherExceptions(kDefaultError);
  }
}

class OtherExceptions implements ApiException {
  OtherExceptions(this.newMessage);

  final String newMessage;

  @override
  String toString() => message;

  @override
  String get message => newMessage;
}

class FormatException implements ApiException {
  @override
  String toString() => message;

  @override
  String get message => kFormatError;
}

class InternetConnectException implements ApiException {
  InternetConnectException(this.newMessage);

  final String newMessage;

  @override
  String toString() => message;

  @override
  String get message => newMessage;
}

class InternalServerException implements ApiException {
  @override
  String toString() {
    return message;
  }

  @override
  String get message => kServerError;
}

class UnAuthorizedException implements ApiException {
  @override
  String toString() {
    return message;
  }

  @override
  String get message => kUnAuthorizedError;
}

class CacheException implements Exception {
  CacheException(this.message) : super();

  String message;

  @override
  String toString() {
    return message;
  }
}
