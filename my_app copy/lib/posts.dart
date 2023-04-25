import 'package:flutter/material.dart';
import 'package:my_app/profileinfo.dart';

class Post {
  final String title;
  final String content;

  Post(this.title, this.content);
}

class PostsSection extends StatelessWidget {
  final List<Post> posts;

   PostsSection({required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  posts[index].title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  posts[index].content,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),

          ),
        );
      },
    );

  }
}

class PostSection extends StatelessWidget {
  final List<Post> posts = [
    Post(
      'Post 1',
      'blah blah blah blah blah blah',
    ),
    Post(
      'Post 2',
      'blah blah blah blah blah blah',
    ),
    Post(
      'Post 3',
      'blah blah blah blah blah blah',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My APP Posts',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My APP Posts'),
        ),
        body: PostsSection(posts: posts),
      ),
    );
  }
}

void main() {
  runApp(PostSection());
}