
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:to_do/application/dashboard_bloc/dashboard_state.dart';
import 'package:to_do/domain/model/task_model/task_model.dart';
part 'dashboard_event.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final Box<Task> taskBox;  // Hive box for storing tasks

  DashboardBloc(this.taskBox) : super(DashboardInitial()) {
    on<ChangeDateRangeEvent>(_onChangeDateRange);
  }

  void _onChangeDateRange(ChangeDateRangeEvent event, Emitter<DashboardState> emit) {
    final tasks = _getTasksForDateRange(event.dateRange);
    emit(DashboardState(selectedDateRange: event.dateRange, tasks: tasks));
  }

  List<Task> _getTasksForDateRange(String dateRange) {
    DateTime now = DateTime.now();
    List<Task> filteredTasks;

    switch (dateRange) {
      case 'Week':
        DateTime weekStart = now.subtract(Duration(days: now.weekday - 1));
        filteredTasks = taskBox.values.where((task) => DateFormat.yMMMMEEEEd().parse(task.date).isAfter(weekStart)).toList();
        break;
      case 'Month':
        DateTime monthStart = DateTime(now.year, now.month, 1);
        filteredTasks = taskBox.values.where((task) =>  DateFormat.yMMMMEEEEd().parse(task.date).isAfter(monthStart)).toList();
        break;
      case 'Year':
        DateTime yearStart = DateTime(now.year, 1, 1);
        filteredTasks = taskBox.values.where((task) =>  DateFormat.yMMMMEEEEd().parse(task.date).isAfter(yearStart)).toList();
        break;
      default:
        filteredTasks = taskBox.values.toList();
        break;
    }

    return filteredTasks;
  }
}
