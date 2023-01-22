import 'package:app_weather/src/modules/temperatura/domain/entity/temperatura.entity.dart';

class TemperaturaModel extends TemperaturaEntity {
  TemperaturaModel({
    required super.temperatura,
    required super.umidade,
    required super.data,
  });

  factory TemperaturaModel.fromJson(Map<String, dynamic> json) {
    return TemperaturaModel(
      temperatura: json['temperatura'],
      umidade: json['umidade'],
      data: DateTime.parse(json['data']),
    );
  }
}
