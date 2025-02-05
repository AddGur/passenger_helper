import 'package:passanger_helper/utils.dart';

class Weather {
  final String city;
  final String weatherIconUrl;
  final double temperature;
  final double windSpeed;
  final String windDirection;
  final List<WeatherForecast> forecast;

  Weather({
    required this.city,
    required this.weatherIconUrl,
    required this.temperature,
    required this.windSpeed,
    required this.windDirection,
    required this.forecast,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    var forecastData = json['forecast']?['forecastday'];

    return Weather(
      city: json['location']['name'] ?? 'Unknown',
      weatherIconUrl: getFullIconUrl(json['current']['condition']['icon']),
      temperature: json['current']['temp_c'] ?? 0.0,
      windSpeed: json['current']['wind_kph'] ?? 0.0,
      windDirection: json['current']['wind_dir'] ?? 'Unknown',
      forecast: forecastData != null
          ? (forecastData as List)
              .map((day) => WeatherForecast.fromJson(day))
              .toList()
          : [],
    );
  }
}

class WeatherForecast {
  final String date;
  final double temperature;
  final String weatherIconUrl;

  WeatherForecast({
    required this.date,
    required this.temperature,
    required this.weatherIconUrl,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      date: json['date'] ?? 'Unknown',
      temperature: json['day']?['avgtemp_c'] ?? 0.0,
      weatherIconUrl: getFullIconUrl(json['day']?['condition']?['icon']),
    );
  }
}
