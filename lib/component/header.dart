import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onIconPressed;
  final bool isTitleCentered;

  const Header({
    Key? key,
    required this.title,
    this.icon,
    this.onIconPressed,
    this.isTitleCentered = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: screenHeight * 0.27,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF0B55), Color(0xFFCF0F47)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),
        
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: isTitleCentered 
                  ? MainAxisAlignment.center 
                  : MainAxisAlignment.spaceBetween,
              children: [
                if (!isTitleCentered) 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),

                if (icon != null) 
                  IconButton(
                    icon: Icon(icon, color: Colors.white),
                    onPressed: onIconPressed,
                  ),

                if (isTitleCentered)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
