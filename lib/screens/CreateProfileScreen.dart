import 'package:e_vacina/screens/ProfilesScreen.dart';
import 'package:flutter/material.dart';
import 'package:e_vacina/component/MyWidgets.dart';
import '../globals.dart';

class CreateProfile extends StatefulWidget {
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final nameCon = new TextEditingController();
  final cpfCon = new TextEditingController();
  final birthDateCon = new TextEditingController();
  final sexCon = new TextEditingController();

  var _name;
  var _cpf;
  var _birthDate;
  var _sex;

  String _wrongName;
  String _wrongCpf;
  String _wrongBirthDate;
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
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
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
                      _birthDate = birthDateCon.text;
                      sexCon.text == '1'
                          ? _sex = 'Masculino'
                          : _sex = 'Feminino';
                      userController.checkToken().then(
                          (resposta) => MyWidgets().logout(context, resposta));
                      if (isEmpty() == false) {
                        _error = false;
                        profileController
                            .createProfile(userController.userId, _name, _cpf,
                                _sex, _birthDate)
                            .then((resposta) => validate(resposta));
                      } else
                        _error = true;
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
              ErrorText(_error),
              MyWidgets().caixaTexto('Nome:', nameCon, errorText: _wrongName),
              MyWidgets().caixaTexto('CPF:', cpfCon, errorText: _wrongCpf),
              DatePick(birthDateCon, errorText: _wrongBirthDate),
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
        barrierDismissible: false,
        context: context,
        builder: (_) => PopUpAlertDialog(
          "Perfil criado com sucesso.",
          onPressed: () async {
            await userController.getProfiles(userController.userId);
            await profileController.getById(userController
                .profiles[userController.profiles.length - 1]['_id']);
            Navigator.of(context).pop();
          },
        ),
      );
    }
  }

  bool isEmpty() {
    String text = "";
    bool empty = false;
    setState(() {
      _name.isEmpty ? _wrongName = text : _wrongName = null;
      _cpf.isEmpty ? _wrongCpf = text : _wrongCpf = null;
      birthDateCon.text.isEmpty
          ? _wrongBirthDate = text
          : _wrongBirthDate = null;
      sexCon.text.isEmpty ? _wrongSex = text : _wrongSex = null;
    });
    if (_name.isEmpty ||
        _cpf.isEmpty ||
        birthDateCon.text.isEmpty ||
        sexCon.text.isEmpty) {
      empty = true;
    }
    return empty;
  }
}
