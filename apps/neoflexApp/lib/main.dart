import 'package:flutter/material.dart';
import 'holiday_themes.dart';

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
      home: const DateSelectionWrapper(),
    );
  }
}

class DateSelectionWrapper extends StatefulWidget {
  const DateSelectionWrapper({super.key});

  @override
  State<DateSelectionWrapper> createState() => _DateSelectionWrapperState();
}

class _DateSelectionWrapperState extends State<DateSelectionWrapper> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getHolidayScreenForDate(selectedDate),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (picked != null && picked != selectedDate) {
            setState(() {
              selectedDate = picked;
            });
          }
        },
        child: const Icon(Icons.calendar_today),
      ),
    );
  }
}