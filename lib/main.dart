import 'package:flutter/material.dart';
import 'package:todo_app/screens/edit_task.dart';
import 'package:todo_app/screens/home.dart';
import 'package:todo_app/screens/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.forum().fontFamily),
      initialRoute: "/home",
      routes: {
        "/onboarding": (context) => const OnboardingScreen(),
        "/home": (context) => const HomeScreen(),
        "/editTask": (context) => const EditTask(),
      },
    );
  }
}
