import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:passanger_helper/core/api_key.dart';
import 'package:passanger_helper/core/location/location_service.dart';
import 'package:passanger_helper/data/models/failure.dart';
import 'package:passanger_helper/data/models/weather.dart';

class WeatherRepository {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.weatherapi.com/v1',
    validateStatus: (status) {
      return status! < 500;
    },
  ));

  final LocationService _locationService;
  WeatherRepository(this._locationService);

  Future<Either<Failure, Weather>> getWeather() async {
    Position position = await _locationService.getCurrentLocation();

    try {
      final response = await _dio.get('/forecast.json', queryParameters: {
        'key': weatherApiKey,
        'q': '${position.latitude},${position.longitude}',
        'days': 3,
      });
      if (response.statusCode == 200) {
        final weather = Weather.fromJson(response.data);
        return Right(weather);
      } else {
        return Left(Failure(
            "API error: ${response.statusCode}. Details: ${response.data['error']['message']}"));
      }
    } catch (e) {
      return Left(Failure("Weather fetching error: ${e.toString()}"));
    }
  }
}
