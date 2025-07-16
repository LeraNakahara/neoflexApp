import 'package:flutter/material.dart';

class ProgrammerDayScreen extends StatelessWidget {
  const ProgrammerDayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF915A89),
              Color(0xFFFB7EEF),
              Color(0xFF98FFFD),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Центральное изображение neoflex_2.png
            Center(
              child: Image.asset(
                'assets/images/programmers_day/neoflex_2.png',
                width: 250, // Настройте размер по необходимости
                height: 250,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Не удалось загрузить изображение',
                      style: TextStyle(color: Colors.white));
                },
              ),
            ),

            // Изображение внизу экрана
            Positioned(
              bottom: -20,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/images/programmers_day/down.png',
                  height: 500,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text('Не удалось загрузить изображение',
                        style: TextStyle(color: Colors.white));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
