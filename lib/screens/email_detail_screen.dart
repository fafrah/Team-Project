import 'package:flutter/material.dart';
import '../data/email_data.dart';

class EmailDetailScreen extends StatelessWidget {
  final Email email;

  const EmailDetailScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(backgroundColor: Colors.black, title: const Text("Mail")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              email.subject,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.email, color: Colors.white),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        email.sender,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        email.date,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Text(
                email.body,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
