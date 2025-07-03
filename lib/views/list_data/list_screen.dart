import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:project_231011700253/component/date_time_dialog.dart';
// import 'package:project_231011700253/component/header.dart';
import 'package:project_231011700253/model/list_item_model.dart';
import 'package:project_231011700253/views/about/about_screen.dart';
import 'package:project_231011700253/views/list_data/list_detail_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<ListItem> allItems = [];
  List<ListItem> filteredItems = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    allItems = _generateListItems();
    filteredItems = List.from(allItems);
  }

  void _filterList(String query) {
    setState(() {
      filteredItems =
          allItems.where((item) {
            final lowerQuery = query.toLowerCase();
            return item.title.toLowerCase().contains(lowerQuery) ||
                item.shortDesc.toLowerCase().contains(lowerQuery);
          }).toList();
    });
  }

  List<ListItem> _generateListItems() {
    return [
      ListItem(
        title: 'Pertemuan 14',
        shortDesc: 'Google Map',
        desc:
            'Membahas integrasi Google Maps di Flutter menggunakan google_maps_flutter serta penambahan marker.',
        createdAt: DateTime.now().subtract(const Duration(days: 0)),
        icon: Icons.map,
        image: 'assets/images/google_map.webp',
      ),
      ListItem(
        title: 'Pertemuan 13',
        shortDesc: 'Multimedia: Audio & Video',
        desc:
            'Menjelaskan cara memutar audio dan video menggunakan plugin seperti audioplayers dan video_player.',
        createdAt: DateTime.now().subtract(const Duration(days: 0)),
        icon: Icons.multitrack_audio,
        image: 'assets/images/multimedia.png',
      ),
      ListItem(
        title: 'Pertemuan 12',
        shortDesc: 'Option Menu & Context Menu',
        desc:
            'Membahas pembuatan popup menu (options) dan menu kontekstual (long-press) di Flutter.',
        createdAt: DateTime.now().subtract(const Duration(days: 0)),
        icon: Icons.menu_open,
        image: 'assets/images/menu.jpg',
      ),
      ListItem(
        title: 'Pertemuan 11',
        shortDesc: 'Search View',
        desc:
            'Membahas cara menambahkan fitur pencarian menggunakan SearchDelegate untuk mencari item dalam daftar.',
        createdAt: DateTime.now().subtract(const Duration(days: 0)),
        icon: Icons.search,
        image: 'assets/images/search_view.png',
      ),
      ListItem(
        title: 'Pertemuan 10',
        shortDesc: 'Tab Layout',
        desc:
            'Membahas cara membuat TabBar dan TabBarView di Flutter, termasuk navigasi antar tab dan pengaturan konten.',
        createdAt: DateTime.now().subtract(const Duration(days: 0)),
        icon: Icons.tab,
        image: 'assets/images/tab_layout.png',
      ),
      ListItem(
        title: 'Pertemuan 9',
        shortDesc: 'Date Picker dan Time Picker',
        desc:
            'Penggunaan Date Picker dan Time Picker di Flutter untuk memilih tanggal dan waktu.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        icon: Icons.date_range,
        image: 'assets/images/date_time_picker.webp',
      ),
      ListItem(
        title: 'Pertemuan 8',
        shortDesc: 'Spinner / Dropdown / SelectBox',
        desc:
            'Penggunaan Spinner, Dropdown, dan SelectBox untuk memilih salah satu dari beberapa opsi.',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        icon: Icons.arrow_drop_down_circle,
        image: 'assets/images/dropdown.png',
      ),
      ListItem(
        title: 'Pertemuan 7',
        shortDesc: 'Radio Button',
        desc: 'Penggunaan Radio Button untuk input pilihan tunggal.',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        icon: Icons.radio_button_checked,
        image: 'assets/images/radio_button.webp',
      ),
      ListItem(
        title: 'Pertemuan 6',
        shortDesc: 'Checkbox',
        desc: 'Membuat dan mengelola Checkbox di Flutter untuk pilihan ganda.',
        createdAt: DateTime.now().subtract(const Duration(days: 4)),
        icon: Icons.check_box,
        image: 'assets/images/checkbox.png',
      ),
      ListItem(
        title: 'Pertemuan 5',
        shortDesc: 'List View',
        desc: 'Menampilkan daftar data secara dinamis dengan ListView.',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        icon: Icons.view_list,
        image: 'assets/images/listview.jpg',
      ),
      ListItem(
        title: 'Pertemuan 4',
        shortDesc: 'Toast dan Alert Dialog',
        desc:
            'Menampilkan pesan singkat dengan Toast dan kotak dialog menggunakan AlertDialog.',
        createdAt: DateTime.now().subtract(const Duration(days: 6)),
        icon: Icons.notification_important,
        image: 'assets/images/dialog.jpg',
      ),
      ListItem(
        title: 'Pertemuan 3',
        shortDesc: 'Activity dan Intent',
        desc:
            'Peran Activity dan penggunaan Intent untuk navigasi dan pengiriman data.',
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
        icon: Icons.screen_rotation,
        image: 'assets/images/intent.jpeg',
      ),
      ListItem(
        title: 'Pertemuan 2',
        shortDesc: 'Widget pada Android',
        desc: 'Jenis widget dalam Flutter dan cara penggunaannya.',
        createdAt: DateTime.now().subtract(const Duration(days: 8)),
        icon: Icons.widgets,
        image: 'assets/images/widget.webp',
      ),
      ListItem(
        title: 'Pertemuan 1',
        shortDesc: 'Pengenalan & Instalasi Flutter',
        desc:
            'Pengenalan Flutter dan panduan instalasi Flutter serta tools pendukung.',
        createdAt: DateTime.now().subtract(const Duration(days: 9)),
        icon: Icons.flutter_dash,
        image: 'assets/images/flutters.png',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF4A00E0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'List Data',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.info_outline, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AboutScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: searchController,
                  onChanged: _filterList,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Cari pertemuan...',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // List content
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
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
                            if (item.image != null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  item.image!,
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  item.icon,
                                  size: 24,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 8),
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
                                          color: Color(0xFF4A00E0),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item.shortDesc,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        DateFormat(
                                          'yyyy-MM-dd HH:mm',
                                        ).format(item.createdAt),
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
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
