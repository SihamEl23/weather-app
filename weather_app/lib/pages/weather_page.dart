import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

  class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService('45c3499aa7fa42c6ba83cba17a18fe9b');
  Weather? _weather;

  // Fetch weather
  _fetchWeather() async {
    try {
      // Get the current position
      Position position = await _weatherService.getCurrentPosition();

      // Get weather for current location
      final weather =
          await _weatherService.getWeather(position.latitude, position.longitude);

      setState(() {
        _weather = weather;
      });
    } catch (e) {
      // Print any errors
    }
  }


    // Weather animations
  String getWeatherAnimation(String? description) {
    if (description == null) return 'assets/sun.json'; // Default to sunny if no description

    switch (description.toLowerCase()) {
      case 'clear sky':
        return 'assets/sun.json';
      case 'few clouds':
      case 'scattered clouds':
      case 'broken clouds':
        return 'assets/cloud.json';
      case 'shower rain':
      case 'rain':
      case 'drizzle':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'snow':
        return 'assets/snow.json';
      case 'mist':
      case 'haze':
      case 'fog':
        return 'assets/mist.json';
      default:
        return 'assets/sun.json'; // Default to sunny for unknown cases
    }
  }


  @override
  void initState() {
    super.initState();
    _fetchWeather(); // Fetch weather on startup
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.location_on, size: 24, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  _weather?.cityName ?? "Loading city...",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
            const SizedBox(height: 10),
            Text(
              '${_weather?.temperature.round() ?? '--'}°C',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              _weather?.mainCondition ?? "",
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 10),
            if (_weather != null)
              Text(
                'Humidity: ${_weather?.humidity ?? '--'}%',
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
          ],
        ),
      ),
    );
  }
}

