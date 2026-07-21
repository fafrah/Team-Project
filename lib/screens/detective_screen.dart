import 'package:flutter/material.dart';
import 'phone_screen.dart';

class DetectiveScreen extends StatelessWidget {
  const DetectiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B0D10),

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Card(
              color: const Color(0xff1A1D24),
              elevation: 15,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(28),

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    const CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.blueGrey,
                      child: Icon(Icons.badge, size: 45, color: Colors.white),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Detective Mason",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "We recovered Ruby's phone after she disappeared.\n\n"
                      "Our investigation has gone cold.\n\n"
                      "You were the last person Ruby contacted, and you know her better than anyone else.\n\n"
                      "We've searched the phone, but aren't sure what matters and what doesn't.\n\n"
                      "You need to search through her messages, emails, photos, notes, and social media.\n\n"
                      "Just know that some clues will point you in the wrong direction.\n\n"
                      "Don't forget...Trust your instincts.\n\n"
                      "Find Ruby before it's too late.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, height: 1.6),
                    ),

                    const SizedBox(height: 35),

                    SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PhoneScreen(),
                            ),
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                        child: const Text(
                          "OPEN RUBY'S PHONE",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
