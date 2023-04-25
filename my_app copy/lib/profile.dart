// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:my_app/profileinfo.dart';
import 'package:my_app/login.dart';
import 'package:my_app/Auth.dart';
import 'package:http/http.dart' as http;
class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController student_id = TextEditingController();
  final TextEditingController date_of_birth = TextEditingController();
  final TextEditingController year_group = TextEditingController();
  final TextEditingController major  = TextEditingController();
  final TextEditingController best_movie = TextEditingController();
  final TextEditingController best_food = TextEditingController();
  final TextEditingController campus_residence = TextEditingController();



  void signUpAction() async{

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 8,
            title: Text("Create Your Account")
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50 ),
          // ignore: unnecessary_new
          child: new Form(
              child: ListView(
                children: [
                  Container(
                      padding: EdgeInsets.all(5.0),
                      child: TextField(
                        controller: name,
                        decoration: InputDecoration(
                            icon: Icon(Icons.accessibility),
                            helperText: 'Full Name'
                        ),
                      )

                  ),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            helperText: 'Email'
                        ),
                      )

                  ),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.perm_identity),
                            helperText: 'StudentID'
                        ),
                      )

                  ),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.date_range),
                            helperText: 'Date of Birth'
                        ),
                      )

                  ),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.group_add_rounded),
                            helperText: 'Yeargroup'
                        ),
                      )

                  ),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.book_outlined),
                            helperText: 'Major'
                        ),
                      )

                  ),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.movie),
                            helperText: 'Best Movie'
                        ),
                      )

                  ),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.food_bank),
                            helperText: 'Best Food'
                        ),
                      )

                  ),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.home),
                            helperText: 'Campus Residence'
                        ),
                      )

                  ),
                  ElevatedButton(
                      onPressed: ()  async{
                        Map<String, dynamic> myMap = {
                          'name': name.text,
                          'email': email.text,
                          'student_id': student_id.text,
                          'date_of_birth': date_of_birth.text,
                          'year_group': year_group.text,
                          'major': major.text,
                          'best_movie': best_movie.text,
                          'best_food': best_food.text,
                          'campus_residence': campus_residence.text
                        };
                        Map<String, dynamic> response = await MyApi().SignUp(myMap);
                        print(response);
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      },
                      child: Text('Sign Up')

                  ),
                  ElevatedButton(
                      onPressed: ()  {

                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text('Login')

                  )



                ],
              )),
        )
    );
  }
}