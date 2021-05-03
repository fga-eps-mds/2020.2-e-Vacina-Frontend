import 'package:flutter/material.dart';

import '../globals.dart';
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

  String _wrongName;
  String _wrongCpf;
  bool _error = false;

  var _name;
  var _cpf;
  var _birthDate;
  var _sex;
  var _id;
  var dropdownValue;

  @override
  void initState() {
    super.initState();
    _id = profileController.currentId;
    nameCon.text = profileController.currentName;
    cpfCon.text = profileController.currentCpf;
    dayCon.text = profileController.currentBirthDate.substring(8, 10);
    monthCon.text = profileController.currentBirthDate.substring(5, 7);
    yearCon.text = profileController.currentBirthDate.substring(0, 4);
    //1926-04-09T00:00:00.000Z
    profileController.currentSex == 'Masculino'
        ? sexCon.text = '1'
        : sexCon.text = '2';
    print(dayCon.text);
    print(monthCon.text);
  }

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
                      if (isEmpty() == false) {
                        _error = false;
                        profileController.update(_name, _cpf, _sex, _birthDate);
                      } else {
                        _error = true;
                      }
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
                      image: AssetImage("assets/EmptyProfile.png"),
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
              MyWidgets().caixaTexto('Nome:', nameCon, errorText: _wrongName),
              MyWidgets().caixaTexto('CPF:', cpfCon, errorText: _wrongCpf),
              DatePick(dayCon, monthCon, yearCon,
                  dropdownDay: dayCon.text,
                  dropdownMonth: monthCon.text,
                  dropdownYear: yearCon.text),
              GenderPicker(sexCon, dropdownValue: sexCon.text),
              MyWidgets().button(
                  'Excluir Usuário', 150, 45, 17, Color.fromRGBO(255, 0, 0, 1),
                  () {
                setState(() {
                  profileController.delete(profileController.currentId);
                });
              }),
            ],
          ),
        ));
  }

  bool isEmpty() {
    String text = "";
    bool empty = false;
    setState(() {
      _name.isEmpty ? _wrongName = text : _wrongName = null;
      _cpf.isEmpty ? _wrongCpf = text : _wrongCpf = null;
    });
    if (_name.isEmpty || _cpf.isEmpty) {
      empty = true;
    }
    return empty;
  }
}
