import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TemperatureIcon extends StatelessWidget {
  final double maxWidth;
  final double temperature;
  const TemperatureIcon({
    super.key,
    required this.maxWidth,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      getIcon(),
      color: temperatureIconColor(),
      size: maxWidth * 0.4,
    );
  }

  IconData getIcon() {
    if (temperature < 10) {
      return FontAwesomeIcons.snowflake;
    } else if (temperature < 20) {
      return FontAwesomeIcons.cloudSunRain;
    } else if (temperature < 30) {
      return FontAwesomeIcons.cloudSun;
    } else {
      return FontAwesomeIcons.sun;
    }
  }

  Color temperatureIconColor() {
    if (temperature < 10) {
      return Colors.blue;
    } else if (temperature < 20) {
      return Colors.orange;
    } else if (temperature < 30) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}
