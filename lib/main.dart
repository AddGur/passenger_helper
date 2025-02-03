import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passanger_helper/core/theme/cubit/app_theme_cubit.dart';
import 'package:passanger_helper/features/flights/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppThemeCubit()..loadTheme())
      ],
      child: BlocBuilder<AppThemeCubit, ThemeData>(
        builder: (context, state) => MaterialApp(
          title: 'Flutter Demo',
          theme: state,
          home: HomePage(),
        ),
      ),
    );
  }
}
