import 'package:flutter/material.dart';
import 'themes/new_year.dart';
import 'themes/labor_day.dart';
import 'themes/patriot_day.dart';
import 'themes/russia_day.dart';
import 'themes/9th May.dart';
import 'themes/Knowledge day.dart';
import 'themes/Programmer day.dart';
import 'themes/women day.dart';

/// Возвращает праздничный экран (Widget) по дате, либо экран-заглушку если не праздник
Widget getHolidayScreenForDate(DateTime date) {
  // Новый год: 25-31 декабря
  if (date.month == 12 && date.day >= 25 && date.day <= 31) {
    return const NewYear();
  }
  // 9 мая
  if (date.month == 5 && date.day == 9) {
    return const NinthMayScreen();
  }
  // 1 мая
  if (date.month == 5 && date.day == 1) {
    return const LaborDay();
  }
  // 23 февраля
  if (date.month == 2 && date.day == 23) {
    return const PatriotDay();
  }
  // 12 июня
  if (date.month == 6 && date.day == 12) {
    return const RussiaDay();
  }
  // 1 сентября
  if (date.month == 9 && date.day == 1) {
    return const KnowledgeDayScreen();
  }
  // 8 марта
  if (date.month == 3 && date.day == 8) {
    return const WomenDayScreen();
  }
  // День программиста (256-й день года)
  final isLeap = (date.year % 4 == 0 && date.year % 100 != 0) || (date.year % 400 == 0);
  if ((isLeap && date.month == 9 && date.day == 12) || (!isLeap && date.month == 9 && date.day == 13)) {
    return const ProgrammerDayScreen();
  }
  // Не праздник
  return Scaffold(
    appBar: AppBar(title: const Text('Сегодня не праздник')),
    body: const Center(child: Text('Сегодня нет праздничной темы', style: TextStyle(fontSize: 24))),
  );
}