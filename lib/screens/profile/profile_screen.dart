import 'package:flutter/material.dart';
import 'package:intern_task_tracker/screens/auth/auth_screen.dart';
import 'package:intern_task_tracker/utils/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sarah Johnson',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('sarah.j@example.com', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            const Chip(
              label: Text('Intern'),
              backgroundColor: AppTheme.primaryColor,
              labelStyle: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const AuthScreen()),
                      (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
