import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AddDetailEvent extends Equatable {
  const AddDetailEvent();
  
  @override
  List<Object?> get props => [];
}

class DateChanged extends AddDetailEvent {
  final DateTime date;

  const DateChanged(this.date);

  @override
  List<Object?> get props => [date];
}

class StartTimeChanged extends AddDetailEvent {
  final String startTime;

  const StartTimeChanged(this.startTime);

  @override
  List<Object?> get props => [startTime];
}

class EndTimeChanged extends AddDetailEvent {
  final String endTime;

  const EndTimeChanged(this.endTime);

  @override
  List<Object?> get props => [endTime];
}

class RemindChanged extends AddDetailEvent {
  final int remind;

  const RemindChanged(this.remind);

  @override
  List<Object?> get props => [remind];
}

class RepeatChanged extends AddDetailEvent {
  final String repeat;

  const RepeatChanged(this.repeat);

  @override
  List<Object?> get props => [repeat];
}

class ColorChanged extends AddDetailEvent {
  final int colorIndex;

  const ColorChanged(this.colorIndex);

  @override
  List<Object?> get props => [colorIndex];
}

class ValidateInput extends AddDetailEvent {
  final String heading;
  final String details;

  const ValidateInput({required this.heading, required this.details});
  
}
class TaskSaved extends AddDetailEvent {
  final TextEditingController headingController;
  final TextEditingController detailsController;
  final String date;
   final String startTime ;
   final String endTime ;
   final int remind ;
   final String repeat ;
   final int color;

  const TaskSaved({
  required this.headingController,
   required this.detailsController ,
   required this.date 
   ,required this.endTime
   ,required this.startTime
   ,required this.remind
   ,required this.color
   ,required this.repeat});
}
