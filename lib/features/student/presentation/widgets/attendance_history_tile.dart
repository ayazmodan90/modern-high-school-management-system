import 'package:flutter/material.dart';

class AttendanceHistoryTile extends StatelessWidget {
  final String date;
  final String status;

  const AttendanceHistoryTile({
    super.key,
    required this.date,
    required this.status,
  });

  Color get statusColor {
    switch (status) {
      case "Present":
        return Colors.green;

      case "Absent":
        return Colors.red;

      case "Leave":
        return Colors.orange;

      default:
        return Colors.grey;
    }
  }

  IconData get statusIcon {
    switch (status) {
      case "Present":
        return Icons.check_circle;

      case "Absent":
        return Icons.cancel;

      case "Leave":
        return Icons.event_busy;

      default:
        return Icons.help;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(
          statusIcon,
          color: statusColor,
        ),
        title: Text(date),
        trailing: Text(
          status,
          style: TextStyle(
            color: statusColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}