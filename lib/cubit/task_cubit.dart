import 'package:bloc/bloc.dart';
import '../models/task.dart';

enum TaskFilter { all, completed, incomplete }

class TaskCubit extends Cubit<Map<String, dynamic>> {
  TaskCubit() : super({'tasks': <Task>[], 'filter': TaskFilter.all});

  List<Task> get filteredTasks {
    final tasks = state['tasks'] as List<Task>;
    final filter = state['filter'] as TaskFilter;

    if (filter == TaskFilter.completed) {
      return tasks.where((task) => task.isCompleted).toList();
    } else if (filter == TaskFilter.incomplete) {
      return tasks.where((task) => !task.isCompleted).toList();
    } else {
      return tasks;
    }
  }

  void addTask(Task task) {
    final tasks = List<Task>.from(state['tasks'] as List<Task>);
    tasks.add(task);
    emit({'tasks': tasks, 'filter': state['filter']});
  }

  void toggleTaskCompletion(Task task) {
    final tasks = List<Task>.from(state['tasks'] as List<Task>);
    final taskIndex = tasks.indexOf(task);
    if (taskIndex != -1) {
      tasks[taskIndex] = Task(
        description: task.description,
        isCompleted: !task.isCompleted,
      );
      emit({'tasks': tasks, 'filter': state['filter']});
    }
  }

  void removeTask(Task task) {
    final tasks = List<Task>.from(state['tasks'] as List<Task>);
    tasks.remove(task);
    emit({'tasks': tasks, 'filter': state['filter']});
  }

  void editTask(Task oldTask, Task newTask) {
    final tasks = List<Task>.from(state['tasks'] as List<Task>);
    final taskIndex = tasks.indexOf(oldTask);
    if (taskIndex != -1) {
      tasks[taskIndex] = newTask;
      emit({'tasks': tasks, 'filter': state['filter']});
    }
  }

  void updateFilter(TaskFilter filter) {
    emit({'tasks': state['tasks'], 'filter': filter});
  }
}
