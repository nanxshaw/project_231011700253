import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_231011700253/component/header.dart';
import 'package:project_231011700253/component/toast_dialog.dart';
import 'package:project_231011700253/model/menu_item.dart';
import 'package:project_231011700253/views/auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('is_logged_in');

    Fluttertoast.showToast(
      msg: 'Berhasil logout',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
      (route) => false,
    );
  }

  void _onLogoutDialog() {
    toastDialog(
      context: context,
      title: "Konfirmasi",
      description: 'Anda yakin ingin keluar?',
      onConfirm: _logout,
    );
  }

@override
Widget build(BuildContext context) {
  final List<MenuItem> menuItems = [
    MenuItem(title: 'Kelas', text: '04SIFE005', icon: Icons.class_),
    MenuItem(title: 'Email', text: 'nanxshaw@gmail.com', icon: Icons.email),
    MenuItem(title: 'No Telp', text: '+62 852 1301 0256', icon: Icons.phone),
    MenuItem(title: 'Universitas', text: 'Universitas Pamulang', icon: Icons.class_rounded),
  ];

  return Scaffold(
    backgroundColor: Colors.white,
    body: Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.only(top: 180),
          child: Column(
            children: [
              const SizedBox(height:80),
              const Text(
                'Nanang Tri Nur Wicaksono',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A00E0),
                ),
              ),
              const Text(
                'IT Developer & Engineer',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Developer berpengalaman di bidang web dan mobile app development. Menguasai Flutter, Golang, NodeJs, ReactJS/RN, dan manajemen server Linux. Terbiasa membangun sistem Absensi, POS, E-Commerce, Logistik, dll. Fokus pada efisiensi kode dan kualitas UI/UX.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ),
              const SizedBox(height: 20),
              Container(height: 10, color: Colors.grey[200]),
              const SizedBox(height: 10),
              const Text(
                'Informasi',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.only(top: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.5,
                  children: menuItems.map((item) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(item.icon, size: 16, color: Colors.grey[400]),
                            const SizedBox(width: 5),
                            Text(item.title, style: const TextStyle(fontSize: 13)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item.text,
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              Container(height: 10, color: Colors.grey[200]),
            ],
          ),
        ),

        Header(
          title: 'Profile',
          isTitleCentered: true,
          icon: Icons.logout,
          onIconPressed: _onLogoutDialog,
        ),

        Positioned(
          top: 140,
          left: MediaQuery.of(context).size.width / 2 - 50, 
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/user/profile.jpg'),
            ),
          ),
        ),
      ],
    ),
  );
}
}
