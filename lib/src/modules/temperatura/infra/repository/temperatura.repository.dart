import 'dart:async';

import 'package:app_weather/src/modules/temperatura/domain/entity/temperatura.entity.dart';
import 'package:app_weather/src/modules/temperatura/domain/itemperatura.repository.dart';
import 'package:app_weather/src/modules/temperatura/infra/itemperatura.datasource.dart';

class TemperaturaRepository implements ITemperaturaRepository {
  final ITemperaturaDatasource datasource;

  TemperaturaRepository(this.datasource);

  @override
  Future<List<TemperaturaEntity>> getTemperaturas() async {
    return await datasource.getTemperaturas();
  }

  @override
  Stream<TemperaturaEntity> getTemperatura(StreamController<TemperaturaEntity> controller) {
    return datasource.streamTemperatura(controller);
  }
}
