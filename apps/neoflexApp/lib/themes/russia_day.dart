import 'package:flutter/material.dart';

class RussiaDay extends StatefulWidget {
  const RussiaDay({super.key});

  @override
  State<RussiaDay> createState() => _RussiaDayState();
}

class _RussiaDayState extends State<RussiaDay> with SingleTickerProviderStateMixin {
  late AnimationController _planeController;
  late Animation<Offset> _planeAnimation;

  @override
  void initState() {
    super.initState();

    _planeController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(); 

    _planeAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: const Offset(1.5, 0),
    ).animate(CurvedAnimation(
      parent: _planeController,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _planeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF96CAFF),
                  Color(0xFF71B8FF),
                  Color(0xFF014386),
                ],
              ),
            ),
          ),

          
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: SlideTransition(
              position: _planeAnimation,
              child: Center(
                child: Image.asset(
                  'assets/planes.png', 
                  width: 250,
                ),
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/neoflexlogo.png',
                  width: 200,
                ),
                const SizedBox(height: 30),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFF0009FF),
                      Color(0xFFFF0000),
                    ],
                  ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: const Text(
                    'С Днём России!',
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      color: Colors.white 
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

        
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/moscow.png',
              fit: BoxFit.contain,
              height: 350,
            ),
          ),
        ],
      ),
    );
  }
}


