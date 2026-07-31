import 'package:flutter/material.dart';

import '../widgets/homework_card.dart';
import '../widgets/homework_empty_widget.dart';

class HomeworkPage extends StatelessWidget {
  const HomeworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Future me ye Firebase se aayega
    final List<Map<String, String>> homeworkList = [
      {
        "subject": "Mathematics",
        "title": "Complete Chapter 5 Exercise",
        "teacher": "Mr. Sharma",
        "dueDate": "05 Aug 2026",
        "status": "Pending",
      },
      {
        "subject": "Science",
        "title": "Prepare Solar System Project",
        "teacher": "Mrs. Patel",
        "dueDate": "07 Aug 2026",
        "status": "Completed",
      },
      {
        "subject": "English",
        "title": "Read Chapter 8 and write summary",
        "teacher": "Ms. Shah",
        "dueDate": "09 Aug 2026",
        "status": "Pending",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Homework"),
        centerTitle: true,
      ),

      body: homeworkList.isEmpty
          ? const HomeworkEmptyWidget()
          : Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              decoration: InputDecoration(
                hintText: "Search Homework...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: homeworkList.length,
                itemBuilder: (context, index) {
                  final homework = homeworkList[index];

                  return HomeworkCard(
                    subject: homework["subject"]!,
                    title: homework["title"]!,
                    teacher: homework["teacher"]!,
                    dueDate: homework["dueDate"]!,
                    status: homework["status"]!,
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}