import 'package:flutter/material.dart';

class NewYear extends StatelessWidget {
  const NewYear({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // фон
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF040047),
                  Color(0xFF7240D5),
                  Color(0xFF9BD3FE),
                ],
              ),
            ),
          ),

          // падающий снег
          Positioned.fill(
            child: Image.asset(
              'assets/snowfall.png',
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.7),
            ),
          ),

          // снег лежит
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/snow.png',
              fit: BoxFit.contain,
            ),
          ),

          // снежинка 2
          Positioned(
          top: 0,
          left: 30,
          child: Column(
            children: [
              const SizedBox(height: 4),
              Image.asset(
                'assets/snowflake.png',
                width: 100,
                height: 200,
              ),
            ],
          ),
        ),

        // снежинка 1
        Positioned(
          top: 0,
          right: 30,
          child: Column(
            children: [
              const SizedBox(height: 4),
              Image.asset(
                'assets/snowflake.png',
                width: 100,
                height: 200,
              ),
            ],
          ),
        ),


         Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(
          'assets/tree.png',
          width: 130,
          height: 200,
        ),
        const SizedBox(width: 2),

        Image.asset(
          'assets/gift.png',
          width: 150,
          height: 100,
        ),
        const SizedBox(width: 4),

      
        Image.asset(
          'assets/snowman.png',
          width: 100,
          height: 100,
        ),
      ],
    ),
  ),
),


          
        Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      
      Image.asset(
        'assets/december.png', 
        width: 120,
      ),

      const SizedBox(height: 20),

    
      Container(
        margin: const EdgeInsets.all(10),
        child: Image.asset('assets/neoflexlogo.png'),
      ),
                
               Text(
    'С Новым\n${DateTime.now().year + 1}!',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: Colors.cyanAccent,
      shadows: [
        Shadow(
          blurRadius: 10,
          color: Colors.cyanAccent,
          offset: Offset(0, 0),
        ),
        Shadow(
          blurRadius: 20,
          color: Colors.cyanAccent.withOpacity(0.7),
          offset: Offset(0, 0),
        ),
        Shadow(
          blurRadius: 40,
          color: Colors.blueAccent.withOpacity(0.4),
          offset: Offset(0, 0),
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

