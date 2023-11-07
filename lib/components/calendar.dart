import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List getWeekdays() {
    DateTime now = DateTime.now();
    var sunday = now.subtract(Duration(days: now.weekday));
    List<DateTime> days = [];

    for (int i = 0; i < 7; i++) {
      days.add(sunday.add(Duration(days: i)));
    }

    return days;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: getWeekdays().map(
        (day) {
          String dayName = DateFormat('E').format(day);
          int todaysDate = DateTime.now().weekday;

          return Container(
            width: 46,
            height: 77,
            decoration: BoxDecoration(
                color: (todaysDate == day.weekday)
                    ? Colors.black
                    : const Color(0xffEBEBEB),
                borderRadius: const BorderRadius.all(Radius.circular(50.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dayName,
                  style: TextStyle(
                    letterSpacing: 3,
                    color: (todaysDate == day.weekday)
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                Text(
                  "${day.day}",
                  style: TextStyle(
                    fontSize: 18,
                    color: (todaysDate == day.weekday)
                        ? Colors.white
                        : Colors.black,
                  ),
                )
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
