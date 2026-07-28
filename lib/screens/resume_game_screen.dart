import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import 'email_screen.dart';
import 'home_screen.dart';
import 'intro_screen.dart';
import 'messages_screen.dart';
import 'notes_screen.dart';
import 'photos_screen.dart';
import 'social_media_screen.dart';

class ResumeGameScreen extends StatefulWidget {
  const ResumeGameScreen({super.key});

  @override
  State<ResumeGameScreen> createState() => _ResumeGameScreenState();
}

class _ResumeGameScreenState extends State<ResumeGameScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _resumeGame();
    });
  }

  void _resumeGame() {
    final game = context.read<GameProvider>();
    final currentScreen = game.state.currentScreen;

    Widget nextScreen;

    switch (currentScreen) {
      case 'home':
        nextScreen = const HomeScreen();
        break;

      case 'messages':
        nextScreen = const MessagesScreen();
        break;

      case 'photos':
        nextScreen = const PhotosScreen();
        break;

      case 'notes':
        nextScreen = const NotesScreen();
        break;

      case 'email':
        nextScreen = const EmailScreen();
        break;

      case 'social':
        nextScreen = const SocialMediaScreen();
        break;

      default:
        nextScreen = const IntroScreen();
    }

    if (!mounted) {
      return;
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
