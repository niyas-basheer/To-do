abstract class AddItemState {}

class AddItemInitial extends AddItemState {
  final DateTime initialDate;

  AddItemInitial(this.initialDate);
}

class TaskAddingState extends AddItemState {}

class TaskAddedState extends AddItemState {}

class DateChangedState extends AddItemState {
  final DateTime selectedDate;

  DateChangedState(this.selectedDate,);
}
