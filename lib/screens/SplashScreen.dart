import 'package:e_vacina/globals.dart';
import 'package:e_vacina/screens/MainScreen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:e_vacina/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InitialSplashScreen extends StatefulWidget {
  @override
  InitialSplashScreenState createState() => InitialSplashScreenState();
}

class InitialSplashScreenState extends State<InitialSplashScreen> {
  bool isValid = false;

  void loadFromFuture() async {
    bool resposta = await userController.persistLogin();
    if (resposta) {
      List profiles = userController.profiles;
      await profileController.getById(profiles[0]["_id"]);
    }
    setState(() {
      isValid = resposta;
    });
  }

  @override
  void initState() {
    super.initState();
    loadFromFuture();
    print("isValid: $isValid");
  }

  @override
  Widget build(BuildContext context) {
    print("isValid init: $isValid");
    return SplashScreen(
      seconds: 3,
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

/*Widget _introScreen(context) {
  bool _isValid = false;
  void chooseScreen(bool resposta) {
    if (resposta) {
      _isValid = true;
    }
    print("chooseScreen: $_isValid");
  }

  userController.persistLogin().then((resposta) => chooseScreen(resposta));
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 4,
        backgroundColor: Colors.white,
        navigateAfterSeconds: ,
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

changeScreen(bool isValid) {
  if (isValid) return HelpScreen();
  return LoginMenu();
}*/
