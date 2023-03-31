import 'package:dio/dio.dart';

abstract class ClientDio {
  Dio client = Dio();

  String get baseUrl;

  ClientDio() {
    client.options.baseUrl = baseUrl;
    client.options.connectTimeout = 60 * 1000;
    client.options.receiveDataWhenStatusError = true;
  }
}
