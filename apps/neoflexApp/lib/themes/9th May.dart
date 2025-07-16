import 'package:flutter/material.dart';

class NinthMayScreen extends StatelessWidget {
  const NinthMayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFF0505), // #FF0505 (красный)
                Color(0xFFFF853F), // #FF853F (оранжевый)
                Color(0xFF994836), // #994836 (коричневато-красный)
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/9_may/up.png',
                  width: 450,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/9_may/down.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.7,
                  child: Image.asset(
                    'assets/images/9_may/neoflex.png',
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
