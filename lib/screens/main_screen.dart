import 'package:flutter/material.dart';
import 'package:intern_task_tracker/screens/dashboard/admin_dashboard_screen.dart';
import 'package:intern_task_tracker/screens/dashboard/intern_dashboard_screen.dart';
import 'package:intern_task_tracker/screens/profile/profile_screen.dart';
import 'package:intern_task_tracker/screens/reports/reports_screen.dart';
import 'package:intern_task_tracker/screens/tasks/create_edit_task_screen.dart';
import 'package:intern_task_tracker/screens/tasks/task_list_screen.dart';
import 'package:intern_task_tracker/utils/app_theme.dart';

class MainScreen extends StatefulWidget {
  final bool isAdmin;

  const MainScreen({super.key, required this.isAdmin});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _buildScreens() {
    return [
      widget.isAdmin ? const AdminDashboardScreen() : const InternDashboardScreen(),
      const TaskListScreen(),
      const ReportsScreen(),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = _buildScreens();
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      floatingActionButton: widget.isAdmin && _selectedIndex == 0
          ? FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateEditTaskScreen()),
          );
        },
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}