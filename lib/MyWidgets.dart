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

  Widget button(String label, double largura, double altura, double fontSize,
      Color cor, Function onPressedAction) {
    return Padding(
      padding: EdgeInsets.only(bottom: 11.5),
      child: SizedBox(
        width: largura,
        height: altura,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: cor),
          onPressed: () {
            onPressedAction();
          },
          child: Text(
            label,
            style: TextStyle(fontSize: fontSize),
          ),
        ),
      ),
    );
  }

  Widget textButton(String label, double largura, double altura,
      double fontSize, Color cor, Function onPressedAction) {
    return Padding(
      padding: EdgeInsets.only(bottom: 11.5),
      child: SizedBox(
        width: largura,
        height: altura,
        child: TextButton(
          onPressed: () {
            onPressedAction();
          },
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              color: cor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
