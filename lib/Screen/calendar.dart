import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Calendar'),
        backgroundColor: Colors.red.shade700,
      ),
      body: SafeArea(
        child: TableCalendar(
          firstDay: DateTime.utc(2010, 10, 20),
          lastDay: DateTime.utc(2040, 10, 20),
          focusedDay: DateTime.now(),
          headerVisible: true,
          daysOfWeekVisible: true,
          sixWeekMonthsEnforced: true,
          shouldFillViewport: false,
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w800,
            ),
          ),
          calendarStyle: CalendarStyle(
            todayTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
