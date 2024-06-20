import 'package:hive/hive.dart';
import '../models/task.dart';

class TaskRepository {
  final Box<Task> taskBox = Hive.box<Task>('tasks');

  List<Task> getTasks() {
    return taskBox.values.toList();
  }

  void addTask(Task task) {
    taskBox.add(task);
  }

  void updateTask(Task task) {
    task.save();
  }

  void removeTask(Task task) {
    task.delete();
  }
}
