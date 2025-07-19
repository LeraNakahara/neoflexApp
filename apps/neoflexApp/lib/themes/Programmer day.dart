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
            // Центр экрана — логотип и картинка
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/prog.png',
                    width: 230,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset('assets/neoflexlogo.png'),
                  ),
                ],
              ),
            ),

            // Нижнее изображение
            Positioned(
              bottom: -20,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/images/programmers_day/down.png',
                  height: 400,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                      'Не удалось загрузить изображение',
                      style: TextStyle(color: Colors.white),
                    );
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
