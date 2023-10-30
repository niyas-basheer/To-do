// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/calander.dart/celender.dart';
import 'package:to_do_app/widgets/color.dart';
import 'package:to_do_app/taskmanager/addtask.dart';
import 'package:to_do_app/database/taskclass.dart';

class TaskDetailPage extends StatefulWidget {
  final int taskId;

  const TaskDetailPage({super.key, required this.taskId});

  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  Task? task;
  List<bool> completedSubtasks = [];

  @override
  void initState() {
    super.initState();
    loadTask();
  }

Future<void> loadTask() async {
  final taskBox = await Hive.openBox<Task>('tasks');
  if (widget.taskId >= 0 && widget.taskId < taskBox.length) {
    final Task? taskFromBox = taskBox.getAt(widget.taskId);
    if (taskFromBox != null) {
      setState(() {
        task = taskFromBox;
        completedSubtasks = List.generate(
          task!.subtasks.length,
          (index) => task!.subtasks[index].isCompleted,
        );
      });
    }
  } else {
    setState(() {
      task = null;
      completedSubtasks = [];
    });
  }
}



void toggleSubtaskCompletion(int index) {
  setState(() {
    completedSubtasks[index] = !completedSubtasks[index];
    task!.subtasks[index].isCompleted = completedSubtasks[index];
    updateTask(task!);

   
  });
}


  Future<void> updateTask(Task task) async {
    final taskBox = await Hive.openBox<Task>('tasks');
    await taskBox.putAt(widget.taskId, task);
  }

  void editTask() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AddTaskPage(task: task),
    ));
  }

  void deleteTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: const Text("Are you sure you want to delete this task?"),
          actions: <Widget>[
            FloatingActionButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FloatingActionButton(
              child: const Text("Delete"),
              onPressed: () {
                final taskBox = Hive.box<Task>('tasks');
                taskBox.deleteAt(widget.taskId);
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Calendar(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        
        title: const Padding(
          padding: EdgeInsets.only(right: 50.0),
          child: Center(
            child: Text(
              'Task Details',
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: editTask,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: deleteTask,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Container(
              width: 1.0 * MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Color.fromARGB(255, 185, 188, 199) ),
              child: Text(
                task?.heading ?? 'No task found',
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: blackcolor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            if (task != null)
              Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Starting Date: ',
                        style: TextStyle(
                          fontSize: 16,
                          color: blackcolor,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.calendar_today, color: blackcolor),
                        onPressed: () {},
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      const Text(
                        'Ending Date: ',
                        style: TextStyle(
                          fontSize: 16,
                          color: blackcolor,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.calendar_today, color: blackcolor),
                        onPressed: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 5.0),

                 
                  Row(
                    children: [
                      Text(
                        task!.startDate != null ? DateFormat('yyyy-MM-dd').format(DateTime.parse(task!.startDate!)) : 'Not selected',
                        
                        style: const TextStyle(
                          fontSize: 16,
                          color: blackcolor,
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: Text(
                          task!.endDate != null ? DateFormat('yyyy-MM-dd').format(DateTime.parse(task!.endDate!)) : 'Not selected',
                          style: const TextStyle(
                            fontSize: 16,
                            color: blackcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: 50.0),
            const Text(
              'Task Details:',
              style: TextStyle(
                fontSize: 16,
                color: blackcolor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              task?.details ?? 'No task found',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 120,
            ),
            const Text(
              'Subtasks:',
              style: TextStyle(
                fontSize: 16,
                color: blackcolor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            if (task != null && task!.subtasks.isNotEmpty)
              Column(
                children: List.generate(task!.subtasks.length, (index) {
                  final subtask = task!.subtasks[index].description;
                  final isCompleted = completedSubtasks[index];

                  return ListTile(
                    title: Text(
                      subtask ,
                      style: TextStyle(
                        fontSize: 20,
                        color:  blackcolor,
                        decoration:
                            isCompleted ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    onTap: () {
                      toggleSubtaskCompletion(index);
                    },
                  );
                }),
              ),
          ],
        ),
      ),
    );
  }
}



