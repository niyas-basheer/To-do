import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/application/bottem_nav_bar_bloc/bottem_nav_bar_event.dart';
import 'package:to_do/application/bottem_nav_bar_bloc/bottem_nav_bar_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(0)) {
    on<NavigateToPage>((event, emit) {
      emit(NavigationState(event.pageIndex));
    });
  }
}