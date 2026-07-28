import 'package:flutter/material.dart';
import '../data/chat_data.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Messages"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (context, index) {
          final conversation = conversations[index];

          return ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blueGrey,
              child: Text(
                conversation.contactName[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            title: Text(
              conversation.contactName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: Text(
              conversation.preview,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white70),
            ),

            trailing: Text(
              conversation.messages.last.time,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(conversation: conversation),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
