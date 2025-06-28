import 'package:flutter/material.dart';
import 'package:project_231011700253/views/auth/login_screen.dart';
// import 'package:project_231011700253/views/tab/bottom_nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi M',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFF0B55)),
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
      // home: BottomNavScreen(),
      home: LoginScreen(),
    );
  }
}
