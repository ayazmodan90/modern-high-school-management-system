import 'package:flutter/material.dart';
import 'dashboard_card.dart';
import '../pages/attendance_page.dart';
import '../pages/homework_page.dart';
import '../pages/timetable_page.dart';
import '../pages/results_page.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      childAspectRatio: 1.15,
      children: [

        DashboardCard(
          title: "Attendance",
          icon: Icons.fact_check,
          color: Colors.green,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AttendancePage(),
              ),
            );
          },
        ),

        DashboardCard(
          title: "Homework",
          icon: Icons.menu_book,
          color: Colors.deepPurple,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const HomeworkPage(),
              ),
            );
          },
        ),

        DashboardCard(
          title: "Results",
          icon: Icons.assessment,
          color: Colors.teal,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ResultsPage(),
              ),
            );
          },
        ),

        DashboardCard(
          title: "Timetable",
          icon: Icons.schedule,
          color: Colors.indigo,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const TimetablePage(),
              ),
            );
          },
        ),

      ],
    );
  }
}