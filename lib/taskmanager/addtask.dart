import 'package:flutter/material.dart';
import 'package:to_do_app/database/taskclass.dart';
import 'package:to_do_app/widgets/addtask_widget.dart';
import 'package:to_do_app/widgets/color.dart';


class AddTaskPage extends StatefulWidget {
  final Task? task;

  const AddTaskPage({Key? key, this.task}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Task',
          style: TextStyle(
            fontSize: 15,
            color: blackcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: BackButton(
          color: blackcolor,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AddTaskForm(task: widget.task),
      ),
    );
  }
}
