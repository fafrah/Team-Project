import 'package:flutter_test/flutter_test.dart';
import 'package:finding_ruby/data/chat_data.dart';

void main() {
  test('Ruby final message is Help!', () {
    expect(conversations.first.messages.last.text, "Help!");
  });
}
