import 'package:flutter/material.dart';

class MyWidgets {
  final Color gangGray = Color.fromRGBO(51, 51, 51, 1.0);

  Widget caixaTexto(
    String texto,
    final inputCon, {
    bool numberPad = false,
    bool isObscure = false,
    int maxLength = TextField.noMaxLength,
    TextInputType textInput = TextInputType.text,
    String errorText,
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
          errorText: errorText,
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

  Widget BorderButton(String label, double altura, double fontSize, Color cor,
      IconData arrow, Function onPressed,
      {Icon icon}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: SizedBox(
        height: altura,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(side: BorderSide(color: gangGray)),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                if (icon != null) icon,
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: fontSize,
                      color: gangGray,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ]),
              Icon(arrow, size: 30, color: cor),
            ],
          ),
        ),
      ),
    );
  }
}

class alertDialog extends StatefulWidget {
  final String label;
  final Function onPressed;

  const alertDialog(this.label, {Key key, this.onPressed}) : super(key: key);
  @override
  _alertDialogState createState() => _alertDialogState();
}

class _alertDialogState extends State<alertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        widget.label,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
          onPressed: widget.onPressed,
          child: Text(
            "Ok",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class errorText extends StatefulWidget {
  final bool error;

  const errorText(this.error, {Key key}) : super(key: key);
  @override
  _errorTextState createState() => _errorTextState();
}

class _errorTextState extends State<errorText> {
  Color mostraTexto() {
    Color color;
    widget.error
        ? color = Color.fromRGBO(200, 0, 0, 1)
        : color = Color.fromRGBO(200, 0, 0, 0);
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      width: 20000,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Preencha todos os campos obrigatórios.",
            style: TextStyle(
              fontSize: 15,
              color: mostraTexto(),
            ),
          )
        ],
      ),
    );
  }
}

class textSwitch extends StatefulWidget {
  final String label;
  final double altura, fontSize;
  final Icon icon;

  const textSwitch(this.label, this.altura, this.fontSize, {Key key, this.icon})
      : super(key: key);
  @override
  _textSwitchState createState() => _textSwitchState();
}

class _textSwitchState extends State<textSwitch> {
  bool _escolha = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.altura,
        decoration: (BoxDecoration(
          border: Border.all(
              width: 1.0, color: const Color.fromRGBO(100, 100, 100, 1)),
        )),
        child: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                if (widget.icon != null) widget.icon,
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: widget.fontSize,
                      color: Color.fromRGBO(51, 51, 51, 1.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ]),
              Switch(
                  value: _escolha,
                  onChanged: (bool valor) {
                    setState(() {
                      _escolha = valor;
                    });
                  })
            ],
          ),
        ));
  }
}

class GenderPicker extends StatefulWidget {
  final TextEditingController controller;
  final String errorText;
  final String dropdownValue;
  const GenderPicker(this.controller,
      {Key key, this.errorText, this.dropdownValue})
      : super(key: key);

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
              border: OutlineInputBorder(), errorText: widget.errorText),
          hint: Text('Sexo'),
          value: widget.dropdownValue,
          isExpanded: true,
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
              widget.controller.text = newValue;
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

class DatePick extends StatefulWidget {
  final TextEditingController dayController;
  final TextEditingController monthController;
  final TextEditingController yearController;
  final String errorTextDay;
  final String errorTextMonth;
  final String errorTextYear;
  final String dropdownDay;
  final String dropdownMonth;
  final String dropdownYear;

  const DatePick(this.dayController, this.monthController, this.yearController,
      {Key key,
      this.errorTextDay,
      this.errorTextMonth,
      this.errorTextYear,
      this.dropdownDay,
      this.dropdownMonth,
      this.dropdownYear})
      : super(key: key);
  @override
  _DatePickState createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  String dropdownDay;
  String dropdownMonth;
  String dropdownYear;
  double altura = 88;

  double mudaAltura(double altura) {
    if (widget.errorTextDay != null ||
        widget.errorTextMonth != null ||
        widget.errorTextYear != null) {
      altura = 83;
    } else
      altura = 88;
    return altura;
  }

  EdgeInsets mudaPadding() {
    EdgeInsets padding;
    if (widget.errorTextDay != null ||
        widget.errorTextMonth != null ||
        widget.errorTextYear != null) {
      padding = EdgeInsets.only(bottom: 4.5);
    } else
      padding = EdgeInsets.only(bottom: 31.5);
    return padding;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: mudaPadding(),
          width: 95,
          height: mudaAltura(altura),
          child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), errorText: widget.errorTextDay),
              hint: Text('Dia'),
              value: widget.dropdownDay,
              //isExpanded: true,
              onChanged: (String newValue) {
                setState(() {
                  dropdownDay = newValue;
                  widget.dayController.text = newValue;
                });
              },
              items: <String>[
                "01",
                "02",
                "03",
                "04",
                "05",
                "06",
                "07",
                "08",
                "09",
                "10",
                "11",
                "12",
                "13",
                "14",
                "15",
                "16",
                "17",
                "18",
                "19",
                "20",
                "21",
                "22",
                "23",
                "24",
                "25",
                "26",
                "27",
                "28",
                "29",
                "30",
                "31"
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
        ),
        Container(
          padding: mudaPadding(),
          width: 95,
          height: mudaAltura(altura),
          child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  errorText: widget.errorTextMonth),
              hint: Text('Mês'),
              value: widget.dropdownMonth,
              //isExpanded: true,
              onChanged: (String newValue) {
                setState(() {
                  dropdownMonth = newValue;
                  widget.monthController.text = newValue;
                });
              },
              items: <String>[
                "01",
                "02",
                "03",
                "04",
                "05",
                "06",
                "07",
                "08",
                "09",
                "10",
                "11",
                "12"
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
        ),
        Container(
          padding: mudaPadding(),
          width: 105,
          height: mudaAltura(altura),
          child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  errorText: widget.errorTextYear),
              hint: Text('Ano'),
              value: widget.dropdownYear,
              //isExpanded: true,
              onChanged: (String newValue) {
                setState(() {
                  dropdownYear = newValue;
                  widget.yearController.text = newValue;
                });
              },
              items: <String>[
                "1920",
                "1921",
                "1922",
                "1923",
                "1924",
                "1925",
                "1926",
                "1927",
                "1928",
                "1929",
                "1930",
                "1931",
                "1932",
                "1933",
                "1934",
                "1935",
                "1936",
                "1937",
                "1938",
                "1939",
                "1940",
                "1941",
                "1942",
                "1943",
                "1944",
                "1945",
                "1946",
                "1947",
                "1948",
                "1949",
                "1950",
                "1951",
                "1952",
                "1953",
                "1954",
                "1955",
                "1956",
                "1957",
                "1958",
                "1959",
                "1960",
                "1961",
                "1962",
                "1963",
                "1964",
                "1965",
                "1966",
                "1967",
                "1968",
                "1969",
                "1970",
                "1971",
                "1972",
                "1973",
                "1974",
                "1975",
                "1976",
                "1977",
                "1978",
                "1979",
                "1980",
                "1981",
                "1982",
                "1983",
                "1984",
                "1985",
                "1986",
                "1987",
                "1988",
                "1989",
                "1990",
                "1991",
                "1992",
                "1993",
                "1994",
                "1995",
                "1996",
                "1997",
                "1998",
                "1999",
                "2000",
                "2001",
                "2002",
                "2003",
                "2004",
                "2005",
                "2006",
                "2007",
                "2008",
                "2009",
                "2010",
                "2011",
                "2012",
                "2013",
                "2014",
                "2015",
                "2016",
                "2017",
                "2018",
                "2019",
                "2020",
                "2021"
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
        ),
      ],
    );
  }
}
