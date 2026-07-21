import 'package:flutter/material.dart';

import 'messages_screen.dart';
import 'email_screen.dart';
import 'social_screen.dart';
import 'logout_screen.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apps = [
      _PhoneApp("Messages", Icons.message, Colors.green),
      _PhoneApp("Mail", Icons.email, Colors.blue),
      _PhoneApp("Photos", Icons.photo, Colors.orange),
      _PhoneApp("Notes", Icons.note, Colors.yellow.shade700),
      _PhoneApp("Phone", Icons.phone, Colors.green),
      _PhoneApp("Social", Icons.people, Colors.purple),
      _PhoneApp("Logout", Icons.logout, Colors.red),
    ];

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("Ruby's Phone"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: GridView.builder(
          itemCount: apps.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 25,
            mainAxisSpacing: 25,
          ),

          itemBuilder: (context, index) {
            final app = apps[index];

            return GestureDetector(
              onTap: () {
                if (app.name == "Messages") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MessagesScreen()),
                  );
                  return;
                }
                if (app.name == "Mail") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EmailScreen()),
                  );
                  return;
                }
                if (app.name == "Social") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SocialScreen()),
                  );
                  return;
                }

                if (app.name == "Logout") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LogoutScreen()),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${app.name} coming soon")),
                );
              },

              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,

                    decoration: BoxDecoration(
                      color: app.color,
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: Icon(app.icon, color: Colors.white, size: 34),
                  ),

                  const SizedBox(height: 8),

                  Text(app.name, style: const TextStyle(color: Colors.white)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PhoneApp {
  final String name;
  final IconData icon;
  final Color color;

  _PhoneApp(this.name, this.icon, this.color);
}
