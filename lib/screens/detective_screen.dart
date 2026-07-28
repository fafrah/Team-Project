import 'package:flutter/material.dart';

import 'lock_screen.dart';

class DetectiveScreen extends StatelessWidget {
  const DetectiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080A0F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Case Briefing',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 35),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 650),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _CaseHeader(),
                  const SizedBox(height: 22),
                  const _VictimProfileCard(),
                  const SizedBox(height: 18),
                  const _SectionCard(
                    title: 'INCIDENT SUMMARY',
                    icon: Icons.description_outlined,
                    child: Text(
                      'Ruby Beck was reported missing late Tuesday night '
                      'after she failed to return home and stopped responding '
                      'to calls and messages.\n\n'
                      'Earlier that evening, Ruby sent a short message that '
                      'read, “HELP!” Her phone was later recovered near a '
                      'roadside turnout on Pinecrest Road, approximately two '
                      'miles from Pinecrest Lake.\n\n'
                      'Ruby, her vehicle, and her personal bag were not found '
                      'at the scene.',
                      style: _CaseStyles.bodyText,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const _SectionCard(
                    title: 'SCENE INFORMATION',
                    icon: Icons.location_on_outlined,
                    child: Column(
                      children: [
                        _FactRow(
                          icon: Icons.phone_iphone,
                          title: 'Cracked phone recovered',
                          description:
                              'Ruby’s phone was found several feet from the '
                              'passenger side of the roadway.',
                        ),
                        _FactRow(
                          icon: Icons.tire_repair,
                          title: 'Fresh tire impressions',
                          description:
                              'Investigators observed recent tire marks near '
                              'the turnout, but the vehicle could not be identified.',
                        ),
                        _FactRow(
                          icon: Icons.directions_car_outlined,
                          title: 'Ruby’s vehicle is missing',
                          description:
                              'Her vehicle was not located at the turnout or '
                              'at her residence.',
                        ),
                        _FactRow(
                          icon: Icons.search,
                          title: 'No obvious signs of a struggle',
                          description:
                              'No blood or damaged personal property was found '
                              'in the immediate area.',
                          showDivider: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  const _WitnessStatementCard(),
                  const SizedBox(height: 18),
                  const _SectionCard(
                    title: 'PRELIMINARY TIMELINE',
                    icon: Icons.schedule,
                    child: Column(
                      children: [
                        _TimelineRow(
                          time: '5:04 PM',
                          description:
                              'Ruby sends messages regarding missing money '
                              'from her college account.',
                        ),
                        _TimelineRow(
                          time: '5:21 PM',
                          description:
                              'Ruby is asked to meet privately later that evening.',
                        ),
                        _TimelineRow(
                          time: '7:44 PM',
                          description: 'Ruby receives a threatening message.',
                        ),
                        _TimelineRow(
                          time: '8:12 PM',
                          description:
                              'Jordan posts from downtown after claiming he was home.',
                        ),
                        _TimelineRow(
                          time: '8:15 PM',
                          description:
                              'Kayla appears in a timestamped livestream.',
                        ),
                        _TimelineRow(
                          time: '9:35 PM',
                          description:
                              'A witness sees Ruby beside a dark-colored vehicle '
                              'near Pinecrest Road.',
                        ),
                        _TimelineRow(
                          time: '9:42 PM',
                          description: 'Ruby sends the message “HELP!”',
                        ),
                        _TimelineRow(
                          time: '10:03 PM',
                          description:
                              'Ruby’s phone disconnects from the network.',
                        ),
                        _TimelineRow(
                          time: '10:20 PM',
                          description:
                              'Ruby’s phone is recovered near the roadside turnout.',
                          showLine: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  const _PersonsOfInterestSection(),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.orange.withValues(alpha: 0.30),
                      ),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.warning_amber_rounded, color: Colors.orange),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'The witness could not identify the person in the '
                            'red hoodie. Do not assume that every suspicious '
                            'person is responsible for Ruby’s disappearance.',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 15,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LockScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      icon: const Icon(Icons.phone_iphone),
                      label: const Text(
                        'ACCESS RUBY’S PHONE',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Trust the evidence. Question every story.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white38,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CaseHeader extends StatelessWidget {
  const _CaseHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF151922),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.redAccent.withValues(alpha: 0.35)),
      ),
      child: const Column(
        children: [
          Icon(Icons.folder_open, color: Colors.redAccent, size: 42),
          SizedBox(height: 12),
          Text(
            'CASE FILE #0427',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 7),
          Text(
            'ACTIVE MISSING-PERSON INVESTIGATION',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white60,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _VictimProfileCard extends StatelessWidget {
  const _VictimProfileCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _CaseStyles.cardDecoration,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 43,
            backgroundColor: Color(0xFF3A4354),
            child: Icon(Icons.person, size: 51, color: Colors.white70),
          ),
          SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RUBY BECK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                _ProfileLine(label: 'Age', value: '21'),
                _ProfileLine(label: 'Status', value: 'Missing'),
                _ProfileLine(label: 'Case opened', value: 'Tuesday, 11:45 PM'),
                _ProfileLine(label: 'Last known area', value: 'Pinecrest Road'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileLine extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileLine({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14, height: 1.3),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(color: Colors.white54),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: label == 'Status' ? Colors.redAccent : Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _CaseStyles.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(title: title, icon: icon),
          const SizedBox(height: 17),
          child,
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionTitle({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.redAccent, size: 23),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}

class _FactRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool showDivider;

  const _FactRow({
    required this.icon,
    required this.title,
    required this.description,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: Colors.redAccent.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.redAccent, size: 20),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (showDivider)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 13),
            child: Divider(color: Colors.white12, height: 1),
          ),
      ],
    );
  }
}

class _WitnessStatementCard extends StatelessWidget {
  const _WitnessStatementCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF151922),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.amber.withValues(alpha: 0.30)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            title: 'EYEWITNESS STATEMENT',
            icon: Icons.visibility_outlined,
          ),
          SizedBox(height: 17),
          Text(
            '“I saw Ruby near the turnout sometime after 9:00 PM. '
            'She looked upset and was speaking to someone beside a '
            'dark-colored vehicle. The other person was wearing a '
            'red hoodie. I could not see their face.”',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontStyle: FontStyle.italic,
              height: 1.55,
            ),
          ),
          SizedBox(height: 13),
          Text(
            '— Statement from a passing driver',
            style: TextStyle(color: Colors.white54, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  final String time;
  final String description;
  final bool showLine;

  const _TimelineRow({
    required this.time,
    required this.description,
    this.showLine = true,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            child: Text(
              time,
              style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                width: 11,
                height: 11,
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
              ),
              if (showLine)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: Colors.white12,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: showLine ? 19 : 0),
              child: Text(
                description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PersonsOfInterestSection extends StatelessWidget {
  const _PersonsOfInterestSection();

  @override
  Widget build(BuildContext context) {
    return const _SectionCard(
      title: 'PERSONS OF INTEREST',
      icon: Icons.groups_2_outlined,
      child: Column(
        children: [
          _SuspectCard(
            name: 'Diane Beck',
            relationship: 'Ruby’s mother',
            icon: Icons.family_restroom,
            summary:
                'Diane says she last spoke with Ruby earlier that afternoon. '
                'Some details of her account have not been verified.',
          ),
          SizedBox(height: 12),
          _SuspectCard(
            name: 'Jordan',
            relationship: 'Ruby’s boyfriend',
            icon: Icons.favorite_outline,
            summary:
                'Jordan provided conflicting information about where he was '
                'on the night Ruby disappeared.',
          ),
          SizedBox(height: 12),
          _SuspectCard(
            name: 'Kayla',
            relationship: 'Former friend and rival',
            icon: Icons.person_off_outlined,
            summary:
                'Kayla recently argued with Ruby and made threatening '
                'statements online.',
          ),
        ],
      ),
    );
  }
}

class _SuspectCard extends StatelessWidget {
  final String name;
  final String relationship;
  final IconData icon;
  final String summary;

  const _SuspectCard({
    required this.name,
    required this.relationship,
    required this.icon,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1118),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 23,
            backgroundColor: const Color(0xFF303744),
            child: Icon(icon, color: Colors.white70, size: 24),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  relationship,
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  summary,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
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

class _CaseStyles {
  static const TextStyle bodyText = TextStyle(
    color: Colors.white70,
    fontSize: 15,
    height: 1.55,
  );

  static BoxDecoration get cardDecoration {
    return BoxDecoration(
      color: const Color(0xFF151922),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white12),
    );
  }
}
