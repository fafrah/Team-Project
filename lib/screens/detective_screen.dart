import 'package:flutter/material.dart';
import 'phone_screen.dart';
import 'lock_screen.dart';

class DetectiveScreen extends StatelessWidget {
  const DetectiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff080A0F),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              const SizedBox(height: 20),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.folder_open, color: Colors.redAccent, size: 30),

                  SizedBox(width: 10),

                  Text(
                    "CASE FILE #0427",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Card(
                color: const Color(0xff151922),

                elevation: 20,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(25),

                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,

                        backgroundColor: Colors.blueGrey,

                        child: Icon(Icons.badge, size: 50, color: Colors.white),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        "Detective Mason",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: const Text(
                          "ACTIVE INVESTIGATION",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      Container(
                        padding: const EdgeInsets.all(18),

                        decoration: BoxDecoration(
                          color: const Color(0xff0E1118),

                          borderRadius: BorderRadius.circular(15),

                          border: Border.all(color: Colors.white12),
                        ),

                        child: const Text(
                          "Ruby Morgan was reported missing after "
                          "failing to appear at a planned meeting.\n\n"
                          "Her phone was recovered, but the investigation "
                          "has reached a dead end.\n\n"
                          "The last few days before Ruby disappeared "
                          "may contain the answers we need.",

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Align(
                        alignment: Alignment.centerLeft,

                        child: Text(
                          "AREAS TO INVESTIGATE",

                          style: TextStyle(
                            color: Colors.white,

                            fontSize: 18,

                            fontWeight: FontWeight.bold,

                            letterSpacing: 1,
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      _EvidenceTile(
                        icon: Icons.message,
                        title: "Messages",
                        subtitle:
                            "Look for conversations Ruby may have hidden.",
                      ),

                      _EvidenceTile(
                        icon: Icons.photo,
                        title: "Photos",
                        subtitle:
                            "Check locations, dates, and unexpected details.",
                      ),

                      _EvidenceTile(
                        icon: Icons.note,
                        title: "Notes",
                        subtitle: "Ruby may have written something important.",
                      ),

                      _EvidenceTile(
                        icon: Icons.public,
                        title: "Social Media",
                        subtitle: "Study posts, comments, and relationships.",
                      ),

                      const SizedBox(height: 25),

                      Container(
                        padding: const EdgeInsets.all(15),

                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(.1),

                          borderRadius: BorderRadius.circular(15),
                        ),

                        child: const Row(
                          children: [
                            Icon(Icons.warning_amber, color: Colors.orange),

                            SizedBox(width: 10),

                            Expanded(
                              child: Text(
                                "Warning: Not everyone connected to Ruby "
                                "may be telling the truth...",

                                style: TextStyle(
                                  color: Colors.orange,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,

                        height: 60,

                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) => const LockScreen(),
                              ),
                            );
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,

                            foregroundColor: Colors.white,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),

                            elevation: 8,
                          ),

                          child: const Text(
                            "BEGIN INVESTIGATION",

                            style: TextStyle(
                              fontSize: 18,

                              fontWeight: FontWeight.bold,

                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Trust the evidence. Question everything.",

                style: TextStyle(
                  color: Colors.white38,

                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EvidenceTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _EvidenceTile({
    required this.icon,

    required this.title,

    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(14),

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

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: const TextStyle(
                    color: Colors.white,

                    fontSize: 16,

                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,

                  style: const TextStyle(color: Colors.white60, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
