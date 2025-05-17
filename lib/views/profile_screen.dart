import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_231011700253/component/button.dart';
import 'package:project_231011700253/component/button_border.dart';
import 'package:project_231011700253/component/header.dart';
import 'package:project_231011700253/component/toast_dialog.dart';
import 'package:project_231011700253/model/menu_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int counter = 0;
  int counter2 = 0;

  void _onClick(String label, String type) {
    setState(() {
      label == 'Ubah Profile' ? counter++ : counter2++;
    });

    toastDialog(
      context: context,
      title: "Notice",
      description: 'Anda ingin $label?',
      onConfirm: () {
        Fluttertoast.showToast(
          msg:
              'Tombol $label telah diklik : ${type == 'ubah_profile' ? counter : counter2}',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem(title: 'Kelas', text: '04SIFE005', icon: Icons.class_),
      MenuItem(title: 'Email', text: 'nanxshaw@gmail.com', icon: Icons.email),
      MenuItem(title: 'No Telp', text: '+62 852 1301 0256', icon: Icons.phone),
      MenuItem(
        title: 'Universitas',
        text: 'Universitas Pamulang',
        icon: Icons.class_rounded,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Header(title: 'Profile', isTitleCentered: true),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 140, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/user/profile.jpg'),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Nanang Tri Nur Wicaksono',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF0B55),
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
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      child: Button(
                        text: 'Ubah Profile',
                        isFullWidth: true,
                        onPressed: () {
                          _onClick('Ubah Profile', 'ubah_profile');
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ButtonBorder(
                        text: 'Membership',
                        isFullWidth: true,
                        onPressed: () {
                          _onClick('Membership', 'membership');
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 20),
                Container(height: 10, color: Colors.grey[200]),
                const SizedBox(height: 10),
                Text(
                  'Informasi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: EdgeInsets.only(top: 20),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 2.5,
                    children:
                        menuItems.map((item) {
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      item.icon,
                                      size: 16,
                                      color: Colors.grey[400],
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      item.title,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  item.text,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                  ),
                ),
                Container(height: 10, color: Colors.grey[200]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
