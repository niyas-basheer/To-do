import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do/application/home_bloc/home_event.dart';
import 'package:to_do/application/home_bloc/home_state.dart';
import 'package:to_do/domain/model/task_model/task_model.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // final NotificationFunction _notificationFunction = NotificationFunction();

  HomeBloc() : super(HomeInitialState()) {
    on<FetchTasks>((event, emit) async {
      emit(TaskLoading());

      final box = Hive.box<Task>('tasks');
      final completedTasks = box.values.toList();

      if (completedTasks.isEmpty) {
        emit(TaskEmpty());
      } else {
        emit(TaskLoaded(completedTasks));
      }
    });

    on<LoadTasksForDateEvent>((event, emit) {
      final box = Hive.box<Task>('tasks');
      final tasksForSelectedDate = box.values
          .where((task) => task.date == event.selectedDate || task.repeat == 'Daily')
          .toList();

      emit(TaskLoaded(tasksForSelectedDate));

    });

   
  }
}
