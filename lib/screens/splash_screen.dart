import 'dart:async';
import 'package:flutter/material.dart';
import 'auth_gate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _fadeAnimation;

  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,

      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _scaleAnimation = Tween<double>(
      begin: .7,

      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (_) => const AuthGate()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Stack(
        fit: StackFit.expand,

        children: [
          Image.asset("lib/assets/images/background.jpg", fit: BoxFit.cover),

          Container(color: Colors.black.withOpacity(.82)),

          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,

              child: ScaleTransition(
                scale: _scaleAnimation,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Container(
                      padding: const EdgeInsets.all(25),

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        color: Colors.redAccent.withOpacity(.12),

                        border: Border.all(
                          color: Colors.redAccent.withOpacity(.5),

                          width: 2,
                        ),
                      ),

                      child: const Icon(
                        Icons.search,

                        color: Colors.redAccent,

                        size: 85,
                      ),
                    ),

                    const SizedBox(height: 35),

                    const Text(
                      "FINDING RUBY",

                      style: TextStyle(
                        fontSize: 42,

                        fontWeight: FontWeight.bold,

                        letterSpacing: 4,

                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,

                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        color: Colors.redAccent.withOpacity(.15),
                      ),

                      child: const Text(
                        "CASE FILE OPENED",

                        style: TextStyle(
                          color: Colors.redAccent,

                          fontWeight: FontWeight.bold,

                          letterSpacing: 2,

                          fontSize: 12,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Every clue matters.",

                      style: TextStyle(
                        color: Colors.white70,

                        fontSize: 20,

                        fontStyle: FontStyle.italic,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Every person has a story.",

                      style: TextStyle(color: Colors.white54, fontSize: 16),
                    ),

                    const SizedBox(height: 45),

                    const SizedBox(
                      width: 180,

                      child: LinearProgressIndicator(
                        backgroundColor: Colors.white12,

                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.redAccent,
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      "INITIALIZING INVESTIGATION...",

                      style: TextStyle(
                        color: Colors.white38,

                        fontSize: 12,

                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
