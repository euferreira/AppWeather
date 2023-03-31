import 'dart:async';
import 'dart:convert';

import 'package:app_weather/src/modules/temperatura/domain/entity/temperatura.entity.dart';
import 'package:app_weather/src/modules/temperatura/infra/itemperatura.datasource.dart';
import 'package:app_weather/src/modules/temperatura/infra/model/temperatura.model.dart';
import 'package:dio/dio.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../../shared/dio/api.client.dio.dart';

class TemperaturaDatasource implements ITemperaturaDatasource {
  final ApiClientDio apiClientDio;

  TemperaturaDatasource({required this.apiClientDio});

  @override
  Stream<TemperaturaEntity> streamTemperatura(StreamController<TemperaturaEntity> controller) {
    IO.Socket socket = IO.io(
        'http://192.168.0.177:3000',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());
    socket
      ..disconnect()
      ..connect();

    return Stream.value(retornaTemperatura(socket, controller) ?? TemperaturaEntity.fromEmpty());
  }

  TemperaturaEntity? retornaTemperatura(IO.Socket socket,  StreamController<TemperaturaEntity> controller) {
    TemperaturaEntity? valor;

    socket.on('getTemperatura', (data) {
      valor = TemperaturaModel.fromJson(jsonDecode(data));
      controller.add(valor!);
    });
    return valor;
  }

  @override
  Future<List<TemperaturaEntity>> getTemperaturas() async {
    try {
      Response response = await apiClientDio.client.get('/temperatura/last/5', queryParameters: {
        'limit': 5,
      });
      return response.statusCode == 200
          ? response.data.map<TemperaturaEntity>((item) => TemperaturaModel.fromJson(item)).toList()
          : [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
