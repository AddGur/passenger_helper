import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passanger_helper/core/theme/cubit/app_theme_cubit.dart';
import 'package:passanger_helper/features/home/application/bloc/weather_bloc.dart';
import 'package:passanger_helper/features/home/widgets/weather_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<WeatherBloc>().add(WeatherFetchEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passanger Helper'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<AppThemeCubit>().toggle();
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          switch (state) {
            case WeatherLoadingState():
              return const Center(child: CircularProgressIndicator());
            case WeatherErrorState():
              return const Center(child: Text('Error loading weather data'));
            case WeatherLoadedState():
              return Column(
                children: [WeatherCard(weather: state.weather)],
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
