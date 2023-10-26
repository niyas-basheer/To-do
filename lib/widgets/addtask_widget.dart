import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/home/home.dart';
import 'package:to_do_app/widgets/color.dart';
import 'package:to_do_app/database/taskclass.dart';

class AddTaskForm extends StatefulWidget {
  final Task? task;

  AddTaskForm({Key? key, this.task}) : super(key: key);

  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDetailsController = TextEditingController();
  final TextEditingController subtaskController = TextEditingController();
  String taskHeading = "";
  String taskDetails = "";
  String subtask = "";
  List<Subtask> subtasksList = [];
  bool isEdit = false;
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      taskNameController.text = widget.task!.heading;
      taskDetailsController.text = widget.task!.details;
      taskHeading = widget.task!.heading;
      taskDetails = widget.task!.details;
      subtasksList = widget.task!.subtasks.cast<Subtask>();
      selectedStartDate = widget.task!.startDate != null
          ? DateTime.tryParse(widget.task!.startDate!)
          : null;

      selectedEndDate = widget.task!.endDate != null
          ? DateTime.tryParse(widget.task!.endDate!)
          : null;
      isEdit = true;
    }
  }

  void addTaskToDatabase() async {
    final newSubtasks = subtasksList.map((subtask) => Subtask(description: subtask.description)).toList();

    final newTask = Task.createTask(
      heading: taskHeading,
      details: taskDetails,
      subtasks: newSubtasks,
      startDate: selectedStartDate?.toString(),
      endDate: selectedEndDate?.toString(),
    );

    final taskBox = await Hive.openBox<Task>('tasks');

    if (isEdit && widget.task != null) {
      if (widget.task!.key != null) {
        taskBox.put(widget.task!.key, newTask);
      }
    } else {
      taskBox.add(newTask);
    }

    taskNameController.clear();
    taskDetailsController.clear();
    subtasksList.clear();
    selectedStartDate = null;
    selectedEndDate = null;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  Future<void> _showStartDatePicker(BuildContext context) async {
    final pickedStartDate = await showDatePicker(
      context: context,
      initialDate: selectedStartDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedStartDate != null) {
      setState(() {
        selectedStartDate = pickedStartDate;
      });
    }
  }

  Future<void> _showEndDatePicker(BuildContext context) async {
    final pickedEndDate = await showDatePicker(
      context: context,
      initialDate: selectedEndDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedEndDate != null) {
      setState(() {
        selectedEndDate = pickedEndDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Task Heading:',
              style: TextStyle(
                fontSize: 16,
                color: blackcolor,
              ),
            ),
            TextFormField(
              controller: taskNameController,
              style: const TextStyle(
                color: blackcolor,
              ),
              onChanged: (value) {
                setState(() {
                  taskHeading = value;
                });
              },
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Please enter task heading';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Task Details:',
              style: TextStyle(
                fontSize: 16,
                color: blackcolor,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              controller: taskDetailsController,
              style: const TextStyle(
                color: blackcolor,
              ),
              onChanged: (value) {
                setState(() {
                  taskDetails = value;
                });
              },
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Please enter task details';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Subtask:',
              style: TextStyle(
                fontSize: 16,
                color: blackcolor,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: subtaskController,
                    style: const TextStyle(
                      color: blackcolor,
                    ),
                    onChanged: (value) {
                      setState(() {
                        subtask = value;
                      });
                    },
                    validator: (value) {
                      if (subtasksList.isEmpty) {
                        return 'Please enter subtask details';
                      }
                      return null;
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add_box,
                    color: blackcolor,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      if (subtask.isNotEmpty) {
                        subtasksList.add(Subtask(description: subtask, isCompleted: false));
                        subtask = "";
                        subtaskController.text = "";
                      }
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Subtasks List:',
              style: TextStyle(
                fontSize: 16,
                color: blackcolor,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: subtasksList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      subtasksList[index].description, 
                      style: const TextStyle(
                        fontSize: 16,
                        color: blackcolor,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: blackcolor),
                      onPressed: () {
                        setState(() {
                          if (index >= 0 && index < subtasksList.length) {
                            subtasksList.removeAt(index);
                          }
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
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
                      onPressed: () {
                        _showStartDatePicker(context);
                      },
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
                      onPressed: () {
                        _showEndDatePicker(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    Text(
                      selectedStartDate != null
                          ? selectedStartDate!.toString().split(' ')[0]
                          : '',
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
                        selectedEndDate != null
                            ? selectedEndDate!.toString().split(' ')[0]
                            : '',
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
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  addTaskToDatabase();
                }
              },
              child: const Text('Create Task'),
            ),
          ],
        ),
      ),
    );
  }
}
