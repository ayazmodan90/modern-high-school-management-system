import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AttendanceProgress extends StatelessWidget {
  final double percentage;

  const AttendanceProgress({
    super.key,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: CircularPercentIndicator(
            radius: 85,
            lineWidth: 12,
            animation: true,
            animationDuration: 1200,
            percent: percentage / 100,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.green,
            backgroundColor: Colors.grey.shade300,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${percentage.toInt()}%",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Attendance",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}