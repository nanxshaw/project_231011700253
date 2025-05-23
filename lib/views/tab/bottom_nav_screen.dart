import 'package:flutter/material.dart';
import 'package:project_231011700253/views/home_screen.dart';
import 'package:project_231011700253/views/list_data/list_screen.dart';
import 'package:project_231011700253/views/profile_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ProfileScreen(),
    const ListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
        ],
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color(0xFFFF0B55),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
