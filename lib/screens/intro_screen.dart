import 'package:flutter/material.dart';
import 'lock_screen.dart';
import 'loading_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,

        children: [
          Image.asset("lib/assets/images/background.jpg", fit: BoxFit.cover),

          Container(color: Colors.black.withValues(alpha: .72)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(28),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Spacer(),

                  const Text(
                    "HELP!",
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "That's the last message your friend Ruby sent before she disappeared.",
                    style: TextStyle(fontSize: 22, height: 1.5),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "Detectives recovered her phone but have no leads.",
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "Since you were the last person Ruby contacted, they're asking for your help.",
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "Search through her phone.\nFind the truth.\nFind Ruby.",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,

                    height: 60,

                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoadingScreen(),
                          ),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),

                      child: const Text(
                        "BEGIN INVESTIGATION",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
