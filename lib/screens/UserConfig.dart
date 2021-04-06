import 'package:flutter/material.dart';

import 'MyWidgets.dart';

class UserConfig extends StatefulWidget {
  @override
  _UserConfigState createState() => _UserConfigState();
}

class _UserConfigState extends State<UserConfig> {
  String dropdownDay;
  String dropdownMonth;
  String dropdownYear;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      print("Salvar");
                    });
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
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2.0, color: const Color.fromRGBO(20, 20, 20, 1)),
                  borderRadius: BorderRadius.circular(150),
                  image: DecorationImage(
                      image: AssetImage("assets/Carlos.jpeg"),
                      fit: BoxFit.cover), //http rquest in future.
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 36),
                  child: TextButton(
                    onPressed: () {
                      print("Mudar");
                    },
                    child: Text(
                      "Mudar Avatar",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              MyWidgets().caixaTexto('Nome:', null),
              MyWidgets().caixaTexto('CPF:', null),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dayPick(),
                  monthPick(),
                  yearPick(),
                ],
              ),
              GenderPicker(),
              MyWidgets().button(
                  'Excluir Usuário', 150, 45, 17, Color.fromRGBO(255, 0, 0, 1),
                  () {
                setState(() {
                  print('Excluir');
                });
              }),
            ],
          ),
        ));
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
