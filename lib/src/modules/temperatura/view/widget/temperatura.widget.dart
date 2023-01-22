import 'package:app_weather/src/shared/widgets/temperature_icon.widget.dart';
import 'package:flutter/material.dart';

class Temperatura extends StatelessWidget {
  final double maxWidth;
  final double temperature;

  const Temperatura({
    required this.maxWidth,
    required this.temperature,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          child: TemperatureIcon(
            maxWidth: maxWidth,
            temperature: temperature,
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                'Quarto',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                '$temperatureºC',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}
