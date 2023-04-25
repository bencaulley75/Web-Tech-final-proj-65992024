import 'package:flutter/material.dart';
import 'package:my_app/profileinfo.dart';

import 'Auth.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController major  = TextEditingController();
  final TextEditingController year_group = TextEditingController();
  final TextEditingController best_food = TextEditingController();
  final TextEditingController best_movie = TextEditingController();
  final TextEditingController campus_residence = TextEditingController();
  String _major = '';
  String _yeargroup = '';
  String _best_food = '';
  String _best_movie = '';
  String _campus_residence = '';



  TextEditingController _majorController = TextEditingController();
  TextEditingController _yeargroupController = TextEditingController();
  TextEditingController _best_foodController = TextEditingController();
  TextEditingController _best_movieController = TextEditingController();
  TextEditingController _campus_residenceController = TextEditingController();


  @override
  void initState() {
    _majorController.text = _major;
    _yeargroupController.text = _yeargroup;
    _best_foodController.text = _best_food;
    _best_movieController.text = _best_movie;
    _campus_residenceController.text = _campus_residence;
    super.initState();
  }

  @override
  void dispose() {
    _majorController.dispose();
    _yeargroupController.dispose();
    _best_foodController.dispose();
    _best_movieController.dispose();
    _campus_residenceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Edit Profile'),

      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Major',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _majorController,
              decoration: InputDecoration(
                hintText: 'Enter your major',
              ),
              onChanged: (value) {
                setState(() {
                  _major = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Year Group',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _yeargroupController,
              decoration: InputDecoration(
                hintText: 'Enter your yeargroup',
              ),
              onChanged: (value) {
                setState(() {
                  _yeargroup = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Best Food',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _best_foodController,
              decoration: InputDecoration(
                hintText: 'Enter your best food',
              ),
              onChanged: (value) {
                setState(() {
                  _best_food = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Best Movie',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _best_movieController,
              decoration: InputDecoration(
                hintText: 'Enter your Best Movie',
              ),
              onChanged: (value) {
                setState(() {
                  _best_movie = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Campus Residence',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _campus_residenceController,
              decoration: InputDecoration(
                hintText: 'Enter your campus residence',
              ),
              onChanged: (value) {
                setState(() {
                  _campus_residence = value;
                });
              },
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: ()  async{
                Map<String, dynamic> myMap = {
                  'year_group': year_group.text,
                  'major': major.text,
                  'best_movie': best_movie.text,
                  'best_food': best_food.text,
                  'campus_residence': campus_residence.text
                };
                Map<String, dynamic> response = await MyApi().EditProfilePage(myMap);
                print(response);
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );

  }
}