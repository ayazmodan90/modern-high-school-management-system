import 'package:flutter/material.dart';
import 'dashboard_item.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.15,
      children: [
        DashboardItem(
          title: "Attendance",
          icon: Icons.fact_check,
          color: Colors.green,
          onTap: () {},
        ),
        DashboardItem(
          title: "Homework",
          icon: Icons.menu_book,
          color: Colors.orange,
          onTap: () {},
        ),
        DashboardItem(
          title: "Results",
          icon: Icons.bar_chart,
          color: Colors.blue,
          onTap: () {},
        ),
        DashboardItem(
          title: "Profile",
          icon: Icons.person,
          color: Colors.purple,
          onTap: () {},
        ),
      ],
    );
  }
}