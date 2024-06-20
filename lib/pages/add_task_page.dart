import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/task_cubit.dart';
import '../models/task.dart';

class AddTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Descrição da Tarefa',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  final newTask = Task(description: _controller.text);
                  context.read<TaskCubit>().addTask(newTask);
                  Navigator.pop(context);
                }
              },
              child: Text('Adicionar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}
