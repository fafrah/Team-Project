class ChatMessage {
  final String sender;
  final String text;
  final String time;
  final bool isRuby;

  const ChatMessage({
    required this.sender,
    required this.text,
    required this.time,
    required this.isRuby,
  });
}

class Conversation {
  final String contactName;
  final String preview;
  final List<ChatMessage> messages;

  const Conversation({
    required this.contactName,
    required this.preview,
    required this.messages,
  });
}

final List<Conversation> conversations = [
  // ==========================
  // Ruby and Sarah (Player)
  // ==========================
  Conversation(
    contactName: "Sarah ❤️",
    preview: "Help!",
    messages: const [
      ChatMessage(
        sender: "Ruby",
        text:
            "can I tell you something later? it's about my mom, I don't even know how to say it",
        time: "8:14 PM",
        isRuby: true,
      ),
      ChatMessage(
        sender: "Sarah",
        text: "of course, you ok??",
        time: "8:15 PM",
        isRuby: false,
      ),
      ChatMessage(
        sender: "Ruby",
        text:
            "not really. I found out she's been lying about something big. like really big",
        time: "8:16 PM",
        isRuby: true,
      ),
      ChatMessage(
        sender: "Ruby",
        text: "I'm gonna talk to her tonight and get the truth",
        time: "8:17 PM",
        isRuby: true,
      ),
      ChatMessage(
        sender: "Sarah",
        text: "be careful, text me after",
        time: "8:18 PM",
        isRuby: false,
      ),
      ChatMessage(sender: "Ruby", text: "Help!", time: "9:42 AM", isRuby: true),
    ],
  ),

  // ==========================
  // Diane (Mom)
  // ==========================
  Conversation(
    contactName: "Diane",
    preview: "Drive safe",
    messages: const [
      ChatMessage(
        sender: "Ruby",
        text:
            "mom why are there 4 withdrawals from my college account that I never made",
        time: "5:04 PM",
        isRuby: true,
      ),
      ChatMessage(
        sender: "Diane",
        text:
            "Sweetie that's just the bank moving things around, nothing to worry about",
        time: "5:07 PM",
        isRuby: false,
      ),
      ChatMessage(
        sender: "Ruby",
        text:
            "That's not how it works. The school emailed me saying tuition is UNPAID",
        time: "5:09 PM",
        isRuby: true,
      ),
      ChatMessage(
        sender: "Diane",
        text: "I'll handle it. Stop digging into things you don't understand",
        time: "5:11 PM",
        isRuby: false,
      ),
      ChatMessage(
        sender: "Ruby",
        text: "I already pulled the real statements. I know what you did",
        time: "5:18 PM",
        isRuby: true,
      ),
      ChatMessage(
        sender: "Diane",
        text:
            "Do NOT say a word to anyone until we talk. This stays between us",
        time: "5:20 PM",
        isRuby: false,
      ),
      ChatMessage(
        sender: "Diane",
        text:
            "Come to the lake house tonight, just us. I'll explain everything and we'll fix it",
        time: "5:21 PM",
        isRuby: false,
      ),
      ChatMessage(
        sender: "Ruby",
        text: "fine. but I'm telling dad after",
        time: "5:22 PM",
        isRuby: true,
      ),
      ChatMessage(
        sender: "Diane",
        text: "We'll see. Drive safe",
        time: "5:23 PM",
        isRuby: false,
      ),
    ],
  ),

  // ==========================
  // Jordan
  // ==========================
  Conversation(
    contactName: "Jordan",
    preview: "please tell me she's ok",
    messages: const [
      ChatMessage(
        sender: "Ruby",
        text:
            "where were you last night? you said you were home but Maya saw your car downtown",
        time: "6:02 PM",
        isRuby: true,
      ),
      ChatMessage(
        sender: "Jordan",
        text: "I was home babe I swear",
        time: "6:05 PM",
        isRuby: false,
      ),
      ChatMessage(
        sender: "Ruby",
        text: "you're lying. why are you being weird",
        time: "6:07 PM",
        isRuby: true,
      ),
      ChatMessage(
        sender: "Jordan",
        text: "it's nothing bad I promise, just trust me ok",
        time: "6:10 PM",
        isRuby: false,
      ),
      ChatMessage(
        sender: "Ruby",
        text: "whatever I have bigger stuff going on right now",
        time: "6:12 PM",
        isRuby: true,
      ),
      ChatMessage(
        sender: "Jordan",
        text:
            "is Ruby with you?? she's not answering. I know I looked sketchy but I PROMISE it's not what it looks like, please tell me she's ok",
        time: "11:13 AM",
        isRuby: false,
      ),
    ],
  ),

  // ==========================
  // Kayla
  // ==========================
  Conversation(
    contactName: "Kayla",
    preview: "take it however you want",
    messages: const [
      ChatMessage(
        sender: "Kayla",
        text: "keep running your mouth about me and see what happens to you",
        time: "7:44 PM",
        isRuby: false,
      ),
      ChatMessage(
        sender: "Ruby",
        text: "is that a threat?",
        time: "7:45 PM",
        isRuby: true,
      ),
      ChatMessage(
        sender: "Kayla",
        text: "take it however you want",
        time: "7:46 PM",
        isRuby: false,
      ),
    ],
  ),
];
