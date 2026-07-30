import 'package:flutter/material.dart';
import 'register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/firestore_repository.dart';
import 'package:modern_high_school/features/auth/data/models/user_model.dart';

import 'package:modern_high_school/features/student/presentation/pages/student_dashboard.dart';
import 'package:modern_high_school/features/teacher/presentation/pages/teacher_dashboard.dart';
import 'package:modern_high_school/features/parent/presentation/pages/parent_dashboard.dart';
import 'package:modern_high_school/features/admin/presentation/pages/admin_dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthRepository _authRepository = AuthRepository();
  final FirestoreRepository _firestoreRepository = FirestoreRepository();

  bool obscurePassword = true;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    try {
      UserCredential credential = await _authRepository.loginUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      UserModel? user =
      await _firestoreRepository.getUser(credential.user!.uid);

      if (user == null) {
        throw Exception("User data not found.");
      }

      if (!mounted) return;

      switch (user.role) {
        case "Student":
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const StudentDashboard(),
            ),
          );
          break;

        case "Teacher":
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const TeacherDashboard(),
            ),
          );
          break;

        case "Parent":
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const ParentDashboard(),
            ),
          );
          break;

        case "Admin":
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const AdminDashboard(),
            ),
          );
          break;

        default:
          throw Exception("Invalid role");
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Login Failed"),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                const SizedBox(height: 40),

                // Logo
                Image.asset(
                  "assets/logos/school_logo.png",
                  height: 110,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Modern High School",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Welcome Back 👋",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 40),

                CustomTextField(
                  controller: emailController,
                  hintText: "Email Address",
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email is required";
                    }

                    if (!value.contains("@")) {
                      return "Enter a valid email";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  controller: passwordController,
                  hintText: "Password",
                  prefixIcon: Icons.lock_outline,
                  obscureText: obscurePassword,

                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }

                    if (value.length < 6) {
                      return "Minimum 6 characters";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 30),

                CustomButton(
                  text: "Login",
                  isLoading: isLoading,
                  onPressed: loginUser,
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}