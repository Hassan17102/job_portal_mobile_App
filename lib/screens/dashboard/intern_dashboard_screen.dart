import 'package:flutter/material.dart';
import 'package:intern_task_tracker/models/task.dart';
import 'package:intern_task_tracker/widgets/task_card.dart';
import 'package:intern_task_tracker/widgets/update_task_modal.dart';

class InternDashboardScreen extends StatelessWidget {
  const InternDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final List<Task> tasks = getDummyTasks().where((t) => t.status != TaskStatus.completed).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Good afternoon, Sarah!'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).textTheme.bodyMedium?.color,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('6', 'Completed'),
                _buildStatItem('2', 'In Progress'),
                _buildStatItem('3', 'Pending'),
              ],
            ),
            const SizedBox(height: 30),
            // My Tasks Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My Tasks", style: Theme.of(context).textTheme.headlineSmall),
                TextButton(onPressed: () {}, child: const Text("View All"))
              ],
            ),
            const SizedBox(height: 10),
            // Task List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  task: tasks[index],
                  onTap: () => showUpdateTaskModal(context, tasks[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}