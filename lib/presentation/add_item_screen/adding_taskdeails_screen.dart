// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do/application/adding_details_bloc/adding_details_bloc.dart';
import 'package:to_do/application/adding_details_bloc/adding_details_event.dart';
import 'package:to_do/application/adding_details_bloc/adding_details_state.dart';
import 'package:to_do/common/widgets/container/input_field.dart';
import 'package:to_do/utils/constants/colors.dart';

class AddDetailScreen extends StatelessWidget {
  const AddDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController headingController = TextEditingController();
    final TextEditingController detailsController = TextEditingController();
    String date = '';
    String startTime = '';
    String endTime = '';
    int remind = 0;
    String repeat = '';
    int color=0;
    void validateAndSaveTask() {
      final heading = headingController.text.trim();
      final details = detailsController.text.trim();

      if (heading.isEmpty || details.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill in all fields')),
        );
        return;
      }
      context.read<AddDetailBloc>().add(TaskSaved(
          headingController: headingController,
          detailsController: detailsController,
          startTime: startTime,
          endTime: endTime,
          remind: remind,
          repeat: repeat,
          color: color,
          date: date));

      Navigator.pop(context);
    }

    return BlocProvider(
      create: (_) => AddDetailBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add details',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocBuilder<AddDetailBloc, AddDetailState>(
              builder: (context, state) {
                return Column(
                  children: [
                    MyInputField(
                      hint: 'Enter the task title',
                      title: 'Title',
                      hight: 1,
                      controller: headingController,
                    ),
                    MyInputField(
                      hint: 'Enter the task details',
                      title: 'Details',
                      hight: 3,
                      controller: detailsController,
                    ),
                    MyInputField(
                      hint: DateFormat.yMMMMEEEEd().format(state.selectedDate),
                      title: 'Date',
                      hight: 1,
                      widget: IconButton(
                        onPressed: () {
                          _getDateFromUser(context);
                        },
                        icon: const Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyInputField(
                            hint: state.startTime,
                            title: 'Start Time',
                            hight: 1,
                            widget: IconButton(
                              onPressed: () =>
                                  _getTimeFromUser(context, isStartTime: true),
                              icon: const Icon(
                                Icons.access_time,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: MyInputField(
                            hint: state.endTime,
                            title: 'End Time',
                            hight: 1,
                            widget: IconButton(
                              onPressed: () =>
                                  _getTimeFromUser(context, isStartTime: false),
                              icon: const Icon(
                                Icons.access_time,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    MyInputField(
                      hint: "${state.selectedRemind} minutes early",
                      title: 'Remind',
                      hight: 1,
                      widget: DropdownButton(
                        items: _buildDropdownMenuItems(state.remindList),
                        onChanged: (String? newValue) {
                          context
                              .read<AddDetailBloc>()
                              .add(RemindChanged(int.parse(newValue!)));
                        },
                        underline: Container(height: 0),
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Colors.grey),
                        iconSize: 32,
                        elevation: 4,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    MyInputField(
                      hint: state.selectedRepeat,
                      title: 'Repeat',
                      hight: 1,
                      widget: DropdownButton(
                        items: _buildDropdownMenuItems(state.repeatList),
                        onChanged: (String? newValue) {
                          context
                              .read<AddDetailBloc>()
                              .add(RepeatChanged(newValue!));
                        },
                        underline: Container(height: 0),
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Colors.grey),
                        iconSize: 32,
                        elevation: 4,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Color",
                                style: Theme.of(context).textTheme.bodyMedium),
                            Wrap(
                              children: List<Widget>.generate(3, (int index) {
                                return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<AddDetailBloc>()
                                        .add(ColorChanged(index));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: index == 0
                                          ? Tcolors.primary
                                          : index == 1
                                              ? Tcolors.error
                                              : Tcolors.warning,
                                      child: state.selectedColorIndex == index
                                          ? const Icon(Icons.done,
                                              color: Tcolors.white, size: 16)
                                          : Container(),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            date = DateFormat.yMMMMEEEEd()
                                .format(state.selectedDate);
                            startTime = state.startTime;
                            endTime = state.endTime;
                            remind = state.selectedRemind;
                            repeat = state.selectedRepeat;
                            color = state.selectedColorIndex;
                            validateAndSaveTask();
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('Create Task'),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Helper functions for date and time picking
  Future<void> _getDateFromUser(BuildContext context) async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    if (pickerDate != null) {
      context.read<AddDetailBloc>().add(DateChanged(pickerDate));
    }
  }

  Future<void> _getTimeFromUser(BuildContext context,
      {required bool isStartTime}) async {
    var pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.input);

    if (pickedTime != null) {
      String formattedTime = pickedTime.format(context);
      
      if (isStartTime) {
        context.read<AddDetailBloc>().add(StartTimeChanged(formattedTime));
      } else {
        context.read<AddDetailBloc>().add(EndTimeChanged(formattedTime));
      }
    }
  }

  List<DropdownMenuItem<String>> _buildDropdownMenuItems(List<dynamic> list) {
    return list.map<DropdownMenuItem<String>>((value) {
      return DropdownMenuItem<String>(
        value: value.toString(),
        child: Text(value.toString()),
      );
    }).toList();
  }
}
