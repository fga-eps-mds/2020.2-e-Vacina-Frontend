import 'package:flutter/material.dart';

import 'MyWidgets.dart';

class UserConfig extends StatefulWidget {
  @override
  _UserConfigState createState() => _UserConfigState();
}

class _UserConfigState extends State<UserConfig> {
  final nameCon = new TextEditingController();
  final cpfCon = new TextEditingController();
  final dayCon = new TextEditingController();
  final monthCon = new TextEditingController();
  final yearCon = new TextEditingController();
  final sexCon = new TextEditingController();

  var _name;
  var _cpf;
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
                      _name = nameCon.text;
                      _cpf = cpfCon.text;
                      _birthDate =
                          '${monthCon.text}/${dayCon.text}/${yearCon.text}';
                      sexCon.text == '1'
                          ? (_sex = 'Masculino')
                          : (_sex = 'Feminino');
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
              DatePick(dayCon, monthCon, yearCon),
              GenderPicker(sexCon),
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
}
