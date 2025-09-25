import 'package:flutter/material.dart';
import 'package:intern_task_tracker/models/task.dart';
import 'package:intl/intl.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onTap;

  const TaskCard({super.key, required this.task, required this.onTap});

  @override
  Widget build(BuildContext context) {
    int daysLeft = task.deadline.difference(DateTime.now()).inDays;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      task.title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _buildStatusChip(task.status),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                task.description,
                style: const TextStyle(color: Colors.grey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              if (task.status != TaskStatus.completed)
                Column(
                  children: [
                    LinearProgressIndicator(
                      value: task.progress / 100,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Due: ${DateFormat.yMMMd().format(task.deadline)}',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  if (task.status != TaskStatus.completed)
                    Text(
                      '$daysLeft days left',
                      style: TextStyle(
                          color: daysLeft < 3 ? Colors.red : Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(TaskStatus status) {
    Color color;
    String text;

    switch (status) {
      case TaskStatus.pending:
        color = Colors.orange;
        text = 'Pending';
        break;
      case TaskStatus.inProgress:
        color = Colors.blue;
        text = 'In Progress';
        break;
      case TaskStatus.completed:
        color = Colors.green;
        text = 'Completed';
        break;
    }

    return Chip(
      label: Text(text, style: const TextStyle(color: Colors.white, fontSize: 10)),
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    );
  }
}