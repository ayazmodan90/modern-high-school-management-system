import 'package:flutter/material.dart';

class PaymentStatusChip extends StatelessWidget {
  final String status;

  const PaymentStatusChip({
    super.key,
    required this.status,
  });

  Color get statusColor {
    switch (status) {
      case "Paid":
        return Colors.green;

      case "Pending":
        return Colors.orange;

      case "Overdue":
        return Colors.red;

      default:
        return Colors.grey;
    }
  }

  IconData get statusIcon {
    switch (status) {
      case "Paid":
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
        statusIcon,
        color: statusColor,
        size: 18,
      ),
      label: Text(
        status,
        style: TextStyle(
          color: statusColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: statusColor.withOpacity(0.1),
      side: BorderSide.none,
    );
  }
}