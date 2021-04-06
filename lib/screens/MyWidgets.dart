import 'package:flutter/material.dart';

class MyWidgets {
  Widget caixaTexto(
    String texto,
    final inputCon, {
    bool numberPad = false,
    bool isObscure = false,
    int maxLength = TextField.noMaxLength,
    TextInputType textInput = TextInputType.text,
  }) {
    return Container(
      padding: EdgeInsets.only(bottom: 11.5),
      child: TextField(
        controller: inputCon,
        keyboardType: textInput,
        maxLength: maxLength,
        obscureText: isObscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: texto,
        ),
        //controller: _textEditingController,
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

class GenderPicker extends StatefulWidget {
  @override
  _GenderPickerState createState() => _GenderPickerState();
}

class _GenderPickerState extends State<GenderPicker> {
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
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
