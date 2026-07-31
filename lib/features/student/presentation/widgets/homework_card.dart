import 'package:flutter/material.dart';

import 'homework_status_chip.dart';

class HomeworkCard extends StatelessWidget {
  final String subject;
  final String title;
  final String teacher;
  final String dueDate;
  final String status;

  const HomeworkCard({
    super.key,
    required this.subject,
    required this.title,
    required this.teacher,
    required this.dueDate,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [

                CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: const Icon(
                    Icons.menu_book,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    subject,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                HomeworkStatusChip(
                  status: status,
                ),

              ],
            ),

            const SizedBox(height: 18),

            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [

                const Icon(
                  Icons.person_outline,
                  size: 18,
                  color: Colors.grey,
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    teacher,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [

                const Icon(
                  Icons.calendar_today_outlined,
                  size: 18,
                  color: Colors.grey,
                ),

                const SizedBox(width: 8),

                Text(
                  "Due: $dueDate",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}