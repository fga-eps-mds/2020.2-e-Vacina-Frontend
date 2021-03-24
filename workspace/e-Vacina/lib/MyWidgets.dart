import 'package:flutter/material.dart';

class MyWidgets {
  //
  Widget caixaTexto(String texto,
      {bool isObscure = false, int maxLength = TextField.noMaxLength}) {
    return Container(
      padding: EdgeInsets.only(bottom: 11.5),
      child: TextField(
        maxLength: maxLength,
        obscureText: isObscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: texto,
        ),
      ),
    );
  }

  Widget button(String label, double largura, double altura) {
    return SizedBox(
      width: largura,
      height: altura,
      child: ElevatedButton(
        onPressed: () {
          print('Registro');
        },
        child: Text(label),
      ),
    );
  }
}
