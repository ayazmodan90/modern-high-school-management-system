import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../auth/presentation/pages/login_page.dart';
import 'package:modern_high_school/features/auth/data/models/user_model.dart';
import '../../../auth/data/repositories/firestore_repository.dart';
import '../widgets/student_bottom_nav.dart';
import '../widgets/profile_card.dart';
import '../widgets/dashboard_grid.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final FirestoreRepository _firestoreRepository = FirestoreRepository();

  UserModel? user;
  bool isLoading = true;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      final data = await _firestoreRepository.getUser(uid);

      if (mounted) {
        setState(() {
          user = data;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
          (route) => false,
    );
  }
  void onTabChanged(int index) {
    setState(() {
      currentIndex = index;
    });

    switch (index) {
      case 0:
      // Home
        break;

      case 1:
      // Notifications (Next phase)
        break;

      case 2:
      // Profile (Next phase)
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),

        ),
      );
    }

    if (user == null) {
      return const Scaffold(
        body: Center(
          child: Text("User not found"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Dashboard"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            ProfileCard(
              name: user!.fullName,
              email: user!.email,
              role: user!.role,
            ),

            const SizedBox(height: 25),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            const DashboardGrid(),

          ],
        ),
      ),

      bottomNavigationBar: StudentBottomNav(
        currentIndex: currentIndex,
        onTap: onTabChanged,
      ),
    );
  }
}