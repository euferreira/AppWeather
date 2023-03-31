import 'dart:async';

import 'package:app_weather/src/modules/temperatura/domain/entity/temperatura.entity.dart';

abstract class ITemperaturaDatasource {
  Stream<TemperaturaEntity> streamTemperatura(StreamController<TemperaturaEntity> controller);
  Future<List<TemperaturaEntity>> getTemperaturas();
}
