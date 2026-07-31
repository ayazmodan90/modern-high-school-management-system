import 'package:flutter/material.dart';

class TimetableEmptyWidget extends StatelessWidget {
  const TimetableEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              Icons.event_busy_outlined,
              size: 90,
              color: Colors.grey.shade400,
            ),

            const SizedBox(height: 20),

            const Text(
              "No Classes Scheduled",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Enjoy your free day! There are no classes scheduled today.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}