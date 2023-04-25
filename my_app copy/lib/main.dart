import 'package:flutter/material.dart';
import 'package:my_app/posts.dart';
import 'package:my_app/profile.dart';
// import 'package:my_app/profile.dart';
// import 'package:my_app/profileinfo.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social App',
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}




