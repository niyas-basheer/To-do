

abstract class HomeEvent {}

class FetchTasks extends HomeEvent {}

class LoadTasksForDateEvent extends HomeEvent {
  final String selectedDate;

  LoadTasksForDateEvent(this.selectedDate);
}
