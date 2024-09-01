
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/application/theme_bloc/theme_event.dart';
import 'package:to_do/application/theme_bloc/theme_state.dart';


class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial()) {
    on<ToggleThemeEvent>(_onToggleTheme);
    _loadTheme();
  }

  Future<void> _onToggleTheme(ToggleThemeEvent event, Emitter<ThemeState> emit) async {
    // ignore: unused_local_variable
    final newThemeMode = state.isDarkMode ? ThemeMode.dark : ThemeMode.light;
    emit(ThemeState(isDarkMode: !state.isDarkMode));

    // Save the new theme mode to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', !state.isDarkMode);
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    // ignore: invalid_use_of_visible_for_testing_member
    emit(ThemeState(isDarkMode: isDarkMode));
  }
}
