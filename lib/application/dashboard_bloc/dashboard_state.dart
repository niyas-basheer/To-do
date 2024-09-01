

import 'package:equatable/equatable.dart';
import 'package:to_do/domain/model/task_model/task_model.dart';

class DashboardState extends Equatable {
  final String selectedDateRange;
  final List<Task> tasks;

  const DashboardState({required this.selectedDateRange, required this.tasks});

  @override
  List<Object> get props => [selectedDateRange, tasks];
}

class DashboardInitial extends DashboardState {
  DashboardInitial() : super(selectedDateRange: 'Week', tasks: []);
}
