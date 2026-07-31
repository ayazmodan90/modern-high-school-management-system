import 'package:flutter/material.dart';

import '../widgets/result_card.dart';
import '../widgets/marks_table.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> marks = [
      {
        "subject": "Mathematics",
        "marks": 95,
        "grade": "A+",
      },
      {
        "subject": "Science",
        "marks": 90,
        "grade": "A",
      },
      {
        "subject": "English",
        "marks": 89,
        "grade": "A",
      },
      {
        "subject": "Computer",
        "marks": 98,
        "grade": "A+",
      },
      {
        "subject": "Gujarati",
        "marks": 88,
        "grade": "A",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Exam Results"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const ResultCard(
              examName: "Final Examination 2026",
              percentage: 92.0,
              grade: "A+",
              obtainedMarks: 460,
              totalMarks: 500,
            ),

            const SizedBox(height: 20),

            MarksTable(
              marks: marks,
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "PDF Download feature coming soon...",
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text(
                  "Download Result PDF",
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}