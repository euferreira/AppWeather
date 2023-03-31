import 'dart:async';

import 'package:app_weather/src/modules/temperatura/domain/entity/temperatura.entity.dart';
import 'package:app_weather/src/modules/temperatura/domain/itemperatura.repository.dart';
import 'package:app_weather/src/modules/temperatura/domain/itemperatura.usecase.dart';

class TemperaturaUsecase implements ITemperaturaUsecase {
  final ITemperaturaRepository repository;

  TemperaturaUsecase(this.repository);

  @override
  Future<List<TemperaturaEntity>> getTemperaturas() async {
    try {
      return await repository.getTemperaturas();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Stream<TemperaturaEntity> getTemperatura(StreamController<TemperaturaEntity> controller) {
    try {
      return repository.getTemperatura(controller);
    } catch (e) {
      throw Exception(e);
    }
  }
}
