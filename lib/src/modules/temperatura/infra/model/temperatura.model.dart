import 'package:app_weather/src/modules/temperatura/domain/entity/temperatura.entity.dart';

class TemperaturaModel extends TemperaturaEntity {
  TemperaturaModel({
    required super.temperatura,
    required super.umidade,
    required super.data,
  });

  factory TemperaturaModel.fromJson(Map<String, dynamic> json) {
    return TemperaturaModel(
      temperatura: double.parse(json['temperatura'].toString()),
      umidade: double.parse(json['umidade'].toString()),
      data: DateTime.parse(json['createdAt']),
    );
  }
}
