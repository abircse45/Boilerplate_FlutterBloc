import 'package:flutter/material.dart';

class PostDetailsScreen extends StatelessWidget {
  final int postId;
  const PostDetailsScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Post Details')),
      body: Center(
        child: Text('Post ID: $postId'),
      ),
    );
  }
}

