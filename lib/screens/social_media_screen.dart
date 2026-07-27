import 'package:flutter/material.dart';
import 'social_media_two_screen.dart';
import 'social_media_three_screen.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({super.key});

  @override
  State<SocialMediaScreen> createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  bool following = false;

  final List<bool> liked = [false, false, false, false];

  final posts = [
    {
      "text":
          "Something feels really off lately... I don't think I can trust everyone around me anymore.",
      "likes": "143",
      "comments": "18",
      "time": "3 days ago",
    },

    {
      "text":
          "If someone lies about where they were once... what else are they lying about?",
      "likes": "212",
      "comments": "41",
      "time": "2 days ago",
    },

    {
      "text":
          "Sometimes the people who are supposed to protect you hurt you the most.",
      "likes": "305",
      "comments": "53",
      "time": "Yesterday",
    },

    {
      "text": "Tomorrow I'm getting answers. No more excuses.",
      "likes": "417",
      "comments": "76",
      "time": "Yesterday • 6:12 PM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,

        title: const Text("Ruby's Social"),
      ),

      body: ListView(
        children: [
          const SizedBox(height: 20),

          const CircleAvatar(
            radius: 45,

            backgroundColor: Colors.pink,

            child: Icon(Icons.person, color: Colors.white, size: 45),
          ),

          const SizedBox(height: 10),

          const Center(
            child: Text(
              "Ruby",

              style: TextStyle(
                color: Colors.white,

                fontSize: 24,

                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Center(
            child: Text("@ruby_m", style: TextStyle(color: Colors.grey)),
          ),

          const SizedBox(height: 15),

          const Text(
            "Computer Science Student\n📍Atlanta\nTrying to find answers before it's too late.",

            textAlign: TextAlign.center,

            style: TextStyle(color: Colors.white70),
          ),

          const SizedBox(height: 20),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              _Stat("34", "Posts"),

              _Stat("142", "Followers"),

              _Stat("189", "Following"),
            ],
          ),

          const SizedBox(height: 15),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              foregroundColor: Colors.black,
            ),

            onPressed: () {
              setState(() {
                following = !following;
              });
            },

            child: Text(following ? "Following" : "Follow"),
          ),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),

            child: Text(
              "Stories",

              style: TextStyle(
                color: Colors.white,

                fontSize: 18,

                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 80,

            child: ListView(
              scrollDirection: Axis.horizontal,

              children: [
                story("Me"),

                story("Campus"),

                story("Friends"),

                story("Secret"),
              ],
            ),
          ),

          const SizedBox(height: 20),

          ...List.generate(posts.length, (index) {
            return RubyPost(
              text: posts[index]["text"]!,

              likes: posts[index]["likes"]!,

              comments: posts[index]["comments"]!,

              time: posts[index]["time"]!,

              liked: liked[index],

              onLike: () {
                setState(() {
                  liked[index] = !liked[index];
                });
              },
            );
          }),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.all(16),

            child: Text(
              "Connected Accounts",

              style: TextStyle(
                color: Colors.white,

                fontSize: 20,

                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),

            title: const Text("Diane", style: TextStyle(color: Colors.white)),

            subtitle: const Text(
              "@diane84",

              style: TextStyle(color: Colors.grey),
            ),

            onTap: () {
              Navigator.push(
                context,

                MaterialPageRoute(builder: (_) => const SocialMediaTwoScreen()),
              );
            },
          ),

          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),

            title: const Text("Jordan", style: TextStyle(color: Colors.white)),

            subtitle: const Text(
              "@jordantaylor",

              style: TextStyle(color: Colors.grey),
            ),

            onTap: () {
              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => const SocialMediaThreeScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget story(String name) {
    return Container(
      width: 75,

      margin: const EdgeInsets.symmetric(horizontal: 8),

      child: Column(
        children: [
          CircleAvatar(
            radius: 25,

            backgroundColor: Colors.pink,

            child: Text(name[0], style: const TextStyle(color: Colors.white)),
          ),

          const SizedBox(height: 5),

          Text(
            name,

            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String number;
  final String label;

  const _Stat(this.number, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,

          style: const TextStyle(
            color: Colors.white,

            fontSize: 20,

            fontWeight: FontWeight.bold,
          ),
        ),

        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class RubyPost extends StatelessWidget {
  final String text;
  final String likes;
  final String comments;
  final String time;
  final bool liked;
  final VoidCallback onLike;

  const RubyPost({
    super.key,

    required this.text,

    required this.likes,

    required this.comments,

    required this.time,

    required this.liked,

    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff1C1C1E),

      margin: const EdgeInsets.all(12),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Ruby @ruby_m",

              style: TextStyle(
                color: Colors.white,

                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              text,

              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),

            Row(
              children: [
                IconButton(
                  onPressed: onLike,

                  icon: Icon(
                    liked ? Icons.favorite : Icons.favorite_border,

                    color: Colors.redAccent,
                  ),
                ),

                Text(
                  liked ? "${int.parse(likes) + 1}" : likes,

                  style: const TextStyle(color: Colors.white70),
                ),

                IconButton(
                  icon: const Icon(Icons.comment, color: Colors.white70),

                  onPressed: () {
                    showDialog(
                      context: context,

                      builder: (_) => AlertDialog(
                        title: const Text("Comments"),

                        content: const Text("I hope Ruby is okay..."),
                      ),
                    );
                  },
                ),

                Text(comments, style: const TextStyle(color: Colors.white70)),

                const Spacer(),

                Text(
                  time,

                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
