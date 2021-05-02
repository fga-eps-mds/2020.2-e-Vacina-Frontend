import 'package:e_vacina/screens/MainScreen.dart';
import 'package:flutter/material.dart';

import '../globals.dart';
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
  var _birthDate;
  var _sex;

  String _wrongName;
  String _wrongCpf;
  String _wrongDay;
  String _wrongMonth;
  String _wrongYear;
  String _wrongSex;
  bool _error = false;

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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
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
                      if (isEmpty(
                              _name, _cpf, monthCon, dayCon, yearCon, sexCon) ==
                          false) {
                        _error = false;
                        profileController
                            .createProfile(userController.userId, _name, _cpf,
                                _sex, _birthDate)
                            .then((resposta) => validate(resposta));
                      } else
                        _error = true;
                    });

                    print('Sexo:$_sex');
                    print('Data: $_birthDate');
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
                  margin: EdgeInsets.only(bottom: 26),
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
              errorText(_error),
              MyWidgets().caixaTexto('Nome:', nameCon, errorText: _wrongName),
              MyWidgets().caixaTexto('CPF:', cpfCon, errorText: _wrongCpf),
              DatePick(dayCon, monthCon, yearCon,
                  errorTextDay: _wrongDay,
                  errorTextMonth: _wrongMonth,
                  errorTextYear: _wrongYear),
              GenderPicker(sexCon, errorText: _wrongSex),
            ],
          ),
        ));
  }

  void validate(bool resposta) {
    if (resposta == false) {
      setState(() {
        _wrongCpf = "CPF já cadastrado.";
      });
    } else {
      setState(() {
        _wrongCpf = null;
      });
      showDialog(
        context: context,
        builder: (_) => alertDialog("Perfil criado com sucesso."),
      );
    }
  }

  bool isEmpty(
      var name,
      var cpf,
      TextEditingController daycon,
      TextEditingController monthcon,
      TextEditingController yearcon,
      TextEditingController sexcon) {
    String text = "";
    bool empty = false;
    setState(() {
      name.isEmpty ? _wrongName = text : _wrongName = null;
      cpf.isEmpty ? _wrongCpf = text : _wrongCpf = null;
      daycon.text.isEmpty ? _wrongDay = text : _wrongDay = null;
      monthcon.text.isEmpty ? _wrongMonth = text : _wrongMonth = null;
      yearcon.text.isEmpty ? _wrongYear = text : _wrongYear = null;
      sexcon.text.isEmpty ? _wrongSex = text : _wrongSex = null;
    });
    if (name.isEmpty ||
        cpf.isEmpty ||
        dayCon.text.isEmpty ||
        monthCon.text.isEmpty ||
        yearCon.text.isEmpty ||
        sexcon.text.isEmpty) {
      empty = true;
    }
    return empty;
  }
}
