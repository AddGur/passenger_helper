import 'package:get_it/get_it.dart';
import 'package:passanger_helper/core/location/location_service.dart';
import 'package:passanger_helper/features/home/data/weather_repository.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerSingleton<LocationService>(LocationService());

  getIt.registerSingleton<WeatherRepository>(
    WeatherRepository(getIt<LocationService>()),
  );
}
