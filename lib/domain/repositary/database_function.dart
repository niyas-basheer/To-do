
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/domain/model/task_model/task_model.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();
  factory DatabaseManager() => _instance;
  DatabaseManager._internal();

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskAdapter());
    await Hive.openBox<Task>('tasks');
  }

  Future<void> loadTasks(List<Task> tasks, List<String> selectedTask) async {
    final taskBox = await Hive.openBox<Task>('tasks');
    tasks.clear();
    selectedTask.clear();
    tasks.addAll(taskBox.values.toList());
    selectedTask.addAll(tasks.map((task) => task.heading).toList());
  }

  
}



