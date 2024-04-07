// ignore_for_file: avoid_dynamic_calls

import 'dart:io';

import 'package:dio/dio.dart';

class CustomException implements Exception {
  final CustomError error;

  CustomException._(this.error);

  @override
  String toString() => "message : $error";
}

class ExceptionHandler {
  factory ExceptionHandler(dynamic error) {
    switch (error.runtimeType) {
      case FormatException:
        throw CustomException._(CustomError.formatException);
      case DioExceptionType:
        if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout ||
            error.type == DioExceptionType.sendTimeout ||
            error.type == DioExceptionType.cancel ||
            (error.message != null &&
                error.message.contains("SocketException"))) {
          throw CustomException._(CustomError.noInternet);
        } else {
          if (error.response != null) {
            if (error.response!.statusCode == 400) {
              throw CustomException._(CustomError.askForCode);
            } else if (error.response!.statusCode == 409) {
              if (error.response!.data["message"] == "0") {
                throw CustomException._(CustomError.alreadyExists);
              }
              if (error.response!.data["message"] == "1") {
                throw CustomException._(CustomError.conflict);
              }
              if (error.response!.data["message"] == "2") {
                throw CustomException._(CustomError.wrongCode);
              }
              if (error.response!.data["message"] == "3") {
                throw CustomException._(CustomError.phoneAlreadyExists);
              }
            }
            if (error.response!.statusCode == 401) {
              if (error.response!.data["message"] == "0") {
                throw CustomException._(CustomError.wrongPassword);
              }
            }
            if (error.response!.statusCode == 404) {
              if (error.response!.data["message"] == "0") {
                throw CustomException._(CustomError.notFound);
              } else if (error.response!.data["message"] == "1") {
              } else if (error.response!.data["message"] == "2") {
              } else {
                throw CustomException._(CustomError.notFound);
              }
            }
            if (error.response!.statusCode == 405) {
              if (error.response!.data["message"] == "0") {}
            }
            if (error.response!.statusCode == 422) {
              if (error.response!.data["message"] == "number") {
                throw CustomException._(CustomError.mustNumber);
              }
            }
          } else {
            throw CustomException._(CustomError.unKnown);
          }
        }
        throw CustomException._(CustomError.unKnown);
      case SocketException:
        throw CustomException._(CustomError.noInternet);
      case HttpException:
        throw CustomException._(CustomError.noInternet);
      default:
        throw CustomException._(CustomError.unKnown);
    }
  }
}

enum CustomError {
  noInternet,
  conflict,
  unKnown,
  alreadyExists,
  askForCode,
  notFound,
  formatException,
  badRequest,
  wrongCode,
  wrongPassword,
  phoneAlreadyExists,
  mustNumber
}
