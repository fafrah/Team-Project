import 'package:flutter/material.dart';
import '../data/email_data.dart';
import 'email_detail_screen.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("Mail"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),

      body: ListView.separated(
        itemCount: emails.length,

        separatorBuilder: (_, __) => const Divider(color: Colors.white12),

        itemBuilder: (context, index) {
          final email = emails[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: const Icon(Icons.email, color: Colors.white),
            ),

            title: Text(
              email.sender,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  email.subject,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text(
                  email.preview,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),

            trailing: Text(
              email.date,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EmailDetailScreen(email: email),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
