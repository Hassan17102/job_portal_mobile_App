import 'package:flutter/material.dart';
import 'package:intern_task_tracker/models/task.dart';
import 'package:intern_task_tracker/utils/app_theme.dart';
import 'package:intern_task_tracker/widgets/gradient_button.dart';

void showUpdateTaskModal(BuildContext context, Task task) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (context) {
      final bottomInset = MediaQuery.of(context).viewInsets.bottom;

      return Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, bottomInset + 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Text(
                'Update Task',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Title & Description
              Text(
                task.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                task.description,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Current status
              Row(
                children: [
                  const Text(
                    'Current Status: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Chip(
                    label: Text(task.status.name.replaceAll('_', ' ')),
                    backgroundColor:
                    task.status == TaskStatus.completed ? Colors.green : Colors.blue,
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                ],
              ),

              // Progress
              Row(
                children: [
                  const Text(
                    'Progress: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('${task.progress}%'),
                ],
              ),

              const Divider(height: 30),

              // Update progress options
              const Text(
                'Update Progress:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              Wrap(
                spacing: 10,
                children: [
                  _buildProgressChip('25%'),
                  _buildProgressChip('50%'),
                  _buildProgressChip('75%'),
                  _buildProgressChip('Complete'),
                ],
              ),

              const SizedBox(height: 20),

              // Save button
              GradientButton(
                text: 'Save Changes',
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildProgressChip(String label) {
  return ActionChip(
    label: Text(label),
    onPressed: () {
      // TODO: Implement progress update logic
    },
    backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
    labelStyle: const TextStyle(fontWeight: FontWeight.w500),
  );
}
