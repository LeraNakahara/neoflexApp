import 'package:flutter/material.dart';
import 'firstList.dart';
import 'themes/new_year.dart';
import 'themes/labor_day.dart';
import 'themes/patriot_day.dart';
import 'themes/russia_day.dart';
import 'themes/9th May.dart';
import 'themes/Knowledge day.dart';
import 'themes/Programmer day.dart';
import 'themes/women day.dart';


Widget getHolidayScreenForDate(DateTime date) {
  // Новый год: 25-31 декабря
  if (date.month == 12 && date.day >= 25 && date.day <= 31) {
    return FirstListScreen(holidayScreen: const NewYear());
  }
  // 9 мая
  if (date.month == 5 && date.day == 9) {
    return FirstListScreen(holidayScreen: const NinthMayScreen());
  }
  // 1 мая
  if (date.month == 5 && date.day == 1) {
    return FirstListScreen(holidayScreen: const LaborDay());
  }
  // 23 февраля
  if (date.month == 2 && date.day == 23) {
    return FirstListScreen(holidayScreen: const PatriotDay());
  }
  // 12 июня
  if (date.month == 6 && date.day == 12) {
    return FirstListScreen(holidayScreen: const RussiaDay());
  }
  // 1 сентября
  if (date.month == 9 && date.day == 1) {
    return FirstListScreen(holidayScreen: const KnowledgeDayScreen());
  }
  // 8 марта
  if (date.month == 3 && date.day == 8) {
    return FirstListScreen(holidayScreen: const WomenDayScreen());
  }
  // День программиста (256-й день года)
  final isLeap = (date.year % 4 == 0 && date.year % 100 != 0) || (date.year % 400 == 0);
  if ((isLeap && date.month == 9 && date.day == 12) || (!isLeap && date.month == 9 && date.day == 13)) {
    return FirstListScreen(holidayScreen: const ProgrammerDayScreen());
  }


  return FirstListScreen(
    holidayScreen: Scaffold(
      appBar: AppBar(title: const Text('Сегодня не праздник')),
      body: const Center(child: Text('Сегодня нет праздничной темы', style: TextStyle(fontSize: 24))),
    ),
  );
}