import 'package:flutter/material.dart';

class SocialMediaTwoScreen extends StatefulWidget {
  const SocialMediaTwoScreen({super.key});

  @override
  State<SocialMediaTwoScreen> createState() => _SocialMediaTwoScreenState();
}

class _SocialMediaTwoScreenState extends State<SocialMediaTwoScreen> {
  bool following = false;

  final List<bool> liked = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Diane's Social"),
      ),

      body: ListView(
        children: [
          const SizedBox(height: 20),

          const CircleAvatar(
            radius: 45,
            backgroundColor: Colors.green,
            child: Icon(Icons.person, color: Colors.white, size: 45),
          ),

          const SizedBox(height: 10),

          const Center(
            child: Text(
              "Diane",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Center(
            child: Text("@diane84", style: TextStyle(color: Colors.grey)),
          ),

          const SizedBox(height: 15),

          const Text(
            "Ruby's best friend\n📍Atlanta\nAlways looking out for the people I care about.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _Stat("56", "Posts"),
              _Stat("421", "Followers"),
              _Stat("310", "Following"),
            ],
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),

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
                story("Ruby"),
                story("Trip"),
                story("Coffee"),
                story("Memories"),
              ],
            ),
          ),

          const SizedBox(height: 20),

          DianePost(
            text:
                "Ruby has been acting strange lately. I wish she would just tell me what happened.",

            likes: "123",

            liked: liked[0],

            onLike: () {
              setState(() {
                liked[0] = !liked[0];
              });
            },
          ),

          DianePost(
            text:
                "I know something is wrong. She keeps checking her phone every few minutes.",

            likes: "204",

            liked: liked[1],

            onLike: () {
              setState(() {
                liked[1] = !liked[1];
              });
            },
          ),

          DianePost(
            text: "Some secrets are harder to keep than people realize.",

            likes: "317",

            liked: liked[2],

            onLike: () {
              setState(() {
                liked[2] = !liked[2];
              });
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

            backgroundColor: Colors.green,

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
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class DianePost extends StatelessWidget {
  final String text;
  final String likes;
  final bool liked;
  final VoidCallback onLike;

  const DianePost({
    super.key,

    required this.text,

    required this.likes,

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
            const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,

                  child: Icon(Icons.person, color: Colors.white),
                ),

                SizedBox(width: 10),

                Text(
                  "Diane",

                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Text(
              text,

              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),

            const SizedBox(height: 15),

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

                const SizedBox(width: 20),

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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
