import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/application/add_item_bloc/add_item_event.dart';
import 'package:to_do/application/add_item_bloc/add_item_state.dart';

class AddItemBloc extends Bloc<AddItemEvent, AddItemState> {
  AddItemBloc() : super(AddItemInitial(DateTime.now())) {
    on<TaskAddedEvent>((event, emit) async {
      emit(TaskAddingState());
      // Simulate task adding process
      await Future.delayed(const Duration(seconds: 1));
      emit(TaskAddedState());
    });

    on<DateChangedEvent>((event, emit) {
      emit(DateChangedState(event.selectedDate));
    });
  }
}
