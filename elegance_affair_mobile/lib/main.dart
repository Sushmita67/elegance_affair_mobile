import 'package:elegance_affair_mobile/view/Signup_screen.dart'; // Correct import
import 'package:elegance_affair_mobile/view/home_page_screen.dart';
import 'package:elegance_affair_mobile/view/home_screen.dart';
import 'package:elegance_affair_mobile/view/login_screen.dart';
import 'package:elegance_affair_mobile/view/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jewelry App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set initial route to splash screen
      routes: {
        '/': (context) => const OnboardingScreen(), // Onboarding screen route
        '/home': (context) => const HomeScreen(), // Home screen route
        '/login': (context) => const LoginPage(), // Login page route
        '/signup': (context) => const SignUpPage(), // SignUp page route
        '/homepage': (context) => const MainPageScreen(), // Home screen route
      },
    );
  }
}
