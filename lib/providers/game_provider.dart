import 'package:flutter/material.dart';
import '../models/game_state.dart';

class GameProvider extends ChangeNotifier {
  GameState _state = const GameState();

  GameState get state => _state;

  void startInvestigation() {
    _state = _state.copyWith(
      investigationStarted: true,
      currentScreen: "loading",
    );

    notifyListeners();
  }

  void completeLoading() {
    _state = _state.copyWith(
      loadingCompleted: true,
      messagesUnlocked: true,
      currentScreen: "detective",
    );

    notifyListeners();
  }

  void updateScreen(String screen) {
    _state = _state.copyWith(currentScreen: screen);

    notifyListeners();
  }
}
