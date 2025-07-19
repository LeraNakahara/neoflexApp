import 'package:flutter/material.dart';

class WomenDayScreen extends StatefulWidget {
  const WomenDayScreen({Key? key}) : super(key: key);

  @override
  State<WomenDayScreen> createState() => _WomenDayScreenState();
}

class _WomenDayScreenState extends State<WomenDayScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..forward();

    _positionAnimation = Tween<Offset>(
      begin: const Offset(0.1, 0.8),
      end: const Offset(1.5, -0.5),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFA8C9),
              Color(0xFFFFA8EF),
              Color(0xFFFF89C2),
              Color(0xFFF43669),
            ],
            stops: [0.0, 0.33, 0.66, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Цветки по углам
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/woman_day/flower_left.png',
                width: 180,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/images/woman_day/flower_right.png',
                width: 180,
                fit: BoxFit.contain,
              ),
            ),

            // Центр: картинка + логотип
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/march.png',
                    width: 230,
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/woman_day/neoflex.png',
                    width: 160,
                  ),
                ],
              ),
            ),

            // Анимированная бабочка
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Positioned(
                  left: MediaQuery.of(context).size.width *
                      _positionAnimation.value.dx,
                  top: MediaQuery.of(context).size.height *
                      _positionAnimation.value.dy,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Image.asset(
                      'assets/images/woman_day/but.png',
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),

            // Нижнее оформление
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/woman_day/down.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

