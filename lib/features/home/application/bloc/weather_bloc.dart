import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:passanger_helper/data/models/failure.dart';
import 'package:passanger_helper/data/models/weather.dart';
import 'package:passanger_helper/features/home/data/weather_repository.dart';
import 'package:passanger_helper/injection/injection_container.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc()
      : _weatherRepository = getIt<WeatherRepository>(),
        super(WeatherInitial()) {
    on<WeatherFetchEvent>(
      (event, emit) async {
        emit(WeatherLoadingState());

        final result = await _weatherRepository.getWeather();

        result.fold((failure) {
          emit(WeatherErrorState(failure: failure));
        }, (weather) {
          emit(WeatherLoadedState(weather: weather));
        });
      },
    );
  }
}
