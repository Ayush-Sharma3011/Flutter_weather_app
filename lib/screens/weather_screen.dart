import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../services/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool isLoading = true;
  bool isError = false;
  Map<String, dynamic>? weatherData;

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  Future<void> getWeather() async {
    try {
      final data = await WeatherService().fetchWeather(28.61, 77.23); // Delhi
      setState(() {
        weatherData = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: isLoading
          ? Center(child: Lottie.asset('assets/loading.json', width: 150))
          : isError
          ? Center(child: Text('Error loading weather. Try again.'))
          : Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Card(
                  elevation: 10,
                  margin: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Current Weather",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "${weatherData!['current_weather']['temperature']}°C",
                          style: const TextStyle(fontSize: 40),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Wind Speed: ${weatherData!['current_weather']['windspeed']} km/h",
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Time: ${weatherData!['current_weather']['time']}",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
