
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/widgets/color.dart';
import 'package:to_do_app/database/taskclass.dart';
import 'package:to_do_app/widgets/widgetshome.dart';


class PendingTask extends StatefulWidget {
  const PendingTask({super.key});

  @override
  State<PendingTask> createState() => _PendingTaskState();
}

class _PendingTaskState extends State<PendingTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
       
        title: const Padding(
          padding: EdgeInsets.only(right: 50.0),
          child: Center(
            child: Text(
              'Pending Task',
              style: TextStyle(
                fontSize: 15,
                color: blackcolor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        leading: BackButton(
          color: blackcolor,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TaskSearchBar(taskBox: Hive.box<Task>('tasks')), 
            VerticalListViewWidget(),
          ],
        ),
      ),
    );
  }
}
