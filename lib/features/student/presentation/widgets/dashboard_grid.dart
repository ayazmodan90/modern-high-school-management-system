import 'package:flutter/material.dart';
import 'dashboard_card.dart';

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
          onTap: () {},
        ),

        DashboardCard(
          title: "Homework",
          icon: Icons.menu_book,
          color: Colors.orange,
          onTap: () {},
        ),

        DashboardCard(
          title: "Results",
          icon: Icons.bar_chart,
          color: Colors.blue,
          onTap: () {},
        ),

        DashboardCard(
          title: "Timetable",
          icon: Icons.calendar_month,
          color: Colors.purple,
          onTap: () {},
        ),

      ],
    );
  }
}