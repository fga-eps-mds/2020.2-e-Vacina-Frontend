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
  Future<Widget> loadFromFuture() async {
    bool resposta = false;
    resposta = await userController.persistLogin();
    if (resposta)
      return Future.value(MainScreen());
    else
      return Future.value(LoginMenu());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 2,
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
