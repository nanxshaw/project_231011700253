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
                  colors: [Color(0xFF4A00E0), Color(0xFF4A00E0)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),

        SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            height: screenHeight * 0.27,
            child: Stack(
              children: [
                if (icon != null)
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 48,
                      height: 48,
                      child: IconButton(
                        icon: Icon(icon, color: Colors.white),
                        onPressed: onIconPressed,
                        tooltip: 'Logout',
                      ),
                    ),
                  ),

                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
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
