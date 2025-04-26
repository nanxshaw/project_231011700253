import 'package:flutter/material.dart';

class HistoryItem {
  final String title;
  final String shortDesc;
  final String desc;
  final DateTime createdAt;
  final IconData icon;
  final String link;
  final bool checked;

  HistoryItem({
    required this.title,
    required this.shortDesc,
    required this.desc,
    required this.createdAt,
    required this.icon,
    required this.link,
    required this.checked,
  });
}
