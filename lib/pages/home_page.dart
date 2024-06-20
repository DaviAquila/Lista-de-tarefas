import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/task_cubit.dart';
import '../models/task.dart'; // Adiciona a importação do arquivo de modelo Task
import '../widgets/task_item.dart';
import '../widgets/task_filter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TaskFilterWidget(),
          Expanded(
            child: BlocBuilder<TaskCubit, Map<String, dynamic>>(
              builder: (context, state) {
                List<Task> tasks = context.read<TaskCubit>().filteredTasks;
                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return TaskItem(task: tasks[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Todas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Completas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_button_unchecked),
            label: 'Incompletas',
          ),
        ],
        onTap: (index) {
          TaskFilter filter;
          switch (index) {
            case 1:
              filter = TaskFilter.completed;
              break;
            case 2:
              filter = TaskFilter.incomplete;
              break;
            case 0:
            default:
              filter = TaskFilter.all;
              break;
          }
          context.read<TaskCubit>().updateFilter(filter);
        },
      ),
    );
  }
}
