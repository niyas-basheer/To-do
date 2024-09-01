abstract class AddItemEvent {}

class TaskAddedEvent extends AddItemEvent {}

class DateChangedEvent extends AddItemEvent {
  final DateTime selectedDate;

  DateChangedEvent(this.selectedDate);
}
