import 'package:flutter/material.dart';

class ButtonBorder extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Alignment alignment;
  final double borderWidth;
  final Color borderColor;
  final bool isFullWidth; // Tambahan

  const ButtonBorder({
    Key? key,
    required this.text,
    required this.onPressed,
    this.alignment = Alignment.center,
    this.borderWidth = 2.0,
    this.borderColor = const Color(0xFF4A00E0),
    this.isFullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xFF4A00E0),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return Align(
      alignment: alignment,
      child: isFullWidth
          ? SizedBox(width: double.infinity, child: button)
          : button,
    );
  }
}
