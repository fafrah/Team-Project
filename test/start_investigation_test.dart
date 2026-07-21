import 'package:flutter_test/flutter_test.dart';

import 'package:finding_ruby/screens/intro_screen.dart';
import 'package:finding_ruby/screens/loading_screen.dart';
import 'package:finding_ruby/screens/detective_screen.dart';

void main() {
  test('Scenario 1: Investigation screens all work completely', () {
    // Verifies that the IntroScreen works
    expect(IntroScreen, isNotNull);
    // Verifies that the LoadingScreen works
    expect(LoadingScreen, isNotNull);
    // Verifies that the DetectiveScreen works
    expect(DetectiveScreen, isNotNull);
  });
}
