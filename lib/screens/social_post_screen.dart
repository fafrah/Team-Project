import 'package:flutter/material.dart';
import '../data/social_data.dart';

class SocialPostScreen extends StatelessWidget {
  final SocialPost post;

  const SocialPostScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(post.displayName),
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
                    post.displayName[0],
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
                          post.displayName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        if (post.verified)
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
                      post.username,
                      style: const TextStyle(color: Colors.grey),
                    ),

                    Text(
                      post.location,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              post.caption,
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
                  "${post.likes}",
                  style: const TextStyle(color: Colors.white),
                ),

                const SizedBox(width: 25),

                const Icon(Icons.chat_bubble_outline, color: Colors.white),

                const SizedBox(width: 8),

                Text(
                  "${post.comments}",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Text(post.date, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
