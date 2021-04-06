import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_application_1/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InitialSplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<InitialSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return _introScreen(context);
  }
}

Widget _introScreen(context) {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 8,
        backgroundColor: Color.fromARGB(0xFF, 255, 255, 255),
        navigateAfterSeconds: LoginMenu(),
        loaderColor: Colors.blue,
      ),
      Center(
        child: Container(
          child: Text('e-Vacina',
            style: TextStyle(
              fontSize: 64,
              fontFamily: 'Suez One'
            )
          ),
        ),
      ),
    ],
  );
}