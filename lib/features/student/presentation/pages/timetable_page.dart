import 'package:flutter/material.dart';

import '../widgets/timetable_card.dart';
import '../widgets/timetable_day_selector.dart';
import '../widgets/timetable_empty_widget.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  int selectedDay = 0;

  final List<String> days = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];

  final Map<String, List<Map<String, dynamic>>> timetable = {
    "Mon": [
      {
        "subject": "Mathematics",
        "teacher": "Mr. Sharma",
        "room": "Room 101",
        "time": "08:00 - 09:00",
        "color": Colors.blue,
      },
      {
        "subject": "Science",
        "teacher": "Mrs. Patel",
        "room": "Lab 2",
        "time": "09:15 - 10:15",
        "color": Colors.green,
      },
      {
        "subject": "Computer",
        "teacher": "Mr. Khan",
        "room": "Lab 1",
        "time": "10:30 - 11:30",
        "color": Colors.deepPurple,
      },
    ],

    "Tue": [
      {
        "subject": "English",
        "teacher": "Ms. Shah",
        "room": "Room 202",
        "time": "08:00 - 09:00",
        "color": Colors.orange,
      },
    ],

    "Wed": [],
    "Thu": [],
    "Fri": [],
    "Sat": [],
  };

  @override
  Widget build(BuildContext context) {
    final today = days[selectedDay];
    final classes = timetable[today] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Class Timetable"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TimetableDaySelector(
              days: days,
              selectedIndex: selectedDay,
              onDaySelected: (index) {
                setState(() {
                  selectedDay = index;
                });
              },
            ),

            const SizedBox(height: 20),

            Expanded(
              child: classes.isEmpty
                  ? const TimetableEmptyWidget()
                  : ListView.builder(
                itemCount: classes.length,
                itemBuilder: (context, index) {
                  final item = classes[index];

                  return TimetableCard(
                    subject: item["subject"],
                    teacher: item["teacher"],
                    room: item["room"],
                    time: item["time"],
                    color: item["color"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}