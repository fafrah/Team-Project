import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'detective_screen.dart';
import '../data/investigation_clock.dart';

enum Ending { saved, tooLate, coldCase }

class EndingScreen extends StatelessWidget {
  final Ending ending;
  const EndingScreen({super.key, required this.ending});

  @override
  Widget build(BuildContext context) {
    late String title;
    late String message;
    late IconData icon;
    late Color color;

    switch (ending) {
      case Ending.saved:
        title = "RUBY IS SAVED";
        message =
            "You followed the money to the lake house and got there in time. "
            "Police found Ruby locked in the family lake house. Her mother, Diane, "
            "was arrested for kidnapping and for draining Ruby's college fund. "
            "Ruby is safe because you trusted the evidence, not the loudest suspect.";
        icon = Icons.favorite;
        color = const Color(0xff34C759);
        break;
      case Ending.tooLate:
        title = "FOUND TOO LATE";
        message =
            "You accused the right person, but you spent too long chasing the wrong "
            "leads first. By the time police reached the lake house, it was too late "
            "to save Ruby. Diane was arrested, but the delay cost Ruby her life.";
        icon = Icons.timer_off;
        color = const Color(0xffFF9500);
        break;
      case Ending.coldCase:
        title = "CASE GOES COLD";
        message =
            "You accused the wrong person. While the investigation chased a dead end, "
            "the real trail went cold. Ruby was never found, and her case was closed "
            "unsolved. The truth about Diane stayed buried.";
        icon = Icons.ac_unit;
        color = const Color(0xff4A6FA5);
        break;
    }

    return Scaffold(
      backgroundColor: const Color(0xff080A0F),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: color, size: 90),
                const SizedBox(height: 24),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: color,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 17,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // Reset the clock and start a fresh investigation.
                      InvestigationClock.reset();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DetectiveScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "PLAY AGAIN",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                        (route) => false,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "BACK TO PHONE",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
