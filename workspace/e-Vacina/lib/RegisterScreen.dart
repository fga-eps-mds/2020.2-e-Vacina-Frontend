import 'dart:ui';
import 'package:flutter/material.dart';

import 'Caixa.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return _menuRegistro(context);
  }
}

Widget _menuRegistro(context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'e-Vacina',
        style:
            TextStyle(color: Color.fromRGBO(42, 174, 198, 1.0), fontSize: 25),
      ),
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyWidgets().caixaTexto('Nome'),
          MyWidgets().caixaTexto('CPF', maxLength: 11),
          MyWidgets().caixaTexto('Data de Nascimento'),
          MyWidgets().caixaTexto('Sexo'),
          MyWidgets().caixaTexto('Email'),
          MyWidgets().caixaTexto('Senha', isObscure: true),
          MyWidgets().button('Registrar', 300.0, 50.0),
        ],
      ),
    ),
  );
}
