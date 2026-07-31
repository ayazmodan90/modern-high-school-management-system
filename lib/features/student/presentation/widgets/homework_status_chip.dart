import 'package:flutter/material.dart';

class HomeworkStatusChip extends StatelessWidget {
  final String status;

  const HomeworkStatusChip({
    super.key,
    required this.status,
  });

  Color get color {
    switch (status) {
      case "Completed":
        return Colors.green;

      case "Pending":
        return Colors.orange;

      case "Overdue":
        return Colors.red;

      default:
        return Colors.grey;
    }
  }

  IconData get icon {
    switch (status) {
      case "Completed":
        return Icons.check_circle;

      case "Pending":
        return Icons.schedule;

      case "Overdue":
        return Icons.warning;

      default:
        return Icons.help;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(
        icon,
        size: 18,
        color: color,
      ),
      label: Text(
        status,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: color.withOpacity(0.1),
      side: BorderSide.none,
    );
  }
}