import 'package:flutter/material.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

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
      appBar: AppBar(
        title: const Text('Phone'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: callLogs.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final call = callLogs[index];

          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
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
