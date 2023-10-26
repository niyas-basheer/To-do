

// ignore_for_file: depend_on_referenced_packages, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/widgets/color.dart';
import 'package:to_do_app/database/databasefunction.dart';
import 'package:to_do_app/database/taskclass.dart';
import 'package:to_do_app/home/complited.dart';
import 'package:to_do_app/home/pending.dart';
import 'package:to_do_app/taskmanager/taskdisplay.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';



class HomePageContent extends StatefulWidget {
 
  const HomePageContent({Key? key});

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  int currentIndex = 0;
  List<String> selectedtask = [];
  List<Task> tasks = [];
  DatabaseManager databaseManager = DatabaseManager();


  @override
  void initState() {
    super.initState();
    loadTasks();
   
  }
 

  Future<void> loadTasks() async {
    databaseManager.loadTasks(tasks, selectedtask);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildTaskList(context),
    );
  }

 
  Widget _buildTaskList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildSearchBarAndButton(context),
          const SizedBox(height: 10),
          _buildPendingTasks(context, "Completed Tasks", const ComplitedTask()),
          _buildHorizontalListView(),
          _buildPendingTasks(context, "Pending Tasks", const PendingTask()),
           VerticalListViewWidget(),
        ],
      ),
    );
  }

  Widget _buildSearchBarAndButton(BuildContext context) {
    final GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

    return Column(
      children: [
        AutoCompleteTextField<String>(
          key: key,
          clearOnSubmit: false,
          suggestions: selectedtask,
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: const Icon(Icons.search, color: blackcolor),
            fillColor: notselectedcolr,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          style: const TextStyle(color: blackcolor),
          itemFilter: (item, query) {
            return item.toLowerCase().contains(query.toLowerCase());
          },
          itemSorter: (a, b) {
            return a.compareTo(b);
          },
          itemSubmitted: (item) {
            final selectedTask = tasks.firstWhere((task) => task.heading == item);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskDetailPage(taskId: tasks.indexOf(selectedTask)),
              ),
            );
          },
          itemBuilder: (context, item) {
            return ListTile(
              title: Text(item),
            );
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

Widget _buildHorizontalListView() {
  return ValueListenableBuilder(
    valueListenable: Hive.box<Task>('tasks').listenable(), 
    builder: (context, Box<Task> box, child) {
      final completedTasks = box.values.where((task) {
        return task.subtasks.every((subtask) => subtask.isCompleted);
      }).toList();

      return SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: completedTasks.length,
          itemBuilder: (context, index) {
            final task = completedTasks[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskDetailPage(taskId: tasks.indexOf(task)),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                color: notselectedcolr,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 160,
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    task.heading,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: blackcolor,
                      fontFamily: 'DelaGothicOne',
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}


  Widget _buildPendingTasks(BuildContext context, String title, Widget route) {
    return Row(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: blackcolor,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => route,
              ),
            );
          },
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 10,
              color: blackcolor,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Text(
            "See all",
            style: TextStyle(color: secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15
            ),
          ),
        ),
      ],
    );
  }




}

class VerticalListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
  return ValueListenableBuilder(
    valueListenable: Hive.box<Task>('tasks').listenable(),
    builder: (context, Box<Task> box, child) {
      final incompleteTasks = box.values.where((task) {
        return task.subtasks.any((subtask) => !subtask.isCompleted);
      }).toList();

      return Expanded(
        child: SizedBox(
          height: 300,
          child: ListView.separated(
            itemCount: incompleteTasks.length,
            separatorBuilder: (context, index) => const Divider(
              color: white,
              thickness: 10,
            ),
            itemBuilder:(context, index) {
           final task = incompleteTasks[index];
            final int pendingTaskCount =
                task.subtasks.where((subtask) => !subtask.isCompleted).length;
            final String startingDate = task.startDate != null
                ? DateFormat('dd-MM-yyyy')
                    .format(DateTime.parse(task.startDate!))
                : "Not specified";
              
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDetailPage(taskId: box.values.toList().indexOf(task)),
                    ),
                  );
                },
                child: Container(
                  width: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: notselectedcolr,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child:  Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                task.heading,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: blackcolor,
                                  fontFamily: 'DelaGothicOne',
                                ),
                              ),
                              Text(
                                'Starting Date: $startingDate',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: blackcolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              '$pendingTaskCount',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: blackcolor,
                              ),
                            ),
                            const Text(
                              'Pending',
                              style: TextStyle(
                                fontSize: 14,
                                color: blackcolor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}

  }


class TaskSearchBar extends StatelessWidget {
  final Box<Task> taskBox;

  const TaskSearchBar({required this.taskBox});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

    return Column(
      children: [
        AutoCompleteTextField<String>(
          key: key,
          clearOnSubmit: false,
          suggestions: _getPendingTaskHeadings(taskBox),
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: const Icon(Icons.search, color: blackcolor),
            fillColor: notselectedcolr,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          style: const TextStyle(color: blackcolor),
          itemFilter: (item, query) {
            return item.toLowerCase().contains(query.toLowerCase());
          },
          itemSorter: (a, b) {
            return a.compareTo(b);
          },
          itemSubmitted: (item) {
            final selectedTask = taskBox.values.firstWhere((task) => task.heading == item);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskDetailPage(taskId: taskBox.values.toList().indexOf(selectedTask)),
              ),
            );
          },
          itemBuilder: (context, item) {
            return ListTile(
              title: Text(item),
            );
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  List<String> _getPendingTaskHeadings(Box<Task> box) {
    final incompleteTasks = box.values.where((task) {
      return task.subtasks.any((subtask) => !subtask.isCompleted);
    }).toList();

    return incompleteTasks.map((task) => task.heading).toList();
  }
}

class VerticalListViewcompleted extends StatelessWidget {
  const VerticalListViewcompleted({super.key});

  @override
  Widget build(BuildContext context) {
  
 return ValueListenableBuilder(
    valueListenable: Hive.box<Task>('tasks').listenable(), 
    builder: (context, Box<Task> box, child) {
      final completedTasks = box.values.where((task) {
        return task.subtasks.every((subtask) => subtask.isCompleted);
      }).toList();

      return Expanded(
        child: SizedBox(
          height: 300,
          child: ListView.separated(
            itemCount: completedTasks.length,
            separatorBuilder: (context, index) => const Divider(
              color: white,
              thickness: 10,
            ),
            itemBuilder: (context, index) {
              final task = completedTasks[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDetailPage(taskId: box.values.toList().indexOf(task)),
                    ),
                  );
                },
                child: Container(
                  width: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: notselectedcolr,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          task.heading,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: blackcolor,
                            fontFamily: 'DelaGothicOne',
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          task.details,
                          style: const TextStyle(
                            fontSize: 14,
                            color: blackcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}

  }

class CompletedTaskSearchBar extends StatelessWidget {
  final Box<Task> taskBox;

  const CompletedTaskSearchBar({required this.taskBox});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

    return Column(
      children: [
        AutoCompleteTextField<String>(
          key: key,
          clearOnSubmit: false,
          suggestions: _getCompletedTaskHeadings(taskBox),
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: const Icon(Icons.search, color: blackcolor),
            fillColor: notselectedcolr,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          style: const TextStyle(color: blackcolor),
          itemFilter: (item, query) {
            return item.toLowerCase().contains(query.toLowerCase());
          },
          itemSorter: (a, b) {
            return a.compareTo(b);
          },
          itemSubmitted: (item) {
            final selectedTask = taskBox.values.firstWhere((task) => task.heading == item);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskDetailPage(taskId: taskBox.values.toList().indexOf(selectedTask)),
              ),
            );
          },
          itemBuilder: (context, item) {
            return ListTile(
              title: Text(item),
            );
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  List<String> _getCompletedTaskHeadings(Box<Task> box) {
    final completedTasks = box.values.where((task) {
      return task.subtasks.every((subtask) => subtask.isCompleted);
    }).toList();

    return completedTasks.map((task) => task.heading).toList();
  }
}
