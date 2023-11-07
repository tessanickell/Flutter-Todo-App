import 'package:flutter/material.dart';
import 'package:todo_app/screens/home.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      body: Padding(
        padding: const EdgeInsets.only(left: 44, right: 44, top: 84),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Simple.",
              style: TextStyle(
                  fontSize: 50, color: Colors.white, letterSpacing: 5),
            ),
            const SizedBox(height: 20),
            const Text(
              "Powerful.",
              style: TextStyle(
                  fontSize: 50, color: Colors.white, letterSpacing: 5),
            ),
            const SizedBox(height: 20),
            const Text(
              "You.",
              style: TextStyle(
                  fontSize: 50, color: Colors.white, letterSpacing: 5),
            ),
            const Spacer(),
            const Text(
              "The secret of getting ahead is getting started.",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            const SizedBox(height: 45),
            Center(
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()))
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(343, 77),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0.0),
                      topLeft: Radius.circular(0.0),
                    ),
                  ),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ),
            const SizedBox(height: 68),
          ],
        ),
      ),
    );
  }
}
