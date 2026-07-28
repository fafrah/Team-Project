import 'package:flutter_test/flutter_test.dart';
import 'package:finding_ruby/providers/game_provider.dart';
import 'package:finding_ruby/screens/notes_screen.dart';
import 'package:finding_ruby/screens/photos_screen.dart';

void main() {
  group('Notes and Photos evidence', () {
    late GameProvider gameProvider;

    setUp(() {
      gameProvider = GameProvider();
    });

    test('adds a Notes clue to discovered evidence', () {
      gameProvider.discoverClue(NotesScreen.alteredStatementClue);

      expect(gameProvider.state.discoveredClues.length, 1);
      expect(
        gameProvider.state.discoveredClues.first.title,
        'Altered Bank Statements',
      );
    });

    test('adds a Photos clue to discovered evidence', () {
      gameProvider.discoverClue(PhotosScreen.pinecrestLocationClue);

      expect(gameProvider.state.discoveredClues.length, 1);
      expect(
        gameProvider.state.discoveredClues.first.title,
        'Pinecrest Lake Location',
      );
    });

    test('stores both Notes and Photos clues', () {
      gameProvider.discoverClue(NotesScreen.alteredStatementClue);
      gameProvider.discoverClue(PhotosScreen.pinecrestLocationClue);

      final clueTitles = gameProvider.state.discoveredClues
          .map((clue) => clue.title)
          .toList();

      expect(gameProvider.state.discoveredClues.length, 2);
      expect(clueTitles, contains('Altered Bank Statements'));
      expect(clueTitles, contains('Pinecrest Lake Location'));
    });

    test('does not add the same evidence twice', () {
      gameProvider.discoverClue(NotesScreen.alteredStatementClue);
      gameProvider.discoverClue(NotesScreen.alteredStatementClue);

      expect(gameProvider.state.discoveredClues.length, 1);
    });

    test('resetGame removes discovered Notes and Photos clues', () {
      gameProvider.discoverClue(NotesScreen.alteredStatementClue);
      gameProvider.discoverClue(PhotosScreen.pinecrestLocationClue);

      gameProvider.resetGame();

      expect(gameProvider.state.discoveredClues, isEmpty);
      expect(gameProvider.state.currentScreen, 'intro');
    });
  });
}
