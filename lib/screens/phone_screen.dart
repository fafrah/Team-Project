import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/evidence.dart';
import '../providers/game_provider.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final game = context.read<GameProvider>();

      if (!game.state.discoveredClues.any((e) => e.title == "Unknown Caller")) {
        game.discoverClue(
          const Evidence(
            title: "Unknown Caller",
            description:
                "Ruby made a late-night call to an unknown number the night before she disappeared.",
            icon: Icons.phone,
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("🔎 New Evidence Discovered!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final callLogs = [
      {
        'name': 'Mom',
        'status': 'Incoming',
        'dateTime': 'July 18, 8:42 PM',
        'duration': '3 min 12 sec',
      },
      {
        'name': 'Boyfriend',
        'status': 'Missed',
        'dateTime': 'July 18, 7:15 PM',
        'duration': '0 sec',
      },
      {
        'name': 'Unknown Number',
        'status': 'Outgoing',
        'dateTime': 'July 17, 10:03 PM',
        'duration': '1 min 45 sec',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Phone')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: callLogs.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final call = callLogs[index];

          return ListTile(
            leading: CircleAvatar(
              child: Icon(
                call['name'] == 'Unknown Number'
                    ? Icons.phone_disabled
                    : Icons.person,
              ),
            ),
            title: Text(call['name']!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(call['status']!),
                Text(call['dateTime']!),
                Text(call['duration']!),
              ],
            ),
          );
        },
      ),
    );
  }
}
