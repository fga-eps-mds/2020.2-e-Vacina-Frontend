import 'package:flutter/material.dart';

import 'MyWidgets.dart';

class CreateProfile extends StatefulWidget {
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final nameCon = new TextEditingController();
  final cpfCon = new TextEditingController();
  final dayCon = new TextEditingController();
  final monthCon = new TextEditingController();
  final yearCon = new TextEditingController();
  final sexCon = new TextEditingController();

  var _name;
  var _cpf;
  var _day;
  var _month;
  var _year;
  var _birthDate;
  var _sex;

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
                      _name = nameCon.text;
                      _cpf = cpfCon.text;
                      _day = dayCon.text;
                      _month = monthCon.text;
                      _year = yearCon.text;
                      _sex = sexCon.text;
                    });

                    print('Sexo:$_sex');
                    //_birthDate = '$_day/$_month/$_year';
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
                      "Selecionar Avatar",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              MyWidgets().caixaTexto('Nome:', nameCon),
              MyWidgets().caixaTexto('CPF:', cpfCon),
              DatePick(),
              GenderPicker(),
            ],
          ),
        ));
  }
}
