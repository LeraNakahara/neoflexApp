import 'package:flutter/material.dart';
//import 'firstList.dart';
//import 'holiday_themes.dart';
import 'themes/new_year.dart';
import 'themes/labor_day.dart';
import 'themes/patriot_day.dart';
import 'themes/russia_day.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Праздничное приложение',
      debugShowCheckedModeBanner: false,
      home: const RussiaDay()
    );
  }
}