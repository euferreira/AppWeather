import 'package:app_weather/src/modules/temperatura/domain/entity/temperatura.entity.dart';

abstract class ITemperaturaUsecase {
  Future<TemperaturaEntity> getTemperatura();

  Future<List<TemperaturaEntity>> getTemperaturas();
}
