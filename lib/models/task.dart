enum TaskStatus { pending, inProgress, completed }

class Task {
  final String title;
  final String description;
  final DateTime deadline;
  final TaskStatus status;
  final int progress; // 0-100

  Task({
    required this.title,
    required this.description,
    required this.deadline,
    required this.status,
    this.progress = 0,
  });
}

// Dummy data for demonstration
List<Task> getDummyTasks() {
  return [
    Task(
      title: 'Complete User Research Analysis',
      description: 'Analyze user feedback and create a comprehensive report.',
      deadline: DateTime.now().add(const Duration(days: 5)),
      status: TaskStatus.inProgress,
      progress: 75,
    ),
    Task(
      title: 'Update Project Documentation',
      description: 'Review and update all project documentation files.',
      deadline: DateTime.now().add(const Duration(days: 10)),
      status: TaskStatus.pending,
      progress: 0,
    ),
    Task(
      title: 'Design Mobile App Wireframes',
      description: 'Create wireframes for new mobile application features.',
      deadline: DateTime.now().subtract(const Duration(days: 2)),
      status: TaskStatus.completed,
      progress: 100,
    ),
    Task(
      title: 'Prepare Weekly Status Report',
      description: 'Compile weekly progress report for team review.',
      deadline: DateTime.now().add(const Duration(days: -12)), // overdue
      status: TaskStatus.pending,
      progress: 10,
    ),
  ];
}