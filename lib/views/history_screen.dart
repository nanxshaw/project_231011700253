import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_231011700253/component/button.dart';
import 'package:project_231011700253/component/header.dart';
import 'package:project_231011700253/model/history_model.dart'; // Untuk format tanggal

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<HistoryItem> historyItems = [
      HistoryItem(
        title: 'Push Day Workout',
        shortDesc: 'Chest, Shoulders & Triceps',
        desc:
            'Incline bench press, shoulder press, tricep dips, cable fly. Duration: 1h 15m.',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
        icon: Icons.fitness_center,
        link: 'https://example.com/push-day',
      ),
      HistoryItem(
        title: 'Leg Day Gains',
        shortDesc: 'Quads, Hamstrings & Calves',
        desc:
            'Squats, Romanian deadlifts, leg press, seated calf raises. Don’t skip leg day!',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        icon: Icons.directions_run,
        link: 'https://example.com/leg-day',
      ),
      HistoryItem(
        title: 'Full Body HIIT',
        shortDesc: 'High intensity interval training',
        desc:
            '20 min HIIT with burpees, jumping jacks, mountain climbers, and kettlebell swings.',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        icon: Icons.flash_on,
        link: 'https://example.com/full-body-hiit',
      ),
      HistoryItem(
        title: 'Stretch & Recovery',
        shortDesc: 'Active recovery session',
        desc:
            'Foam rolling, yoga poses, deep breathing. Helps improve flexibility and reduce soreness.',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        icon: Icons.self_improvement,
        link: 'https://example.com/stretch-recovery',
      ),
      HistoryItem(
        title: 'Nutrition for Muscle Growth',
        shortDesc: 'Fuel your gains',
        desc:
            'Learn about macros, meal timing, supplements, and recipes for muscle mass.',
        createdAt: DateTime.now().subtract(const Duration(days: 4)),
        icon: Icons.restaurant,
        link: 'https://example.com/gym-nutrition',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(
            title: 'Riwayat',
            icon: Icons.search,
            onIconPressed: () {
              print("Search Icon Tapped");
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: historyItems.length,
              itemBuilder: (context, index) {
                final item = historyItems[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                            children: [
                              Icon(item.icon,
                                  size: 40, color: Color(0xFFCF0F47)),
                              SizedBox(width: 10),
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFCF0F47),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            item.shortDesc,
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF1F1F1F)),
                          ),
                          SizedBox(height: 8),
                          Text(
                            DateFormat('yyyy-MM-dd HH:mm')
                                .format(item.createdAt),
                            style: TextStyle(
                                fontSize: 10, color: Color(0xFF1F1F1F)),
                          ),
                          Button(
                            text: 'Detail',
                            alignment: Alignment.bottomRight,
                            onPressed: () {
                              print('Tombol Diklik');
                            },
                          )
                        ],
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
