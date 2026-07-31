import 'package:flutter/material.dart';

import '../widgets/notification_card.dart';
import '../widgets/notification_empty_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        "type": "Announcement",
        "title": "School Reopens",
        "message": "School will reopen from Monday at 8:00 AM.",
        "time": "Today",
        "isRead": false,
      },
      {
        "type": "Homework",
        "title": "Mathematics Homework",
        "message": "Complete Chapter 5 Exercise before tomorrow.",
        "time": "Yesterday",
        "isRead": false,
      },
      {
        "type": "Fees",
        "title": "Fee Reminder",
        "message": "Your pending fee of ₹15,000 is due on 10 Aug 2026.",
        "time": "2 Days Ago",
        "isRead": true,
      },
      {
        "type": "Exam",
        "title": "Unit Test Schedule",
        "message": "Unit Test will begin from 12 August 2026.",
        "time": "3 Days Ago",
        "isRead": true,
      },
      {
        "type": "Holiday",
        "title": "Independence Day Holiday",
        "message": "School will remain closed on 15 August.",
        "time": "1 Week Ago",
        "isRead": true,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: notifications.isEmpty
          ? const NotificationEmptyWidget()
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];

          return NotificationCard(
            type: item["type"],
            title: item["title"],
            message: item["message"],
            time: item["time"],
            isRead: item["isRead"],
          );
        },
      ),
    );
  }
}