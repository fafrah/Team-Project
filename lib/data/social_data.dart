class SocialPost {
  final String username;
  final String displayName;
  final String location;
  final String caption;
  final String date;
  final int likes;
  final int comments;
  final bool verified;

  const SocialPost({
    required this.username,
    required this.displayName,
    required this.location,
    required this.caption,
    required this.date,
    required this.likes,
    required this.comments,
    this.verified = false,
  });
}

final List<SocialPost> socialPosts = [
  // ==========================================
  // Diane
  // ==========================================
  SocialPost(
    username: "@diane_h",
    displayName: "Diane Harper",
    verified: false,
    location: "📍 Pinecrest Lake",
    date: "9:40 PM",
    likes: 42,
    comments: 8,
    caption:
        "Needed to get away and clear my head tonight. Sometimes a little peace and quiet is exactly what you need. ❤️",
  ),

  // ==========================================
  // Jordan
  // ==========================================
  SocialPost(
    username: "@jordansmith",
    displayName: "Jordan",
    verified: false,
    location: "Downtown Atlanta",
    date: "8:12 PM",
    likes: 95,
    comments: 17,
    caption:
        "Finally picked everything up. Can't wait to surprise someone special tomorrow. 💍🎁",
  ),

  // ==========================================
  // Kayla
  // ==========================================
  SocialPost(
    username: "@kaylaofficial",
    displayName: "Kayla",
    verified: false,
    location: "Lexie's House",
    date: "8:15 PM",
    likes: 184,
    comments: 41,
    caption: "LIVE all night 😂😂 Best party we've had in months!!",
  ),
];
