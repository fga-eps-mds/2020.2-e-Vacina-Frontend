import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class User{

Future<String> createUser() async{

  var url = Uri.parse('https://localhost:3000/user/');
  final response = await http.post(
    url,
     body: {'email': ,
       'password': ,
       'phoneNumber': ,
  });
   print('Response status: ${response.statusCode}');
   print('Response body: ${response.body}');

}

Future<String> deleteUser(String? _userId) async{

  var url = Uri.parse('https://localhost:3000/user/$_userId');
  final response = await http.delete(url,);
   print('Response status: ${response.statusCode}');
   print('Response body: ${response.body}');

}

Future<String> updateUser() async{

  var url = Uri.parse('https://localhost:3000/user/');
  final response = await http.post(
    url,
     body: {'email': ,
       'password': ,
       'phoneNumber': ,
  });
   print('Response status: ${response.statusCode}');
   print('Response body: ${response.body}');

}

Future<String> getUserById() async{

  var url = Uri.parse('https://localhost:3000/user/');
  final response = await http.get(
    url,
  });
   print('Response status: ${response.statusCode}');
   print('Response body: ${response.body}');

}




}

