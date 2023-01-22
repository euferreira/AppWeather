import 'package:app_weather/src/modules/temperatura/domain/entity/temperatura.entity.dart';
import 'package:app_weather/src/modules/temperatura/infra/itemperatura.datasource.dart';

class TemperaturaDatasource implements ITemperaturaDatasource {
  @override
  Future<TemperaturaEntity> getTemperatura() async {
    return TemperaturaEntity(
      temperatura: 23.5,
      umidade: 8.5,
      data: DateTime.now(),
    );
  }

  @override
  Future<List<TemperaturaEntity>> getTemperaturas() async {
    return List.generate(
      5,
      (index) => TemperaturaEntity(
        temperatura: index * 7.5,
        umidade: index * 8.5,
        data: DateTime.now(),
      ),
    );
  }
}
