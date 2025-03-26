import 'package:ensala_mais/widgets/scheduling_dialog.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        selectedDayPredicate: (selectedDay) async {
          print(selectedDay);
          return showDialog(
            context: context,
            builder: (BuildContext context) => SchedulingDialog(
              selectedDay: selectedDay,
            ),
          );
        },
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
      ),
    );
  }
}
