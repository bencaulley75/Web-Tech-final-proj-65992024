import 'package:flutter/material.dart';
import 'package:my_app/profile.dart';
import 'package:my_app/profileinfo.dart';
class Login extends StatefulWidget {
  Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  void LoginPageAction() async{

  }
  String studentID = '';
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 8,
            title: Text("LOGIN")
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
                            icon: Icon(Icons.person),
                            helperText: 'Name'
                        ),
                      )

                  ),

                  ElevatedButton(
                      onPressed: ()  {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      },
                      child: Text('Login')

                  ),
                  ElevatedButton(
                      onPressed: ()  {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text('Sign Up')

                  )



                ],
              )),
        )
    );
  }
}
