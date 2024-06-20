import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/task_cubit.dart';

class TaskFilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _filterButton(context, TaskFilter.all, 'Todas'),
        _filterButton(context, TaskFilter.completed, 'Completadas'),
        _filterButton(context, TaskFilter.incomplete, 'Incompletas'),
      ],
    );
  }

  Widget _filterButton(BuildContext context, TaskFilter filter, String text) {
    final currentFilter = context.watch<TaskCubit>().state['filter'];
    final bool isSelected = currentFilter == filter;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: OutlinedButton(
        onPressed: () {
          context.read<TaskCubit>().updateFilter(filter);
        },
        style: OutlinedButton.styleFrom(
          primary: isSelected ? Theme.of(context).colorScheme.secondary : Colors.grey,
          side: BorderSide(color: isSelected ? Theme.of(context).colorScheme.secondary : Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
