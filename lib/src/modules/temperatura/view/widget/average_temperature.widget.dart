import 'package:app_weather/src/modules/temperatura/domain/entity/temperatura.entity.dart';
import 'package:app_weather/src/shared/utils/formatter.dart';
import 'package:app_weather/src/shared/widgets/temperature_icon.widget.dart';
import 'package:flutter/material.dart';

class AverageTemperature extends StatelessWidget {
  final TemperaturaEntity temperatura;

  const AverageTemperature({
    super.key,
    required this.temperatura,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            formatDataToString(temperatura.data, format: 'dd/MM'),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${temperatura.temperatura}ºC',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(width: 6),
              TemperatureIcon(
                maxWidth: 40,
                temperature: temperatura.temperatura,
              ),
            ],
          )
        ],
      ),
    );
  }
}
