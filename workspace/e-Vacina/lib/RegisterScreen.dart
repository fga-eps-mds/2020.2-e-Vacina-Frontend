import 'dart:ui';
import 'package:flutter/material.dart';

import 'MyWidgets.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  String dropdownValue;
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
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    print('voltar');
                    Navigator.pop(context);
                  });
            },
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyWidgets().caixaTexto('Nome'),
            MyWidgets().caixaTexto('CPF', maxLength: 11),
            MyWidgets().caixaTexto('Data de Nascimento'),
            genderPick(),
            MyWidgets().caixaTexto('Email'),
            MyWidgets().caixaTexto('Senha', isObscure: true),
            MyWidgets().button(
                'Registrar', 300.0, 50.0, 26, Theme.of(context).primaryColor,
                () {
              print('Registro');
            }),
          ],
        ),
      ),
    );
  }

  Widget genderPick() {
    return Container(
      padding: EdgeInsets.only(bottom: 31.5),
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          hint: Text('Sexo'),
          value: dropdownValue,
          isExpanded: true,
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
              print(newValue);
            });
          },
          items: [
            DropdownMenuItem(
              child: Text('Masculino'),
              value: '1', //value pode ser mudado para valor mais significativo
            ),
            DropdownMenuItem(
              child: Text('Feminino'),
              value: '2',
            ),
          ]),
    );
  }
}
