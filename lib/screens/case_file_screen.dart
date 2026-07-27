import 'package:flutter/material.dart';
import 'accusation_screen.dart';

class CaseFileScreen extends StatelessWidget {
  const CaseFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff080A0F),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Case File",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "RUBY BECK INVESTIGATION",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Case opened: Tuesday • 11:45 PM",
              style: TextStyle(color: Colors.white60),
            ),

            const SizedBox(height: 30),

            const Text(
              "TIMELINE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            _TimelineCard(
              time: "8:12 PM",
              title: "Last Message Sent",
              description: "Ruby sent a message saying \"HELP!\"",
            ),

            _TimelineCard(
              time: "8:34 PM",
              title: "Social Activity",
              description: "A suspicious post appeared on Beck n' Call.",
            ),

            _TimelineCard(
              time: "9:42 PM",
              title: "Photo Captured",
              description: "A photo was taken at an unknown location.",
            ),

            _TimelineCard(
              time: "10:03 PM",
              title: "Phone Disconnected",
              description: "Ruby's device stopped responding.",
            ),

            const SizedBox(height: 35),

            const Text(
              "EVIDENCE FOUND",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            _EvidenceCard(
              icon: Icons.message,
              title: "Final Conversation",
              subtitle: "Ruby's last messages were recovered.",
            ),

            _EvidenceCard(
              icon: Icons.photo,
              title: "Unknown Photo",
              subtitle: "A photo may reveal Ruby's location.",
            ),

            _EvidenceCard(
              icon: Icons.public,
              title: "Beck n' Call Activity",
              subtitle: "Social posts and comments collected.",
            ),

            _EvidenceCard(
              icon: Icons.note,
              title: "Private Notes",
              subtitle: "Ruby's personal notes are locked.",
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AccusationScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.gavel),
                label: const Text(
                  "MAKE ACCUSATION",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _TimelineCard extends StatelessWidget {
  final String time;
  final String title;
  final String description;

  const _TimelineCard({
    required this.time,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: const Color(0xff171B24),

        borderRadius: BorderRadius.circular(18),

        border: Border.all(color: Colors.white12),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: Colors.redAccent.withOpacity(.2),

              shape: BoxShape.circle,
            ),

            child: const Icon(Icons.access_time, color: Colors.redAccent),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  time,

                  style: const TextStyle(
                    color: Colors.redAccent,

                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  title,

                  style: const TextStyle(
                    color: Colors.white,

                    fontSize: 17,

                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  description,

                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EvidenceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _EvidenceCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: const Color(0xff1C2029),

        borderRadius: BorderRadius.circular(15),
      ),

      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blueGrey,

            child: Icon(icon, color: Colors.white),
          ),

          const SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,

                style: const TextStyle(
                  color: Colors.white,

                  fontWeight: FontWeight.bold,

                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                subtitle,

                style: const TextStyle(color: Colors.white60, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
