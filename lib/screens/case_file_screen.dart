import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import 'accusation_screen.dart';

class CaseFileScreen extends StatelessWidget {
  const CaseFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProvider>();

    return Scaffold(
      backgroundColor: const Color(0xFF080A0F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Case File',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'RUBY BECK INVESTIGATION',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Case #0427 • Opened Tuesday at 11:45 PM',
                    style: TextStyle(color: Colors.white60),
                  ),
                  const SizedBox(height: 25),

                  _buildSectionTitle(
                    Icons.description_outlined,
                    'INCIDENT SUMMARY',
                  ),
                  const SizedBox(height: 12),

                  _buildInformationCard(
                    child: const Text(
                      'Ruby Beck was reported missing after she failed to '
                      'return home and stopped responding to calls and messages.\n\n'
                      'Her cracked phone was later recovered near a roadside '
                      'turnout on Pinecrest Road, approximately two miles from '
                      'Pinecrest Lake.\n\n'
                      'Ruby and her personal bag were not found at the scene. '
                      'Her vehicle remained parked at her residence.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  _buildSectionTitle(
                    Icons.location_on_outlined,
                    'SCENE DETAILS',
                  ),
                  const SizedBox(height: 12),

                  _buildInformationCard(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SceneRow(
                          icon: Icons.phone_iphone,
                          text:
                              'Ruby’s cracked phone was found several feet from the roadway.',
                        ),
                        _SceneRow(
                          icon: Icons.tire_repair,
                          text:
                              'Fresh tire impressions were observed near the turnout.',
                        ),
                        _SceneRow(
                          icon: Icons.directions_car_outlined,
                          text:
                              'Ruby’s vehicle remained parked at her residence, suggesting she left with someone else.',
                        ),
                        _SceneRow(
                          icon: Icons.search,
                          text:
                              'No blood or clear signs of a struggle were found.',
                          showDivider: false,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  _buildSectionTitle(
                    Icons.visibility_outlined,
                    'EYEWITNESS STATEMENT',
                  ),
                  const SizedBox(height: 12),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFF171B24),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.amber.withValues(alpha: 0.35),
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '“I saw Ruby near the turnout sometime after 9:00 PM. '
                          'She looked upset and was speaking to someone beside '
                          'a dark-colored vehicle. The other person was wearing '
                          'a red hoodie. I could not see their face.”',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          '— Statement from a passing driver',
                          style: TextStyle(color: Colors.white54, fontSize: 13),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  _buildSectionTitle(Icons.schedule, 'OFFICIAL TIMELINE'),
                  const SizedBox(height: 15),

                  const _TimelineCard(
                    time: '5:04 PM',
                    title: 'Financial Dispute',
                    description:
                        'Ruby sends messages about missing money from her college account.',
                  ),

                  const _TimelineCard(
                    time: '5:21 PM',
                    title: 'Private Meeting Arranged',
                    description:
                        'Ruby is asked to meet privately later that evening.',
                  ),

                  const _TimelineCard(
                    time: '7:44 PM',
                    title: 'Threatening Message',
                    description:
                        'Ruby receives a hostile message following a recent argument.',
                  ),

                  const _TimelineCard(
                    time: '8:12 PM',
                    title: 'Jordan Posts Downtown',
                    description:
                        'Jordan appears downtown after claiming that he was home.',
                  ),

                  const _TimelineCard(
                    time: '8:15 PM',
                    title: 'Kayla Appears Online',
                    description: 'Kayla appears in a timestamped livestream.',
                  ),

                  const _TimelineCard(
                    time: '9:35 PM',
                    title: 'Witness Sighting',
                    description:
                        'Ruby is seen near Pinecrest Road beside a dark-colored vehicle.',
                  ),

                  const _TimelineCard(
                    time: '9:42 PM',
                    title: 'Final Message Sent',
                    description: 'Ruby sends a message that reads “HELP!”',
                  ),

                  const _TimelineCard(
                    time: '10:03 PM',
                    title: 'Phone Disconnected',
                    description:
                        'Ruby’s phone stops responding and disconnects from the network.',
                  ),

                  const _TimelineCard(
                    time: '10:20 PM',
                    title: 'Phone Recovered',
                    description:
                        'A passing driver finds Ruby’s phone near the roadside turnout.',
                  ),

                  const SizedBox(height: 30),

                  _buildSectionTitle(
                    Icons.inventory_2_outlined,
                    'EVIDENCE FOUND',
                  ),
                  const SizedBox(height: 15),

                  if (game.state.discoveredClues.isEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C2029),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.search_off,
                            color: Colors.white38,
                            size: 38,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'No phone evidence has been discovered yet.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Search Ruby’s messages, emails, social media, notes, and photos.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    )
                  else ...[
                    Text(
                      '${game.state.discoveredClues.length} '
                      '${game.state.discoveredClues.length == 1 ? 'clue' : 'clues'} discovered',
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...game.state.discoveredClues.map(
                      (clue) => _EvidenceCard(
                        icon: clue.icon,
                        title: clue.title,
                        subtitle: clue.description,
                      ),
                    ),
                  ],

                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.orange.withValues(alpha: 0.30),
                      ),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.warning_amber_rounded, color: Colors.orange),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'A suspicious message does not prove guilt. '
                            'Compare statements with timestamps, locations, '
                            'and physical evidence.',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 14,
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
                        'MAKE ACCUSATION',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: Colors.redAccent),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildInformationCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF171B24),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white12),
      ),
      child: child,
    );
  }
}

class _SceneRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool showDivider;

  const _SceneRow({
    required this.icon,
    required this.text,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.redAccent, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
        if (showDivider)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(color: Colors.white12, height: 1),
          ),
      ],
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
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF171B24),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.redAccent.withValues(alpha: 0.20),
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
                  style: const TextStyle(color: Colors.white70, height: 1.4),
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
        color: const Color(0xFF1C2029),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
