class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final int humidity;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['data'][0]['city_name'], // Adjusted to Weatherbit's structure
      temperature: json['data'][0]['temp'], // Weatherbit uses 'temp'
      mainCondition: json['data'][0]['weather']['description'], // Adjusted
      humidity: json['data'][0]['rh'], // Weatherbit uses 'rh' for humidity
    );
  }
}
