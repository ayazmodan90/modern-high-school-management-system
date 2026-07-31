import 'package:flutter/material.dart';

class GradeBadge extends StatelessWidget {
  final String grade;

  const GradeBadge({
    super.key,
    required this.grade,
  });

  Color get badgeColor {
    switch (grade) {
      case "A+":
        return Colors.green;

      case "A":
        return Colors.blue;

      case "B+":
        return Colors.orange;

      case "B":
        return Colors.deepOrange;

      case "C":
        return Colors.red;

      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        grade,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}