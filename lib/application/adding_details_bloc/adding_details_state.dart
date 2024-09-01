import 'package:flutter/material.dart';

class AddDetailState {
   DateTime selectedDate;
  final String startTime;
  final String endTime;
  final int selectedRemind;
  final String selectedRepeat;
  final int selectedColorIndex;
  final List<int> remindList;
  final List<String> repeatList;
  final TextEditingController? heading;
  final TextEditingController? details;

  AddDetailState({
    required this.selectedDate,
    required this.startTime,
    required this.endTime,
    required this.selectedRemind,
    required this.selectedRepeat,
    required this.selectedColorIndex,
    this.heading ,
    this.details ,
    this.remindList = const [5, 10, 15, 20],
    this.repeatList = const ['None', 'Daily', 'Weekly', 'Monthly'],
  });

  AddDetailState copyWith({
    DateTime? selectedDate,
    String? startTime,
    String? endTime,
    int? selectedRemind,
    String? selectedRepeat,
    int? selectedColorIndex,
    TextEditingController? heading,
    TextEditingController? details, 
  }) {
    return AddDetailState(
      selectedDate: selectedDate ?? this.selectedDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      selectedRemind: selectedRemind ?? this.selectedRemind,
      selectedRepeat: selectedRepeat ?? this.selectedRepeat,
      selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
      heading: heading ?? this.heading,
      details: details ?? this.details,
      remindList: remindList,
      repeatList: repeatList,
    );
  }
}
