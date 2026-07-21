import 'package:flutter/material.dart';
import '../data/chat_data.dart';

class ChatScreen extends StatelessWidget {
  final Conversation conversation;

  const ChatScreen({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text(conversation.contactName),
        backgroundColor: Colors.black,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(15),

        itemCount: conversation.messages.length,

        itemBuilder: (context, index) {
          final message = conversation.messages[index];

          return Align(
            alignment: message.isRuby
                ? Alignment.centerRight
                : Alignment.centerLeft,

            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320),

              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6),

                padding: const EdgeInsets.all(14),

                decoration: BoxDecoration(
                  color: message.isRuby ? Colors.blue : Colors.grey.shade800,

                  borderRadius: BorderRadius.circular(18),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      message.text,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      message.time,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
