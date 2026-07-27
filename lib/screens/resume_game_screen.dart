import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';

import 'intro_screen.dart';
import 'home_screen.dart';
import 'messages_screen.dart';
import 'photos_screen.dart';
import 'notes_screen.dart';
import 'social_media_screen.dart';

// Change this import if your email screen has a different name.
import 'email_screen.dart';

class ResumeGameScreen extends StatefulWidget {
  const ResumeGameScreen({super.key});

  @override
  State<ResumeGameScreen> createState() => _ResumeGameScreenState();
}

class _ResumeGameScreenState extends State<ResumeGameScreen> {
  @override
  void initState() {
    super.initState();
    _resumeGame();
  }

  Future<void> _resumeGame() async {
    final game = Provider.of<GameProvider>(context, listen: false);

    await game.loadGame();

    if (!mounted) return;

    Widget nextScreen;

    switch (game.gameState.currentScreen) {
      case "home":
        nextScreen = const HomeScreen();
        break;

      case "messages":
        nextScreen = const MessagesScreen();
        break;

      case "photos":
        nextScreen = const PhotosScreen();
        break;

      case "notes":
        nextScreen = const NotesScreen();
        break;

      case "social":
        nextScreen = const SocialMediaScreen();
        break;

      case "email":
        nextScreen = const EmailScreen();
        break;

      default:
        // First time playing
        nextScreen = const IntroScreen();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: CircularProgressIndicator(color: Colors.redAccent)),
    );
  }
}
