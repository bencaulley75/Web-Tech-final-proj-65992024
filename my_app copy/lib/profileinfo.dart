import 'package:flutter/material.dart';
import 'package:my_app/editprofile.dart';
import 'package:my_app/login.dart';
import 'package:my_app/posts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 60,

          ),
          SizedBox(height: 20),
          Text(
            'Bennett Caulley',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Management Informations System',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Posts',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '5',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Followers',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '500',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Following',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '200',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => EditProfilePage()),
                    );
                  },
                  child: Text('Edit Profile')
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text('Logout')
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => PostSection()),
                    );
                  },
                  child: Text('Check Post')
              )
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(

                  ),
                  title: Text('Post $index'),
                  subtitle: Text('Blah Blah Blah Blah Blah Blah'),

                );
              },
            ),
          ),
        ],
      ),
    );
  }
}