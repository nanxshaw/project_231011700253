import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_231011700253/component/border_border.dart';
import 'package:project_231011700253/component/button.dart';
import 'package:project_231011700253/component/header.dart';
import 'package:project_231011700253/component/toast_dialog.dart';
import 'package:project_231011700253/model/menu_item.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int counter = 0;
  int counter2 = 0;

  void _onClick(String label) {
    setState(() {
      label == 'Ubah' ? counter++ : counter2++;
    });

    toastDialog(
      context: context,
      title: "Notice",
      description: 'Anda ingin ${label}?',
      onConfirm: () {
        Fluttertoast.showToast(
          msg:
              'Tombol $label telah diklik : ${label == 'Ubah' ? counter : counter2}',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem(
        menu: 'Profile',
        link: '/profile',
        icon: Icons.person,
        color: Colors.black,
      ),
      MenuItem(
        menu: 'Membership',
        link: '/membership',
        icon: Icons.card_membership,
        color: Colors.black,
      ),
      MenuItem(
        menu: 'Forget Password',
        link: '/forget-password',
        icon: Icons.lock_reset,
        color: Colors.black,
      ),
      MenuItem(
        menu: 'Keluar',
        link: '/keluar',
        icon: Icons.exit_to_app,
        color: Colors.red,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Header(
            title: 'Profile',
            isTitleCentered: true,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 140, bottom: 24),
            child: Column(
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
                  '231011700253',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "I like the development of programming language technology...",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
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
                          _onClick('Ubah Profile');
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ButtonBorder(
                        text: 'Membership',
                        isFullWidth: true,
                        onPressed: () {
                          _onClick('Membership');
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, item.link);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        child: Row(
                          children: [
                            Icon(item.icon, size: 28, color: item.color),
                            const SizedBox(width: 16),
                            Text(
                              item.menu,
                              style: TextStyle(
                                fontSize: 16,
                                color: item.color,
                                fontWeight: item.menu.toLowerCase() == 'keluar'
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
