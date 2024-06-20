import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/task_cubit.dart';
import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.description,
        style: TextStyle(
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (_) {
          context.read<TaskCubit>().toggleTaskCompletion(task);
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final TextEditingController controller =
                  TextEditingController(text: task.description);
              return AlertDialog(
                title: Text('Editar Tarefa'),
                content: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'Descrição da Tarefa',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        final updatedTask = Task(
                          description: controller.text,
                          isCompleted: task.isCompleted,
                        );
                        context.read<TaskCubit>().editTask(task, updatedTask);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Salvar'),
                  ),
                ],
              );
            },
          );
        },
      ),
      onLongPress: () {
        context.read<TaskCubit>().removeTask(task);
      },
    );
  }
}
