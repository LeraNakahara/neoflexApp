import 'package:flutter/material.dart';

class LaborDay extends StatefulWidget {
  const LaborDay({super.key});

  @override
  State<LaborDay> createState() => _LaborDayState();
}

class _LaborDayState extends State<LaborDay>
    with TickerProviderStateMixin {
  late final AnimationController _birdController;
late final Animation<double> _birdAnimation;
late final Animation<Offset> _birdOffset;

late final AnimationController _cloudController;
late final Animation<Offset> _cloudOffset;


 
@override
void initState() {
  super.initState();

 
_birdController = AnimationController(
  vsync: this,
  duration: const Duration(seconds: 10),
)..repeat(); 

_birdOffset = Tween<Offset>(
  begin: const Offset(1.2, 0), 
  end: const Offset(-1.2, 0),  
).animate(
  CurvedAnimation(
    parent: _birdController,
    curve: Curves.linear,
  ),
);


  
  _cloudController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 20),
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFEFF9FF),  
                  Color(0xFF2DA8F4),   
                  Color(0xFFFF7CB9),   
                ],
                stops: [0.0, 0.5, 1.0], 
              ),
            ),
          ),
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

          AnimatedBuilder(
  animation: _birdAnimation,
  builder: (context, child) {
    return Positioned(
      top: 60 + _birdAnimation.value,
      right: 10,
      child: SlideTransition(
        position: _birdOffset,
        child: Image.asset(
          'assets/birds.png',
          width: 120,
        ),
      ),
    );
  },
),


              Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/sun.png',
              width: 120,
            ),
          ),

  
          
           Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/lilac.png',
              height: 200,
            ),
          ),
          
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
              
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset('assets/neoflexlogo.png'),
                ),
                const SizedBox(height: 30),

                Text(
                  'Мир.Труд. Май',
                  style: TextStyle(fontSize:44, fontWeight: FontWeight.bold, color: Colors.white)
                )
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}