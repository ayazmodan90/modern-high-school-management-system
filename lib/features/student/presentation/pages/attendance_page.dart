import 'package:flutter/material.dart';
import '../widgets/attendance_progress.dart';
import '../widgets/attendance_card.dart';
import '../widgets/attendance_calendar.dart';
import '../widgets/attendance_history_tile.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Attendance Summary",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const AttendanceProgress(
              percentage: 93,
            ),

            const SizedBox(height: 25),

            const SizedBox(height: 15),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: const [

                AttendanceCard(
                  title: "Present",
                  value: "26",
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),

                AttendanceCard(
                  title: "Absent",
                  value: "2",
                  icon: Icons.cancel,
                  color: Colors.red,
                ),

                AttendanceCard(
                  title: "Leave",
                  value: "1",
                  icon: Icons.event_busy,
                  color: Colors.orange,
                ),

                AttendanceCard(
                  title: "Attendance",
                  value: "93%",
                  icon: Icons.analytics,
                  color: Colors.blue,
                ),

              ],
            ),

            const SizedBox(height: 25),

            const AttendanceCalendar(),

            const SizedBox(height: 25),

            const Text(
              "Attendance History",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const AttendanceHistoryTile(
              date: "30 Jul 2026",
              status: "Present",
            ),

            const AttendanceHistoryTile(
              date: "29 Jul 2026",
              status: "Present",
            ),

            const AttendanceHistoryTile(
              date: "28 Jul 2026",
              status: "Absent",
            ),

            const AttendanceHistoryTile(
              date: "27 Jul 2026",
              status: "Leave",
            ),

            const AttendanceHistoryTile(
              date: "26 Jul 2026",
              status: "Present",
            ),
          ],
        ),
      ),
    );
  }
}