
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/database/taskclass.dart';

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

class DatabaseService {
  Future<void> addOrUpdateTask(Task task) async {
    final taskBox = await Hive.openBox<Task>('tasks');

    if (task.key != null) {
      taskBox.put(task.key, task);
    } else {
      taskBox.add(task);
    }
  }

  static Future<Box<Task>> openTaskBox() async {
    return await Hive.openBox<Task>('tasks');
  }

  static Future<void> updateTask(Task task, int index) async {
    final taskBox = await openTaskBox();
    await taskBox.putAt(index, task);
  }
}



