import 'package:splashscreen/splashscreen.dart';
import 'package:e_vacina/screens/LoginScreen.dart';
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
        seconds: 1,
        backgroundColor: Colors.white,
        navigateAfterSeconds: LoginMenu(),
        loaderColor: Theme.of(context).primaryColor,
        title: Text(
          'e-Vacina',
          style: TextStyle(
            fontSize: 64,
            fontFamily: 'SuezOne',
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    ],
  );
}
