import 'package:e_vacina/screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:e_vacina/component/MyWidgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../globals.dart';

class UserConfig extends StatefulWidget {
  @override
  _UserConfigState createState() => _UserConfigState();
}

final _storage = new FlutterSecureStorage();

class _UserConfigState extends State<UserConfig> {
  final nameCon = new TextEditingController();
  final cpfCon = new TextEditingController();
  final birthDateCon = new TextEditingController();
  final sexCon = new TextEditingController();

  String _wrongName;
  String _wrongCpf;
  String _wrongBirthDate;
  bool _error = false;

  var _name;
  var _cpf;
  var _birthDate;
  var _sex;
  //var _id;
  var dropdownValue;

  void deleteProfile(bool resposta) {
    if (resposta) {
      setState(() {
        if (userController.profiles.length == 1) {
          validateDelete(false);
        } else {
          profileController
              .delete(profileController.currentId)
              .then((resposta) => validateDelete(resposta));
        }
      });
    } else
      MyWidgets().logout(context, resposta);
  }

  void updateProfile(bool resposta) {
    if (resposta) {
      if (isEmpty() == false) {
        _error = false;
        profileController
            .update(_name, _cpf, _sex, _birthDate)
            .then((resposta) => validate(resposta));
      } else {
        _error = true;
      }
    } else
      MyWidgets().logout(context, resposta);
  }

  @override
  void initState() {
    super.initState();
    //_id = profileController.currentId;
    nameCon.text = profileController.currentName;
    cpfCon.text = profileController.currentCpf;
    birthDateCon.text = profileController.currentBirthDate;
    profileController.currentSex == 'Masculino'
        ? sexCon.text = '1'
        : sexCon.text = '2';
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
                onPressed: () async {
                  await profileController.getById(profileController.currentId);
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
                      _birthDate = birthDateCon.text;
                      sexCon.text == '1'
                          ? _sex = 'Masculino'
                          : _sex = 'Feminino';
                      userController
                          .checkToken()
                          .then((resposta) => updateProfile(resposta));
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
              ErrorText(_error),
              MyWidgets().caixaTexto('Nome:', nameCon, errorText: _wrongName),
              MyWidgets().caixaTexto('CPF:', cpfCon,
                  maxLength: 11, errorText: _wrongCpf),
              DatePick(birthDateCon, errorText: _wrongBirthDate),
              GenderPicker(sexCon, dropdownValue: sexCon.text),
              MyWidgets().button(
                  'Excluir Usuário', 150, 45, 17, Color.fromRGBO(255, 0, 0, 1),
                  () {
                userController
                    .checkToken()
                    .then((resposta) => deleteProfile(resposta));
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
          builder: (_) => PopUpAlertDialog(
                "Perfil atualizado com sucesso.",
                onPressed: () async {
                  await profileController.getById(profileController.currentId);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
              ));
    }
  }

  void validateDelete(bool resposta) async {
    if (resposta == false) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => PopUpAlertDialog("Impossivel excluir todos os perfis",
            onPressed: () {
          Navigator.of(context).pop();
        }),
      );
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => PopUpAlertDialog(
          "Perfil deletado com sucesso.",
          onPressed: () async {
            await _storage.write(key: 'profileIndex', value: "0");
            await userController.getProfiles(userController.userId);
            await profileController.getById(userController.profiles[0]['_id']);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
        ),
      );
    }
  }
}
