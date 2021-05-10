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
  final birthDateCon = new TextEditingController();
  final sexCon = new TextEditingController();

  String _wrongName;
  String _wrongCpf;
  String _wrongBirthDate;
  String _wrongSex;
  String _wrongEmail;
  String _wrongPhoneNumber;
  String _wrongPassword;

  bool _error = false;

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
              MyWidgets().caixaTexto('Nome', nameCon, errorText: _wrongName),
              MyWidgets().caixaTexto('CPF', cpfCon,
                  maxLength: 11, errorText: _wrongCpf),
              DatePick(
                birthDateCon,
                errorText: _wrongBirthDate,
              ),
              GenderPicker(
                sexCon,
                errorText: _wrongSex,
              ),
              MyWidgets().caixaTexto('Telefone', phoneCon,
                  errorText: _wrongPhoneNumber),
              MyWidgets().caixaTexto('Email', emailCon, errorText: _wrongEmail),
              MyWidgets().caixaTexto('Senha', passwordCon,
                  isObscure: true, errorText: _wrongPassword),
              errorText(_error),
              MyWidgets().button(
                  'Registrar', 300.0, 50.0, 26, Theme.of(context).primaryColor,
                  () {
                setState(() {
                  _cpf = cpfCon.text;
                  _email = emailCon.text;
                  _name = nameCon.text;
                  _password = passwordCon.text;
                  _phone = phoneCon.text;
                  _birthDate = birthDateCon.text;
                  sexCon.text == '1' ? _sex = 'Masculino' : _sex = 'Feminino';
                  if (!isEmpty()) {
                    _error = false;
                    userController
                        .register(_email, _phone, _password, _name, _cpf, _sex,
                            _birthDate)
                        .then((resposta) => validate(resposta));
                  } else
                    _error = true;
                });
              }),
            ]),
      ),
    );
  }

  void validate(String resposta) {
    setState(() {
      if (resposta == "{error: Email already exists}") {
        _wrongEmail = "Email já cadastrado.";
        _wrongPhoneNumber = null;
        _wrongCpf = null;
      } else if (resposta == "{error: PhoneNumber already exists}") {
        _wrongEmail = null;
        _wrongPhoneNumber = "Telefone já cadastrado.";
        _wrongCpf = null;
      } else if (resposta == "false") {
        _wrongEmail = null;
        _wrongPhoneNumber = null;
        _wrongCpf = "CPF já cadastrado.";
      } else {
        _wrongEmail = null;
        _wrongPhoneNumber = null;
        _wrongCpf = null;
        Navigator.pop(context);
      }
    });
  }

  bool isEmpty() {
    String text = "";
    bool empty = false;
    setState(() {
      _name.isEmpty ? _wrongName = text : _wrongName = null;
      _cpf.isEmpty ? _wrongCpf = text : _wrongCpf = null;
      birthDateCon.text.isEmpty
          ? _wrongBirthDate = text
          : _wrongBirthDate = null;
      sexCon.text.isEmpty ? _wrongSex = text : _wrongSex = null;
      emailCon.text.isEmpty ? _wrongEmail = text : _wrongEmail = null;
      phoneCon.text.isEmpty
          ? _wrongPhoneNumber = text
          : _wrongPhoneNumber = null;
      passwordCon.text.isEmpty ? _wrongPassword = text : _wrongPassword = null;
    });
    if (_name.isEmpty ||
        _cpf.isEmpty ||
        birthDateCon.text.isEmpty ||
        sexCon.text.isEmpty ||
        emailCon.text.isEmpty ||
        phoneCon.text.isEmpty ||
        passwordCon.text.isEmpty) {
      empty = true;
    }
    return empty;
  }
}
