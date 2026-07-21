import 'dart:async';
import 'package:flutter/material.dart';
import 'intro_screen.dart';
import 'auth_gate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AuthGate()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,

        children: [
          Image.asset("lib/assets/images/background.jpg", fit: BoxFit.cover),

          Container(color: Colors.black.withValues(alpha: .75)),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: const [
              Icon(Icons.search, color: Colors.redAccent, size: 90),

              SizedBox(height: 25),

              Text(
                "Finding Ruby",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 15),

              Text(
                "Every clue matters.",
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
