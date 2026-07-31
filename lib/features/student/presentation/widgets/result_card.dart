import 'package:flutter/material.dart';

import 'grade_badge.dart';

class ResultCard extends StatelessWidget {
  final String examName;
  final double percentage;
  final String grade;
  final int obtainedMarks;
  final int totalMarks;

  const ResultCard({
    super.key,
    required this.examName,
    required this.percentage,
    required this.grade,
    required this.obtainedMarks,
    required this.totalMarks,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Text(
              examName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Overall Percentage",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "${percentage.toStringAsFixed(1)}%",
              style: const TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 20),

            GradeBadge(
              grade: grade,
            ),

            const SizedBox(height: 25),

            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Text(
                  "Marks",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text(
                  "$obtainedMarks / $totalMarks",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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