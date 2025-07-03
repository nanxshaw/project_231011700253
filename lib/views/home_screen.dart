import 'package:flutter/material.dart';
import 'package:project_231011700253/component/header.dart';
// import 'package:project_231011700253/views/media/media_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Header(
            title: 'Dashboard',
            isTitleCentered: true,
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 160),
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Selamat Datang di Dashboard',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 16, right: 16),
                            child: Row(
                              children: [
                                _buildMenuCard(Icons.list_alt, 'List Data'),
                                const SizedBox(width: 10),
                                _buildMenuCard(Icons.add_box, 'Create Data'),
                                const SizedBox(width: 10),
                                _buildMenuCard(Icons.info_outline, 'About'),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(IconData icon, String label) {
    return Expanded(
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: InkWell(
          onTap: () {

          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: const Color(0xFF4A00E0),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
