import 'dart:async';

import 'package:app_weather/src/modules/temperatura/domain/entity/temperatura.entity.dart';

abstract class ITemperaturaUsecase {
  Stream<TemperaturaEntity>  getTemperatura(StreamController<TemperaturaEntity> controller);

  Future<List<TemperaturaEntity>> getTemperaturas();
}
