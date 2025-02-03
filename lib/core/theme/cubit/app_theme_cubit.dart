import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:passanger_helper/core/theme/app_theme.dart';

class AppThemeCubit extends Cubit<ThemeData> {
  AppThemeCubit() : super(AppTheme.lightTheme);

  void loadTheme() {
    emit(AppTheme.darkTheme);
  }

  void toggle() {
    emit(state.brightness == Brightness.light
        ? AppTheme.darkTheme
        : AppTheme.lightTheme);
  }
}
