/// Tracks how many "hours" the player has left before Ruby's time runs out.
/// Kept simple and standalone so it doesn't interfere with the game state.
class InvestigationClock {
  static const int startingHours = 12;
  static int hoursRemaining = startingHours;

  /// Apps the player has already opened, so each one only costs an hour once.
  static final Set<String> _opened = {};

  /// Call when the player opens an app. Costs one hour the first time only.
  static void spendHour(String appName) {
    if (_opened.contains(appName)) return;
    _opened.add(appName);
    if (hoursRemaining > 0) hoursRemaining--;
  }

  /// Resets for a new playthrough.
  static void reset() {
    hoursRemaining = startingHours;
    _opened.clear();
  }
}
