import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/screens/home.dart';
import 'package:todo_app/screens/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/store/taskstore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: GoogleFonts.forum().fontFamily),
        initialRoute: "/home",
        routes: {
          "/onboarding": (context) => const OnboardingScreen(),
          "/home": (context) => const HomeScreen(),
        },
      ),
    );
  }
}
