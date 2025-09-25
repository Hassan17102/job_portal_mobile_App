import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intern_task_tracker/screens/auth/auth_screen.dart';
import 'package:intern_task_tracker/screens/auth/signup_screen.dart'; // Import the sign up screen
import 'package:intern_task_tracker/screens/main_screen.dart';
import 'package:intern_task_tracker/utils/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with proper options
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intern Task Tracker',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      // Use a StreamBuilder to listen for authentication state changes.
      // This will automatically show the correct screen (Auth or Main)
      // depending on whether the user is logged in.
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for the auth state
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasData) {
            // User is signed in, navigate to MainScreen.
            // You can add logic here to determine isAdmin based on user data
            // (e.g., from Firestore or a custom claim). For now, we'll
            // assume a default state or pass a value.
            return const MainScreen(isAdmin: true); // You may want to fetch this value dynamically.
          }
          // User is not signed in, show AuthScreen.
          return const AuthScreen();
        },
      ),
    );
  }
}
