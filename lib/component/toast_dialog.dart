import 'package:flutter/material.dart';

void toastDialog({
  required BuildContext context,
  required String title,
  required String description,
  required VoidCallback onConfirm,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); 
              onConfirm(); 
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
