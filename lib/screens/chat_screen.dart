import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/chat_data.dart';
import '../models/evidence.dart';
import '../providers/game_provider.dart';

class ChatScreen extends StatefulWidget {
  final Conversation conversation;

  const ChatScreen({super.key, required this.conversation});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Does this conversation contain Ruby's HELP message?
      if (widget.conversation.messages.any((m) => m.text == "Help!")) {
        final gameProvider = context.read<GameProvider>();

        // Only unlock once
        if (!gameProvider.state.discoveredClues.any(
          (c) => c.title == "Final Message",
        )) {
          gameProvider.discoverClue(
            const Evidence(
              title: "Final Message",
              description: "Ruby's last text message read \"HELP!\"",
              icon: Icons.message,
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("🔎 New Evidence Discovered!"),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.conversation.contactName),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(15),

        itemCount: widget.conversation.messages.length,

        itemBuilder: (context, index) {
          final message = widget.conversation.messages[index];

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
