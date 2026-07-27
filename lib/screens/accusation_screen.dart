import 'package:flutter/material.dart';
import 'ending_screen.dart';
import '../data/investigation_clock.dart';

class AccusationScreen extends StatelessWidget {
  const AccusationScreen({super.key});

  void _accuse(BuildContext context, String suspect) {
    Ending result;

    if (suspect == "Diane") {
      // Correct suspect. Ending depends on how much time is left.
      result = InvestigationClock.hoursRemaining > 0
          ? Ending.saved
          : Ending.tooLate;
    } else {
      // Wrong suspect. The case goes cold.
      result = Ending.coldCase;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EndingScreen(ending: result)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final suspects = [
      _Suspect("Diane", "Ruby's Mother",
          "Her story keeps changing. Says she was home all night.", Icons.person),
      _Suspect("Jordan", "Ruby's Boyfriend",
          "Lied about where he was the night Ruby disappeared.", Icons.person),
      _Suspect("Kayla", "Ruby's Rival",
          "Publicly threatened Ruby days before she went missing.", Icons.person),
    ];

    return Scaffold(
      backgroundColor: const Color(0xff080A0F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Make Your Accusation",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Countdown banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: InvestigationClock.hoursRemaining > 0
                    ? Colors.redAccent.withOpacity(.15)
                    : Colors.red.withOpacity(.3),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.redAccent),
              ),
              child: Row(
                children: [
                  const Icon(Icons.timer, color: Colors.redAccent),
                  const SizedBox(width: 12),
                  Text(
                    InvestigationClock.hoursRemaining > 0
                        ? "Time remaining: ${InvestigationClock.hoursRemaining} hours"
                        : "Time has run out",
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Based on the evidence, who took Ruby?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Choose carefully. You only get one accusation.",
              style: TextStyle(color: Colors.white60, fontSize: 14),
            ),
            const SizedBox(height: 24),
            ...suspects.map((s) => _SuspectCard(
                  suspect: s,
                  onAccuse: () => _accuse(context, s.name),
                )),
          ],
        ),
      ),
    );
  }
}

class _Suspect {
  final String name;
  final String role;
  final String note;
  final IconData icon;
  _Suspect(this.name, this.role, this.note, this.icon);
}

class _SuspectCard extends StatelessWidget {
  final _Suspect suspect;
  final VoidCallback onAccuse;
  const _SuspectCard({required this.suspect, required this.onAccuse});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff171B24),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Icon(suspect.icon, color: Colors.white),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(suspect.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text(suspect.role,
                      style: const TextStyle(
                          color: Colors.redAccent, fontSize: 13)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(suspect.note,
              style: const TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: onAccuse,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.redAccent,
                side: const BorderSide(color: Colors.redAccent),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text("Accuse ${suspect.name}",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
