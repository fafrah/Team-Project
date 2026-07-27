import 'package:flutter/material.dart';

class SocialMediaThreeScreen extends StatefulWidget {
  const SocialMediaThreeScreen({super.key});

  @override
  State<SocialMediaThreeScreen> createState() => _SocialMediaThreeScreenState();
}

class _SocialMediaThreeScreenState extends State<SocialMediaThreeScreen> {
  bool following = false;

  final List<bool> liked = [false, false, false];

  final posts = [
    {
      "text":
          "Long night downtown... finally got everything together. Hope it's worth it.",
      "likes": "164",
      "comments": "22",
      "time": "Night Ruby disappeared • 7:52 PM",
    },

    {
      "text": "One last stop before tomorrow. Can't wait to see her reaction.",
      "likes": "219",
      "comments": "31",
      "time": "Night Ruby disappeared • 8:34 PM",
    },

    {
      "text":
          "Some lies sound worse than the truth... but I couldn't ruin the surprise.",
      "likes": "312",
      "comments": "48",
      "time": "Yesterday",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,

        title: const Text("Jordan's Social"),
      ),

      body: ListView(
        children: [
          const SizedBox(height: 20),

          const CircleAvatar(
            radius: 45,

            backgroundColor: Colors.blue,

            child: Icon(Icons.person, color: Colors.white, size: 45),
          ),

          const SizedBox(height: 10),

          const Center(
            child: Text(
              "Jordan",

              style: TextStyle(
                color: Colors.white,

                fontSize: 24,

                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Center(
            child: Text("@jordantaylor", style: TextStyle(color: Colors.grey)),
          ),

          const SizedBox(height: 15),

          const Text(
            "📍Atlanta\nPlanning something bigger than people realize.",

            textAlign: TextAlign.center,

            style: TextStyle(color: Colors.white70),
          ),

          const SizedBox(height: 20),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              _Stat("18", "Posts"),

              _Stat("287", "Followers"),

              _Stat("201", "Following"),
            ],
          ),

          const SizedBox(height: 15),

          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),

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
                story("Work"),

                story("Gift"),

                story("Night"),

                story("Secret"),
              ],
            ),
          ),

          const SizedBox(height: 20),

          ...List.generate(posts.length, (index) {
            return JordanPost(
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
              "Top Comments",

              style: TextStyle(
                color: Colors.white,

                fontSize: 18,

                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),

            title: Text("Maya", style: TextStyle(color: Colors.white)),

            subtitle: Text(
              "Did she like the gift?? 😂",

              style: TextStyle(color: Colors.grey),
            ),
          ),

          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),

            title: Text("Jordan", style: TextStyle(color: Colors.white)),

            subtitle: Text(
              "Haven't been able to give it to her yet...",

              style: TextStyle(color: Colors.grey),
            ),
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

            backgroundColor: Colors.blue,

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

class JordanPost extends StatelessWidget {
  final String text;
  final String likes;
  final String comments;
  final String time;
  final bool liked;
  final VoidCallback onLike;

  const JordanPost({
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
              "Jordan @jordantaylor",

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

                        content: const Text(
                          "Something about this post feels suspicious...",
                        ),
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
