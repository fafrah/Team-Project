import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> conversations = [
      {
        "name": "Sarah",
        "preview": "Help!",
        "time": "Yesterday",
        "messages": [
          {
            "sender": "Ruby",
            "text":
                "can I tell you something later? it's about my mom, I don't even know how to say it",
          },
          {"sender": "Sarah", "text": "of course, you ok??"},
          {
            "sender": "Ruby",
            "text":
                "not really. I found out she's been lying about something big. like really big",
          },
          {
            "sender": "Ruby",
            "text": "I'm gonna talk to her tonight and get the truth",
          },
          {"sender": "Sarah", "text": "be careful, text me after"},
          {"sender": "Ruby", "text": "Help!"},
        ],
      },

      {
        "name": "Diane (Mom)",
        "preview": "We'll see. Drive safe",
        "time": "Monday",
        "messages": [
          {
            "sender": "Ruby",
            "text":
                "mom why are there 4 withdrawals from my college account that I never made",
          },

          {
            "sender": "Diane",
            "text":
                "Sweetie that's just the bank moving things around, nothing to worry about",
          },

          {
            "sender": "Ruby",
            "text":
                "That's not how it works. The school emailed me saying tuition is UNPAID",
          },

          {
            "sender": "Diane",
            "text":
                "I'll handle it. Stop digging into things you don't understand",
          },

          {
            "sender": "Ruby",
            "text": "I already pulled the real statements. I know what you did",
          },

          {
            "sender": "Diane",
            "text":
                "Do NOT say a word to anyone until we talk. This stays between us",
          },

          {
            "sender": "Diane",
            "text":
                "Come to the lake house tonight, just us. I'll explain everything and we'll fix it",
          },

          {"sender": "Ruby", "text": "fine. but I'm telling dad after"},

          {"sender": "Diane", "text": "We'll see. Drive safe"},
        ],
      },

      {
        "name": "Jordan",
        "preview": "whatever I have bigger stuff going on right now",
        "time": "Sunday",
        "messages": [
          {
            "sender": "Ruby",
            "text":
                "where were you last night? you said you were home but Maya saw your car downtown",
          },

          {"sender": "Jordan", "text": "I was home babe I swear"},

          {"sender": "Ruby", "text": "you're lying. why are you being weird"},

          {
            "sender": "Jordan",
            "text": "it's nothing bad I promise, just trust me ok",
          },

          {
            "sender": "Ruby",
            "text": "whatever I have bigger stuff going on right now",
          },
        ],
      },

      {
        "name": "Kayla",
        "preview": "Take it however you want",
        "time": "3 days ago",
        "messages": [
          {
            "sender": "Kayla",
            "text":
                "keep running your mouth about me and see what happens to you",
          },

          {"sender": "Ruby", "text": "is that a threat?"},

          {"sender": "Kayla", "text": "take it however you want"},
        ],
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,

        elevation: 0,

        title: const Column(
          children: [
            Text(
              "Ruby's Phone",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              "Messages",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),

        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: conversations.length,

        itemBuilder: (context, index) {
          final chat = conversations[index];

          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),

            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade800,

              child: Text(
                chat["name"][0],

                style: const TextStyle(color: Colors.white),
              ),
            ),

            title: Text(
              chat["name"],

              style: const TextStyle(
                color: Colors.white,

                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: Text(
              chat["preview"],

              style: const TextStyle(color: Colors.grey),
            ),

            trailing: Text(
              chat["time"],

              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),

            onTap: () {
              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => ChatScreen(
                    contact: chat["name"],

                    messages: List<Map<String, String>>.from(chat["messages"]),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String contact;

  final List<Map<String, String>> messages;

  const ChatScreen({super.key, required this.contact, required this.messages});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late List<Map<String, String>> messages;

  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    messages = List<Map<String, String>>.from(widget.messages);
  }

  void sendMessage() {
    if (controller.text.trim().isEmpty) {
      return;
    }

    setState(() {
      messages.add({"sender": "Ruby", "text": controller.text.trim()});

      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,

        title: Text(
          widget.contact,

          style: const TextStyle(color: Colors.white),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),

              itemCount: messages.length,

              itemBuilder: (context, index) {
                final message = messages[index];

                final bool isRuby = message["sender"] == "Ruby";

                return Align(
                  alignment: isRuby
                      ? Alignment.centerRight
                      : Alignment.centerLeft,

                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),

                    padding: const EdgeInsets.all(13),

                    constraints: const BoxConstraints(maxWidth: 280),

                    decoration: BoxDecoration(
                      color: isRuby
                          ? const Color(0xff0A84FF)
                          : const Color(0xff2C2C2E),

                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: Text(
                      message["text"] ?? "",

                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),

              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,

                      style: const TextStyle(color: Colors.white),

                      decoration: InputDecoration(
                        hintText: "Message",

                        hintStyle: const TextStyle(color: Colors.grey),

                        filled: true,

                        fillColor: const Color(0xff1C1C1E),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),

                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: sendMessage,

                    icon: const Icon(Icons.send, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
