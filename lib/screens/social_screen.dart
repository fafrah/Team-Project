import 'package:flutter/material.dart';
import '../data/social_data.dart';
import 'social_post_screen.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Social"),
      ),

      body: ListView.builder(
        itemCount: socialPosts.length,

        itemBuilder: (context, index) {
          final post = socialPosts[index];

          return Card(
            color: Colors.grey.shade900,
            margin: const EdgeInsets.all(10),

            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text(
                  post.displayName[0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              title: Row(
                children: [
                  Text(
                    post.displayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  if (post.verified)
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(Icons.verified, color: Colors.blue, size: 18),
                    ),
                ],
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    post.username,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    post.caption,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),

              trailing: Text(
                post.date,
                style: const TextStyle(color: Colors.grey),
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SocialPostScreen(post: post),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
