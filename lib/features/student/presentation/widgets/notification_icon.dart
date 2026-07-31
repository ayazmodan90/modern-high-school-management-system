import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  final String type;

  const NotificationIcon({
    super.key,
    required this.type,
  });

  IconData get icon {
    switch (type) {
      case "Announcement":
        return Icons.campaign;

      case "Homework":
        return Icons.menu_book;

      case "Exam":
        return Icons.assignment;

      case "Fees":
        return Icons.account_balance_wallet;

      case "Holiday":
        return Icons.beach_access;

      default:
        return Icons.notifications;
    }
  }

  Color get color {
    switch (type) {
      case "Announcement":
        return Colors.blue;

      case "Homework":
        return Colors.deepPurple;

      case "Exam":
        return Colors.orange;

      case "Fees":
        return Colors.green;

      case "Holiday":
        return Colors.red;

      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: color.withOpacity(0.15),
      child: Icon(
        icon,
        color: color,
        size: 26,
      ),
    );
  }
}