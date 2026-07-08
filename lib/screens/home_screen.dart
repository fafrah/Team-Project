import 'package:flutter/material.dart';
import 'logout_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apps = [
      _PhoneApp("Messages", Icons.message, const Color(0xff34C759)),
      _PhoneApp("Photos", Icons.photo, const Color(0xffFF9500)),
      _PhoneApp("Mail", Icons.email, const Color(0xff007AFF)),
      _PhoneApp("Notes", Icons.sticky_note_2, const Color(0xffFFCC00)),
      _PhoneApp("Phone", Icons.phone, const Color(0xff34C759)),
      _PhoneApp("Social", Icons.tag, const Color(0xffD32F2F)),
      _PhoneApp("Logout", Icons.logout, Colors.redAccent),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Ruby's Phone",
                        style: TextStyle(fontSize: 14, color: Colors.white70)),
                    Row(children: [
                      Icon(Icons.wifi, size: 16, color: Colors.white70),
                      SizedBox(width: 6),
                      Icon(Icons.battery_full, size: 16, color: Colors.white70),
                    ]),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.82,
                  mainAxisSpacing: 28,
                  crossAxisSpacing: 20,
                  children: apps.map((app) => _AppIcon(app: app)).toList(),
                ),
              ),
            ],
          ),
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

class _AppIcon extends StatelessWidget {
  final _PhoneApp app;
  const _AppIcon({required this.app});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (app.name == "Logout") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const LogoutScreen())
          );
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${app.name} coming soon"),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: app.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(app.icon, color: Colors.white, size: 32),
          ),
          const SizedBox(height: 8),
          Text(app.name,
              style: const TextStyle(fontSize: 13, color: Colors.white)),
        ],
      ),
    );
  }
}
