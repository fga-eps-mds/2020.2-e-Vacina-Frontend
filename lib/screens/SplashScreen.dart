import 'package:e_vacina/globals.dart';
import 'package:e_vacina/screens/MainScreen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:e_vacina/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InitialSplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<InitialSplashScreen> {
  bool isValid = false;

  Future<Widget> loadFromFuture() async {
    bool resposta = await userController.persistLogin();
    if (resposta) {
      List profiles = userController.profiles;
      await profileController
          .getById(profiles[profileController.currentIndex]["_id"]);
      return Future.value(new MainScreen());
    }
    return Future.value(new LoginMenu());
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.white,
      navigateAfterFuture: loadFromFuture(),
      loaderColor: Theme.of(context).primaryColor,
      title: Text(
        'e-Vacina',
        style: TextStyle(
          fontSize: 64,
          fontFamily: 'SuezOne',
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
