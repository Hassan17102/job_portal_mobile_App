import 'package:flutter/material.dart';
import 'package:intern_task_tracker/widgets/stat_card.dart';
import 'package:intern_task_tracker/screens/profile/profile_screen.dart'; // ✅ Import profile screen

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).textTheme.bodyMedium?.color,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                // ✅ Navigate to profile screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage("assets/profile.png"), // ✅ Replace with your own image
                backgroundColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Manage tasks and performance",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Stats Grid
            const Row(
              children: [
                Expanded(child: StatCard(count: 156, title: 'Total Tasks', color: Colors.blue)),
                SizedBox(width: 16),
                Expanded(child: StatCard(count: 89, title: 'Completed', color: Colors.green)),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(child: StatCard(count: 67, title: 'Pending', color: Colors.orange)),
                SizedBox(width: 16),
                Expanded(child: StatCard(count: 12, title: 'Overdue', color: Colors.red)),
              ],
            ),

            const SizedBox(height: 30),

            // Quick Actions
            Text("Quick Actions", style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _buildActionCard(context, Icons.people, 'Manage Users')),
                Expanded(child: _buildActionCard(context, Icons.bar_chart, 'View Reports')),
                Expanded(child: _buildActionCard(context, Icons.settings, 'Settings')),
                Expanded(child: _buildActionCard(context, Icons.edit, 'Edit Tasks')),
              ],
            ),

            const SizedBox(height: 30),

            // Recent Activity
            Text("Recent Activity", style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            _buildActivityItem('John Doe started User Research', '2 minutes ago'),
            _buildActivityItem('Sarah Johnson updated Mobile App Wireframes', '15 minutes ago'),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(icon, size: 28, color: Theme.of(context).primaryColor),
          ),
        ),
        const SizedBox(height: 16),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildActivityItem(String text, String time) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text(text),
        subtitle: Text(time),
      ),
    );
  }
}
