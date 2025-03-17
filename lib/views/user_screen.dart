import 'package:flutter/material.dart';

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

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tombol $label telah diklik : ${label == 'Ubah' ? counter : counter2}'),
        duration: const Duration(seconds: 1),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFA726), Color(0xFFD84315)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // IconButton(
                      //   icon: const Icon(Icons.arrow_back, color: Colors.white),
                      //   onPressed: () {
                      //     Navigator.pop(context);
                      //   },
                      // ),
                      const Text(
                        'PROFILE',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      // IconButton(
                      //   icon: const Icon(Icons.settings, color: Colors.white),
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage:AssetImage('../../assets/user/profile.jpg')
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Nanang Tri Nur Wicaksono',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD84315),
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
                          "I like the development of programming language technology. because application development is the same as me developing my skills in the world of mobile developers. because of that I like challenges, because challenges I can be motivated.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD84315),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                            ),
                            onPressed: () {
                              _onClick('Ubah');
                            },
                            child: const Text('Ubah',
                                style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side:
                                    const BorderSide(color: Color(0xFFD84315)),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                            ),
                            onPressed: () {
                              _onClick('Kembali');
                            },
                            child: const Text('Kembali',
                                style: TextStyle(color: Color(0xFFD84315))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
