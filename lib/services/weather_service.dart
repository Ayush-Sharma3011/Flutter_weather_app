import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<Map<String, dynamic>> fetchWeather(double lat, double lon) async {
    final url = 'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current_weather=true';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}
