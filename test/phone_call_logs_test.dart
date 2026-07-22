import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:finding_ruby/screens/phone_screen.dart';

void main() {
  testWidgets(
    'Phone screen displays Ruby call logs',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PhoneScreen(),
        ),
      );

      expect(find.text('Phone'), findsOneWidget);

      expect(find.text('Mom'), findsOneWidget);
      expect(find.text('Incoming'), findsOneWidget);
      expect(find.text('July 18, 8:42 PM'), findsOneWidget);
      expect(find.text('3 min 12 sec'), findsOneWidget);

      expect(find.text('Boyfriend'), findsOneWidget);
      expect(find.text('Missed'), findsOneWidget);

      expect(find.text('Unknown Number'), findsOneWidget);
      expect(find.text('Outgoing'), findsOneWidget);
    },
  );
}
