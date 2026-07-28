import 'package:flutter/material.dart';
import 'theme.dart';
import '../features/splash/presentation/splash_screen.dart';


class ModernHighSchoolApp extends StatelessWidget {
  const ModernHighSchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern High School',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      home: const SplashScreen(),
    );
  }
}
