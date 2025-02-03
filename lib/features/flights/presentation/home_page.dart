import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passanger_helper/core/theme/cubit/app_theme_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Placeholder(),
    );
  }
}
