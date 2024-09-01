import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/application/splash_bloc/splash_event.dart';
import 'package:to_do/application/splash_bloc/splash_state.dart';


class SplashBloc extends Bloc<SplashEvent, SplashState> {

  SplashBloc() : super(SplashInitialState()) {
    Timer(const Duration(seconds: 5), () {
      add(SplashLoadedEvent());
    });

    on<SplashLoadedEvent>((event, emit) async {
      
      emit(SplashLoadedState());
    });
  }
}
