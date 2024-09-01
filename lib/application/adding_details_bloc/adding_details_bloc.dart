import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:to_do/application/adding_details_bloc/adding_details_event.dart';
import 'package:to_do/application/adding_details_bloc/adding_details_state.dart';
import 'package:to_do/domain/model/task_model/task_model.dart';
import 'package:to_do/utils/formatters/formatter.dart';


class AddDetailBloc extends Bloc<AddDetailEvent, AddDetailState> {
  AddDetailBloc()
      : super(AddDetailState(
        
          selectedDate: DateTime.now(),
          startTime: DateFormat('hh:mm a').format(DateTime.now()),
          endTime: "9:30 PM",
          selectedRemind: 5,
          selectedRepeat: 'None',
          selectedColorIndex: 0,
          
        )) {
    on<DateChanged>((event, emit) {
      emit(state.copyWith(selectedDate: event.date));
    });

    on<StartTimeChanged>((event, emit) {
      emit(state.copyWith(startTime: event.startTime));
    });

    on<EndTimeChanged>((event, emit) {
      emit(state.copyWith(endTime: event.endTime));
    });

    on<RemindChanged>((event, emit) {
      emit(state.copyWith(selectedRemind: event.remind));
    });

    on<RepeatChanged>((event, emit) {
      emit(state.copyWith(selectedRepeat: event.repeat));
    });

    on<ColorChanged>((event, emit) {
      emit(state.copyWith(selectedColorIndex: event.colorIndex));
    });

    // Handling SaveTask event
   on<TaskSaved>((event, emit) async {


  final task = Task.createTask(
    heading: event.headingController.text,
    details: event.detailsController.text,
    isCompleted: 0, 
    startDate: event.startTime,
    endDate: event.endTime,
    taskId: DateTime.now().millisecondsSinceEpoch,
    color: event.color,
    date: event.date,
    remind: event.remind,
    repeat: event.repeat,
  );

  await Hive.box<Task>('tasks').add(task);
DateTime s= TFormatter.parseTimeString(task.startDate);
TFormatter.calculateTimeLeftandsendNotification(event.date, s,event.headingController.text,event.detailsController.text,"${event.headingController.text} | ${event.detailsController.text} ");
 
                
  
                },
              );


  }
  
}
