import 'dart:ui';
import 'package:flutter/material.dart';
import 'MyWidgets.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  String dropdownDay;
  String dropdownMonth;
  String dropdownYear;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dayPick(),
                  monthPick(),
                  yearPick(),
                ],
              ),
              GenderPicker(),
              MyWidgets().caixaTexto('Telefone'),
              MyWidgets().caixaTexto('Email'),
              MyWidgets().caixaTexto('Senha', isObscure: true),
              MyWidgets().button(
                  'Registrar', 300.0, 50.0, 26, Theme.of(context).primaryColor,
                  () {
                print('Registro');
              }),
            ]),
      ),
    );
  }

  Widget dayPick() {
    return Container(
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
    );
  }

  Widget monthPick() {
    return Container(
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
    );
  }

  Widget yearPick() {
    return Container(
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
    );
  }
}
