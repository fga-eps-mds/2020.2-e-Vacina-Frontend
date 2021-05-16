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

  void loadFromFuture() async {
    bool resposta = await userController.persistLogin();
    if (resposta) {
      List profiles = userController.profiles;
      await profileController
          .getById(profiles[profileController.currentIndex]["_id"]);
    }
    setState(() {
      isValid = resposta;
    });
  }

  @override
  void initState() {
    super.initState();
    loadFromFuture();
  }

  @override
  Widget build(BuildContext context) {
    print("isValid init: $isValid");
    return SplashScreen(
      seconds: 10,
      backgroundColor: Colors.white,
      navigateAfterSeconds: isValid ? MainScreen() : LoginMenu(),
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
