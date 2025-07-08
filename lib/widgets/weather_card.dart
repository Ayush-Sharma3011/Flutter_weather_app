import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final double temperature;
  final double windSpeed;
  final String time;

  const WeatherCard({
    super.key,
    required this.temperature,
    required this.windSpeed,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Current Weather",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              "$temperature°C",
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 10),
            Text("Wind Speed: $windSpeed km/h"),
            const SizedBox(height: 10),
            Text("Time: $time"),
          ],
        ),
      ),
    );
  }
}
