import 'package:flutter/material.dart';

import '../data/investigation_clock.dart';

import 'case_file_screen.dart';
import 'email_screen.dart';
import 'logout_screen.dart';
import 'messages_screen.dart';
import 'notes_screen.dart';
import 'phone_screen.dart';
import 'photos_screen.dart';
import 'social_media_screen.dart';
import 'social_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apps = [
      const _PhoneApp('Messages', Icons.message, Color(0xFF34C759)),
      const _PhoneApp('Photos', Icons.photo, Color(0xFFFF9500)),
      const _PhoneApp('Mail', Icons.email, Color(0xFF007AFF)),
      const _PhoneApp('Notes', Icons.sticky_note_2, Color(0xFFFFCC00)),
      const _PhoneApp('Phone', Icons.phone, Color(0xFF34C759)),
      const _PhoneApp('Social', Icons.tag, Color(0xFFD32F2F)),
      const _PhoneApp("Beck n' Call", Icons.flutter_dash, Color(0xFF4A90E2)),
      const _PhoneApp('Case File', Icons.folder, Color(0xFF8E44AD)),
      const _PhoneApp('Logout', Icons.logout, Colors.redAccent),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF11141B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ruby's Phone",
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                    Row(
                      children: [
                        Icon(Icons.wifi, size: 16, color: Colors.white70),
                        SizedBox(width: 6),
                        Icon(
                          Icons.battery_full,
                          size: 16,
                          color: Colors.white70,
                        ),
                      ],
                    ),
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

  const _PhoneApp(this.name, this.icon, this.color);
}

class _AppIcon extends StatelessWidget {
  final _PhoneApp app;

  const _AppIcon({required this.app});

  void openApp(BuildContext context) {
    // Opening an investigation app costs one hour the first time it is opened.
    // Logout and Case File do not consume investigation time.
    if (app.name != 'Logout' && app.name != 'Case File') {
      InvestigationClock.spendHour(app.name);
    }

    Widget? screen;

    switch (app.name) {
      case 'Messages':
        screen = const MessagesScreen();
        break;

      case 'Photos':
        screen = const PhotosScreen();
        break;

      case 'Mail':
        screen = const EmailScreen();
        break;

      case 'Notes':
        screen = const NotesScreen();
        break;

      case 'Phone':
        screen = const PhoneScreen();
        break;

      case 'Social':
        screen = const SocialScreen();
        break;

      case "Beck n' Call":
        screen = const SocialMediaScreen();
        break;

      case 'Case File':
        screen = const CaseFileScreen();
        break;

      case 'Logout':
        screen = const LogoutScreen();
        break;
    }

    if (screen == null) {
      return;
    }

    Navigator.push(context, MaterialPageRoute(builder: (_) => screen!));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openApp(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: app.color,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(app.icon, color: Colors.white, size: 32),
          ),
          const SizedBox(height: 8),
          Text(
            app.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
