class GameState {
  final bool investigationStarted;
  final bool loadingCompleted;
  final bool messagesUnlocked;
  final String currentScreen;

  const GameState({
    this.investigationStarted = false,
    this.loadingCompleted = false,
    this.messagesUnlocked = false,
    this.currentScreen = "intro",
  });

  GameState copyWith({
    bool? investigationStarted,
    bool? loadingCompleted,
    bool? messagesUnlocked,
    String? currentScreen,
  }) {
    return GameState(
      investigationStarted: investigationStarted ?? this.investigationStarted,
      loadingCompleted: loadingCompleted ?? this.loadingCompleted,
      messagesUnlocked: messagesUnlocked ?? this.messagesUnlocked,
      currentScreen: currentScreen ?? this.currentScreen,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "investigationStarted": investigationStarted,
      "loadingCompleted": loadingCompleted,
      "messagesUnlocked": messagesUnlocked,
      "currentScreen": currentScreen,
    };
  }

  factory GameState.fromMap(Map<String, dynamic> map) {
    return GameState(
      investigationStarted: map["investigationStarted"] ?? false,

      loadingCompleted: map["loadingCompleted"] ?? false,

      messagesUnlocked: map["messagesUnlocked"] ?? false,

      currentScreen: map["currentScreen"] ?? "intro",
    );
  }
}
