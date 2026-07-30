import 'package:flutter/material.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher Dashboard"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Welcome Teacher 👨‍🏫",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}