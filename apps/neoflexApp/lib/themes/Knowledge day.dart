import 'package:flutter/material.dart';

class KnowledgeDayScreen extends StatelessWidget {
  const KnowledgeDayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFCA80), // #FFCA80 (верх)
              Color(0xFFFFB042), // #FFB042 (середина)
              Color(0xFFFF1313), // #FF1313 (низ)
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Листья в левом верхнем углу
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  'assets/images/knowledge_day/leaves_left.png',
                  width: screenWidth * 0.4,
                  fit: BoxFit.contain,
                ),
              ),

              // Листья в правом верхнем углу
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/knowledge_day/leaves_right.png',
                  width: screenWidth * 0.4,
                  fit: BoxFit.contain,
                ),
              ),

              // Центрированная колонка с bell.png и neoflex.png
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Изображение колокольчика (чуть выше центра)
                      Image.asset(
                        'assets/september.png',
                        width: screenWidth * 0.5,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      // Изображение neoflex (чуть ниже колокольчика)
                      Image.asset(
                        'assets/images/knowledge_day/neoflex.png',
                        width: screenWidth * 0.7,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                          height: screenHeight *
                              0.1), // Отступ для нижнего изображения
                    ],
                  ),
                ),
              ),

              // Изображение внизу экрана (центрированное)
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/images/knowledge_day/down.png',
                    width: screenWidth * 0.9,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
