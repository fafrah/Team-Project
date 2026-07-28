import 'package:flutter/material.dart';
import 'evidence.dart';

class GameState {
  final bool investigationStarted;
  final bool loadingCompleted;
  final bool messagesUnlocked;
  final String currentScreen;
  final List<Evidence> discoveredClues;

  const GameState({
    this.investigationStarted = false,
    this.loadingCompleted = false,
    this.messagesUnlocked = false,
    this.currentScreen = "intro",
    this.discoveredClues = const <Evidence>[],
  });

  GameState copyWith({
    bool? investigationStarted,
    bool? loadingCompleted,
    bool? messagesUnlocked,
    String? currentScreen,
    List<Evidence>? discoveredClues,
  }) {
    return GameState(
      investigationStarted: investigationStarted ?? this.investigationStarted,
      loadingCompleted: loadingCompleted ?? this.loadingCompleted,
      messagesUnlocked: messagesUnlocked ?? this.messagesUnlocked,
      currentScreen: currentScreen ?? this.currentScreen,
      discoveredClues: discoveredClues ?? this.discoveredClues,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "investigationStarted": investigationStarted,
      "loadingCompleted": loadingCompleted,
      "messagesUnlocked": messagesUnlocked,
      "currentScreen": currentScreen,
      "discoveredClues": discoveredClues.map((e) => e.toMap()).toList(),
    };
  }

  factory GameState.fromMap(Map<String, dynamic> map) {
    return GameState(
      investigationStarted: map["investigationStarted"] ?? false,

      loadingCompleted: map["loadingCompleted"] ?? false,

      messagesUnlocked: map["messagesUnlocked"] ?? false,

      currentScreen: map["currentScreen"] ?? "intro",

      discoveredClues: (map["discoveredClues"] as List<dynamic>? ?? [])
          .map((e) => Evidence.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }
}
