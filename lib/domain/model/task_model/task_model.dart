import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  late int taskId;

  @HiveField(1)
  late String heading;

  @HiveField(2)
  late String details;

  @HiveField(3)
  late int isCompleted;

  @HiveField(4)
  late String startDate;

  @HiveField(5)
  late String endDate;

  @HiveField(6)
  late String date;

  @HiveField(7)
  late int color;

  @HiveField(8)
  late int remind;

  @HiveField(9)
  late String repeat;

  Task({
    required this.heading,
    required this.details,
    required this.isCompleted,
    required this.startDate,
    required this.endDate,
    required int taskId,
    required this.color,
    required this.date,
    required this.remind,
    required this.repeat,
    // ignore: prefer_initializing_formals
  }) : taskId = taskId;

  static int _lastTaskId = 0;

  factory Task.createTask({
    required String heading,
    required String details,
    required int isCompleted,
    required String startDate,
    required String endDate,
    required int taskId,
    required int color,
    required String date,
    required int remind,
    required String repeat,
  }) {
    _lastTaskId++;
    return Task(
      taskId: _lastTaskId,
      heading: heading,
      details: details,
      startDate: startDate,
      endDate: endDate,
      isCompleted: isCompleted,
      color: color,
      date: date,
      remind: remind,
      repeat: repeat,
    );
  }
}
