import 'package:flutter/material.dart';
import 'package:intern_task_tracker/models/task.dart';
import 'package:intern_task_tracker/widgets/task_card.dart';
import 'package:intern_task_tracker/widgets/update_task_modal.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = getDummyTasks();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list))],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TaskCard(
            task: task,
            onTap: () => showUpdateTaskModal(context, task),
          );
        },
      ),
    );
  }
}