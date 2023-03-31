class TemperaturaEntity {
  final double temperatura;
  final double umidade;
  final DateTime data;

  TemperaturaEntity({
    required this.temperatura,
    required this.umidade,
    required this.data,
  });

  factory TemperaturaEntity.fromEmpty() {
    return TemperaturaEntity(
      temperatura: 0,
      umidade: 0,
      data: DateTime.now(),
    );
  }
}
