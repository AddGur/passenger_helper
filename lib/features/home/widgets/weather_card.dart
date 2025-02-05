import 'package:flutter/material.dart';
import 'package:passanger_helper/data/models/weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({required this.weather, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(weather.city, style: theme.textTheme.headlineLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8.0,
              children: [
                Image.network(
                  weather.weatherIconUrl,
                  width: 60,
                  height: 60,
                ),
                Text(
                  '${weather.temperature}°C',
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.air),
                    Text(
                      '${weather.windSpeed} km/h\n${weather.windDirection}',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var day in weather.forecast)
                  _buildDayItem(context, theme, day),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDayItem(
      BuildContext context, ThemeData theme, WeatherForecast day) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                day.weatherIconUrl,
                width: 50,
                height: 50,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.error, color: Colors.red),
              ),
              FittedBox(
                child: Text(day.date,
                    maxLines: 1, style: theme.textTheme.bodyMedium),
              ),
              Text('${day.temperature.toStringAsFixed(1)}°C',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: Colors.blueAccent)),
            ],
          ),
        ),
      ),
    );
  }
}
