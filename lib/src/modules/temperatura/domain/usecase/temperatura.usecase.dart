import 'package:app_weather/src/modules/temperatura/domain/entity/temperatura.entity.dart';
import 'package:app_weather/src/modules/temperatura/domain/itemperatura.repository.dart';
import 'package:app_weather/src/modules/temperatura/domain/itemperatura.usecase.dart';

class TemperaturaUsecase implements ITemperaturaUsecase {
  final ITemperaturaRepository repository;

  TemperaturaUsecase(this.repository);

  @override
  Future<TemperaturaEntity> getTemperatura() async {
    try {
      return await repository.getTemperatura();
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<List<TemperaturaEntity>> getTemperaturas() async {
    try {
      return await repository.getTemperaturas();
    } catch (e) {
      throw e;
    }
  }
}
