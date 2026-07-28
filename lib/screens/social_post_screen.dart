import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/social_data.dart';
import '../models/evidence.dart';
import '../providers/game_provider.dart';

class SocialPostScreen extends StatefulWidget {
  final SocialPost post;

  const SocialPostScreen({super.key, required this.post});

  @override
  State<SocialPostScreen> createState() => _SocialPostScreenState();
}

class _SocialPostScreenState extends State<SocialPostScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Unlock evidence only when Diane Harper's post is opened
      if (widget.post.displayName == "Diane Harper") {
        final game = context.read<GameProvider>();

        if (!game.state.discoveredClues.any(
          (e) => e.title == "Pinecrest Lake",
        )) {
          game.discoverClue(
            const Evidence(
              title: "Pinecrest Lake",
              description:
                  "Diane's post places her at Pinecrest Lake shortly before Ruby disappeared.",
              icon: Icons.location_on,
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
        title: Text(widget.post.displayName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.purple,
                  child: Text(
                    widget.post.displayName[0],
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),

                const SizedBox(width: 15),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.post.displayName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        if (widget.post.verified)
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.verified,
                              color: Colors.blue,
                              size: 18,
                            ),
                          ),
                      ],
                    ),

                    Text(
                      widget.post.username,
                      style: const TextStyle(color: Colors.grey),
                    ),

                    Text(
                      widget.post.location,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              widget.post.caption,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 40),

            Row(
              children: [
                const Icon(Icons.favorite_border, color: Colors.white),

                const SizedBox(width: 8),

                Text(
                  "${widget.post.likes}",
                  style: const TextStyle(color: Colors.white),
                ),

                const SizedBox(width: 25),

                const Icon(Icons.chat_bubble_outline, color: Colors.white),

                const SizedBox(width: 8),

                Text(
                  "${widget.post.comments}",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Text(widget.post.date, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
