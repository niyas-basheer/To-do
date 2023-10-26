import 'package:hive/hive.dart';

part 'taskclass.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  late int taskId;

  @HiveField(1)
  late String heading;

  @HiveField(2)
  late String details;

  @HiveField(3)
  late List<Subtask> subtasks; 

  @HiveField(4)
  String? startDate;

  @HiveField(5)
  String? endDate;

  Task({
    required this.heading,
    required this.details,
    required this.subtasks,
    required this.startDate,
    required this.endDate,
    required int taskId,
  }) : taskId = taskId;

  static int _lastTaskId = 0;

  factory Task.createTask({
    required String heading,
    required String details,
    required List<Subtask> subtasks,
    String? startDate,
    String? endDate,
  }) {
    _lastTaskId++;
    return Task(
      taskId: _lastTaskId,
      heading: heading,
      details: details,
      subtasks: subtasks,
      startDate: startDate,
      endDate: endDate,
    );
  }

  int getCompletedSubtaskCount() {
    return subtasks.where((subtask) => subtask.isCompleted).length;
  }

  int getPendingSubtaskCount() {
    return subtasks.where((subtask) => !subtask.isCompleted).length;
  }
}

@HiveType(typeId: 2)
class Subtask {
  @HiveField(0)
  late String description;

  @HiveField(1)
  late bool isCompleted;

  Subtask({
    required this.description,
    this.isCompleted = false,
  });
}
