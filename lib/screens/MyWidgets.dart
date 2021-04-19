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

  Widget BorderButton(String label, double altura, double fontSize, Color cor,
      Function onPressed) {
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
              Text(
                label,
                style: TextStyle(
                  fontSize: fontSize,
                  color: gangGray,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.arrow_forward, size: 30, color: cor),
            ],
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

class DatePick extends StatefulWidget {
  @override
  _DatePickState createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {

  String dropdownDay;
  String dropdownMonth;
  String dropdownYear;
  @override
  Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 31.5),
            width: 95,
            height: 88,
            child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint: Text('Dia'),
                value: dropdownDay,
                //isExpanded: true,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownDay = newValue;
                  });
                },
                items: <String>[
                  "1",
                  "2",
                  "3",
                  "4",
                  "5",
                  "6",
                  "7",
                  "8",
                  "9",
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
        padding: EdgeInsets.only(bottom: 31.5),
        width: 95,
        height: 88,
        child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            hint: Text('Mês'),
            value: dropdownMonth,
            //isExpanded: true,
            onChanged: (String newValue) {
              setState(() {
                dropdownMonth = newValue;
              });
            },
            items: <String>[
              "1",
              "2",
              "3",
              "4",
              "5",
              "6",
              "7",
              "8",
              "9",
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
        padding: EdgeInsets.only(bottom: 31.5),
        width: 105,
        height: 88,
        child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            hint: Text('Ano'),
            value: dropdownYear,
            //isExpanded: true,
            onChanged: (String newValue) {
              setState(() {
                dropdownYear = newValue;
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
