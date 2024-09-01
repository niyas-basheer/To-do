import 'package:to_do/domain/model/task_model/task_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState{}


class TaskLoading extends HomeState {}
class TaskLoaded extends HomeState {
  final List<Task> tasks;
  TaskLoaded(this.tasks,);
}
class TaskEmpty extends HomeState {}