import 'package:flutter/material.dart';
import 'package:project_231011700253/views/user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFA726), Color(0xFFD84315)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dashboard',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text(
                              'Selamat Datang, Nanang',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 16, right: 16),
                          child: Row(
                            children: [
                              _buildMenuCard(Icons.list_alt, 'List Data'),
                              SizedBox(
                                width: 10,
                              ),
                              _buildMenuCard(Icons.add_box, 'Create Data'),
                              SizedBox(
                                width: 10,
                              ),
                              _buildMenuCard(Icons.info_outline, 'About'),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )),
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
              offset: Offset(0, 4),
            )
          ],
        ),
        child: InkWell(
          onTap: () {
            print('Tapped on $label');
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Color(0xFFD84315),
              ),
              SizedBox(height: 12),
              Text(
                label,
                style: TextStyle(
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
