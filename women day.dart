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
      duration:
          const Duration(seconds: 4), // Увеличили длительность до 4 секунд
      vsync: this,
    )..forward(); // Автоматический запуск анимации

    _positionAnimation = Tween<Offset>(
      begin: const Offset(0.1, 0.8), // Начальная позиция (левый низ)
      end: const Offset(1.5, -0.5), // Конечная позиция (правый верх)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 1.0, // Увеличили начальный размер
      end: 1.5, // Увеличили конечный размер
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
            // Цветок в левом верхнем углу
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/woman_day/flower_left.png',
                width: 180,
                fit: BoxFit.contain,
              ),
            ),

            // Цветок в правом верхнем углу
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/images/woman_day/flower_right.png',
                width: 180,
                fit: BoxFit.contain,
              ),
            ),

            // Изображение neoflex по центру
            Center(
              child: Image.asset(
                'assets/images/woman_day/neoflex.png',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
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
                      width: 120, // Увеличили размер бабочки
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),

            // Изображение внизу экрана
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
