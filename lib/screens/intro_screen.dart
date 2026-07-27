import 'package:flutter/material.dart';
import 'loading_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Stack(
        fit: StackFit.expand,

        children: [
          Image.asset("lib/assets/images/background.jpg", fit: BoxFit.cover),

          Container(color: Colors.black.withOpacity(.80)),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),

                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      const SizedBox(height: 20),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(.15),

                          borderRadius: BorderRadius.circular(30),

                          border: Border.all(
                            color: Colors.redAccent.withOpacity(.5),
                          ),
                        ),

                        child: const Text(
                          "EMERGENCY CASE FILE",

                          style: TextStyle(
                            color: Colors.redAccent,

                            fontWeight: FontWeight.bold,

                            letterSpacing: 2,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        "HELP!",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 64,

                          fontWeight: FontWeight.bold,

                          color: Colors.redAccent,

                          letterSpacing: 4,
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        "Ruby Beck is missing.",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 26,

                          fontWeight: FontWeight.bold,

                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 30),

                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.all(22),

                        decoration: BoxDecoration(
                          color: const Color(0xff151922).withOpacity(.95),

                          borderRadius: BorderRadius.circular(22),

                          border: Border.all(color: Colors.white12),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Icon(Icons.message, color: Colors.redAccent),

                                SizedBox(width: 8),

                                Text(
                                  "LAST MESSAGE RECEIVED",

                                  style: TextStyle(
                                    color: Colors.white70,

                                    fontSize: 12,

                                    fontWeight: FontWeight.bold,

                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 15),

                            const Text(
                              "\"HELP!\"",

                              textAlign: TextAlign.center,

                              style: TextStyle(
                                color: Colors.white,

                                fontSize: 36,

                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            const Text(
                              "The final message Ruby Beck sent before disappearing.",

                              textAlign: TextAlign.center,

                              style: TextStyle(
                                color: Colors.white60,

                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        "Ruby's phone has been recovered, but investigators have no answers.",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          color: Colors.white70,

                          fontSize: 18,

                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        "You were the last person Ruby contacted.",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          color: Colors.white,

                          fontSize: 20,

                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 25),

                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.all(20),

                        decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(.10),

                          borderRadius: BorderRadius.circular(18),

                          border: Border.all(
                            color: Colors.redAccent.withOpacity(.35),
                          ),
                        ),

                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Text(
                              "YOUR OBJECTIVE",

                              style: TextStyle(
                                color: Colors.redAccent,

                                fontWeight: FontWeight.bold,

                                letterSpacing: 1.5,
                              ),
                            ),

                            SizedBox(height: 12),

                            Text(
                              "Search Ruby's phone\n\n"
                              "Find hidden clues\n\n"
                              "Understand the people around her\n\n"
                              "Discover what happened",

                              textAlign: TextAlign.center,

                              style: TextStyle(
                                color: Colors.white,

                                fontSize: 16,

                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

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

                            foregroundColor: Colors.white,

                            elevation: 10,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),

                          child: const Text(
                            "BEGIN INVESTIGATION",

                            style: TextStyle(
                              fontSize: 18,

                              fontWeight: FontWeight.bold,

                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Every clue matters. Every person has a story.",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          color: Colors.white38,

                          fontStyle: FontStyle.italic,
                        ),
                      ),

                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
