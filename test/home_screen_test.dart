import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:finding_ruby/screens/home_screen.dart';

void main() {
  Widget makeTestableHomeScreen() {
    return const MaterialApp(home: HomeScreen());
  }

  testWidgets('Home screen shows the phone header', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableHomeScreen());

    expect(find.text("Ruby's Phone"), findsOneWidget);
  });

  testWidgets('Home screen displays the phone app icons', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableHomeScreen());

    expect(find.text('Messages'), findsOneWidget);
    expect(find.text('Photos'), findsOneWidget);
    expect(find.text('Mail'), findsOneWidget);
  });

  testWidgets('Tapping an app shows the coming soon message', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableHomeScreen());

    await tester.tap(find.text('Messages'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Messages coming soon'), findsOneWidget);
  });
}
