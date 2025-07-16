import 'package:flutter/material.dart';

class PatriotDay extends StatelessWidget {
  const PatriotDay ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFB4FF7F), 
              Color(0xFF019F3D), 
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Эмблема
            Positioned(
              top: 60,
              child: Image.asset(
                'assets/star.png', 
                width: 280,
              ),
            ),


            
         Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center, 
    children: [
      Container(
        margin: const EdgeInsets.all(10),
        child: Image.asset(
          'assets/militarylogo.png',
          width: 200, 
        ),
      ),

      const SizedBox(height: 30),

      const Text(
        'С Днём защитника\nОтечества!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          height: 1.3,
        ),
      ),
    ],
  ),
),


            // Танк
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/tank.png', 
                width: 310,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
