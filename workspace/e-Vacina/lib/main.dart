import 'package:flutter/material.dart';
import 'RegisterScreen.dart';
import 'RegisterScreen.dart';
import 'adminConfig_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'e-Vacina',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(42, 174, 198, 1.0),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: RegisterScreen(),
    );
  }
}
