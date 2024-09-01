

import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  final bool isDarkMode;

  const ThemeState({required this.isDarkMode});

  @override
  List<Object> get props => [isDarkMode];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial() : super(isDarkMode: false);
}
