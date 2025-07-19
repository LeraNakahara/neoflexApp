import 'package:flutter/material.dart';

class LaborDay extends StatefulWidget {
  const LaborDay({super.key});

  @override
  State<LaborDay> createState() => _LaborDayState();
}

class _LaborDayState extends State<LaborDay> with TickerProviderStateMixin {
  late final AnimationController _birdController;
  late final AnimationController _cloudController;
  late final Animation<Offset> _cloudOffset;

  @override
  void initState() {
    super.initState();

   
    _birdController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    
    _cloudController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);

    _cloudOffset = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.1, 0),
    ).animate(
      CurvedAnimation(
        parent: _cloudController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _birdController.dispose();
    _cloudController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFEFF9FF), // Светло-голубой
                  Color(0xFF2DA8F4), // Голубой
                  Color(0xFFFF7CB9), // Розовый
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),

          // Анимация облаков
          Positioned(
            top: 80,
            left: 20,
            child: SlideTransition(
              position: _cloudOffset,
              child: Image.asset(
                'assets/clouds.png',
                width: 300,
              ),
            ),
          ),

          // Птица
          AnimatedBuilder(
            animation: _birdController,
            builder: (context, child) {
              final double birdWidth = 120;
              final double birdX = screenWidth * (1.2 - _birdController.value * 2.4);

              return Positioned(
                top: 60,
                left: birdX,
                child: Image.asset(
                  'assets/birds.png',
                  width: birdWidth,
                ),
              );
            },
          ),

          // Солнце
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/sun.png',
              width: 120,
            ),
          ),

          // Сирень
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/lilac.png',
              height: 200,
            ),
          ),

          // Яблоня
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/appletree.png',
              height: 250,
            ),
          ),

         
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Image.asset(
                    'assets/may1.png', 
                    width: 230,
                  ),

                  const SizedBox(height: 20),

                
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset('assets/neoflexlogo.png'),
                  ),
                const SizedBox(height: 30),
                const Text(
                  'Мир. Труд. Май',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black26,
                      )
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

