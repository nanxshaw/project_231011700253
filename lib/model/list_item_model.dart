import 'package:flutter/material.dart';

class ListItem {
  final String title;
  final String shortDesc;
  final String desc;
  final DateTime createdAt;
  final IconData icon;

  ListItem({
    required this.title,
    required this.shortDesc,
    required this.desc,
    required this.createdAt,
    required this.icon,
  });
}
