import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_231011700253/component/header.dart';
import 'package:project_231011700253/component/toast_dialog.dart';
import 'package:project_231011700253/model/list_item_model.dart';
import 'package:project_231011700253/views/list_data/list_detail_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    final List<ListItem> listItems = [
      ListItem(
        title: 'Pertemuan 1',
        shortDesc: 'Pengenalan & Instalasi Flutter',
        desc:
            'Pada pertemuan ini dibahas mengenai pengenalan Flutter, manfaatnya dalam pengembangan aplikasi mobile, serta panduan instalasi Flutter dan tools pendukung.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        icon: Icons.flutter_dash,
      ),
      ListItem(
        title: 'Pertemuan 2',
        shortDesc: 'Widget pada Android',
        desc:
            'Pertemuan ini membahas berbagai jenis widget dalam Flutter, cara menggunakannya untuk membangun UI, serta prinsip layouting dalam aplikasi.',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        icon: Icons.widgets,
      ),
      ListItem(
        title: 'Pertemuan 3',
        shortDesc: 'Activity dan Intent',
        desc:
            'Materi ini menjelaskan peran Activity sebagai komponen utama aplikasi Android dan bagaimana Intent digunakan untuk berpindah halaman dan membawa data.',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        icon: Icons.screen_rotation,
      ),
      ListItem(
        title: 'Pertemuan 4',
        shortDesc: 'Toast dan Alert Dialog',
        desc:
            'Dalam sesi ini, dibahas cara menampilkan pesan singkat menggunakan Toast serta membuat kotak dialog interaktif menggunakan AlertDialog.',
        createdAt: DateTime.now().subtract(const Duration(days: 4)),
        icon: Icons.notification_important,
      ),
      ListItem(
        title: 'Pertemuan 5',
        shortDesc: 'List View',
        desc:
            'Pertemuan ini fokus membahas cara menampilkan daftar data secara dinamis menggunakan ListView di Flutter, lengkap dengan scroll dan builder.',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        icon: Icons.view_list,
      ),
      ListItem(
        title: 'Pertemuan 6',
        shortDesc: 'Checkbox',
        desc:
            'Materi ini menjelaskan bagaimana membuat dan mengelola Checkbox di Flutter untuk menangani pilihan ganda dari pengguna.',
        createdAt: DateTime.now().subtract(const Duration(days: 6)),
        icon: Icons.check_box,
      ),
      ListItem(
        title: 'Pertemuan 7',
        shortDesc: 'Radio Button',
        desc:
            'Pada pertemuan ini dibahas penggunaan Radio Button di Flutter untuk menangani input pilihan tunggal serta pengelolaan state-nya.',
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
        icon: Icons.radio_button_checked,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(
            title: 'List Data',
            icon: Icons.search,
            onIconPressed: () {
              toastDialog(
                context: context,
                title: 'Search',
                description: 'ini tombol search',
                onConfirm: () {},
              );
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                final item = listItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(item: item),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFCF0F47),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        item.shortDesc,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF1F1F1F),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        DateFormat(
                                          'yyyy-MM-dd HH:mm',
                                        ).format(item.createdAt),
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFF1F1F1F),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
