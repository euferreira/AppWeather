import 'package:dio/dio.dart';

import 'errors.dart';

abstract class NetworkExceptions {
  Failure exceptions(ExceptionParams params);
}

class ExceptionParams {
  final DioError? dioError;
  final String? message;
  ExceptionParams({this.dioError, this.message});
}
