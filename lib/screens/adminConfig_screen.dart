import 'package:e_vacina/globals.dart';
import 'package:flutter/material.dart';
import 'MyWidgets.dart';

class AdminConfig extends StatefulWidget {
  @override
  AdminConfigState createState() => AdminConfigState();
}

class AdminConfigState extends State<AdminConfig> {
  final passwordCon = new TextEditingController();
  final emailCon = new TextEditingController();
  final phoneCon = new TextEditingController();

  var _phone;
  var _email;
  var _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        elevation: 5,
        shadowColor: Color.fromRGBO(0, 0, 0, 1),
        centerTitle: true,
        title: Text(
          'Configurações',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
          ),
        ),
        leading: Builder(builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                print('voltar');
                Navigator.pop(context);
              },
              alignment: Alignment.centerRight,
            ),
          );
        }),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _email = emailCon.text;
                    _password = passwordCon.text;
                    _phone = phoneCon.text;
                  });
                  userController.update(_email, _phone, _password);
                },
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    color: Color.fromRGBO(42, 174, 198, 1),
                  ),
                ),
              )),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MyWidgets().caixaTexto('Email', emailCon),
              MyWidgets().caixaTexto('Telefone', phoneCon),
              MyWidgets().caixaTexto('Senha', passwordCon, isObscure: true),
              MyWidgets().button('Excluir Usuário', 200, 50, 17,
                  Color.fromARGB(0xFF, 255, 66, 66), () {
                setState(() {
                  _email = emailCon.text;
                  _password = passwordCon.text;
                  _phone = phoneCon.text;
                });
                userController.delete();
                print(
                    "Excluir Conta Email:$_email, Telefone:$_phone, Senha:$_password");
              }),
              Padding(
                padding: EdgeInsets.only(right: 248),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
