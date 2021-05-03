import 'dart:ui';
import 'package:e_vacina/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:e_vacina/component/MyWidgets.dart';

import 'package:e_vacina/globals.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  String dropdownDay;
  String dropdownMonth;
  String dropdownYear;

  var _email;
  var _password;
  var _phone;
  var _name;
  var _cpf;
  var _sex;
  var _birthDate;

  final emailCon = new TextEditingController();
  final passwordCon = new TextEditingController();
  final phoneCon = new TextEditingController();
  final cpfCon = new TextEditingController();
  final nameCon = new TextEditingController();
  final dayCon = new TextEditingController();
  final monthCon = new TextEditingController();
  final yearCon = new TextEditingController();
  final sexCon = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'e-Vacina',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyWidgets().caixaTexto('Nome', nameCon),
              MyWidgets().caixaTexto('CPF', cpfCon, maxLength: 11),
              DatePick(dayCon, monthCon, yearCon),
              GenderPicker(sexCon),
              MyWidgets().caixaTexto('Telefone', phoneCon),
              MyWidgets().caixaTexto('Email', emailCon),
              MyWidgets().caixaTexto('Senha', passwordCon, isObscure: true),
              MyWidgets().button(
                  'Registrar', 300.0, 50.0, 26, Theme.of(context).primaryColor,
                  () {
                setState(() {
                  _cpf = cpfCon.text;
                  _email = emailCon.text;
                  _name = nameCon.text;
                  _password = passwordCon.text;
                  _phone = phoneCon.text;
                  _birthDate =
                      '${yearCon.text}-${monthCon.text}-${dayCon.text}';
                  sexCon.text == '1'
                      ? (_sex = 'Masculino')
                      : (_sex = 'Feminino');
                  userController.register(
                      _email, _phone, _password, _name, _cpf, _sex, _birthDate);
                  Navigator.pop(context);
                });
              }),
            ]),
      ),
    );
  }
}
