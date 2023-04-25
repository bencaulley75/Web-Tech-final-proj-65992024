import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/editprofile.dart';
import 'package:my_app/profile.dart';

class MyApi {
  Future<Map<String, dynamic>> SignUp(Map<String, dynamic> data) async {
    final url = Uri.parse('https://webtech-final-proj.uc.r.appspot.com/register_student_profile');
    final response = await http.post(url, body: jsonEncode(data));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to call Sign Up API');
    }
  }
  Future<Map<String, dynamic>> EditProfilePage(Map<String, dynamic> data) async {
    final url = Uri.parse('https://webtech-final-proj.uc.r.appspot.com/update_student_profile?student_id=65992024');
    final response = await http.patch(url, body: jsonEncode(data));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to call Edit Profile API');
    }}
  }
