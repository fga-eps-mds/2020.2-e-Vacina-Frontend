import 'package:e_vacina/globals.dart';
import 'package:e_vacina/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:e_vacina/component/MyWidgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AdminConfig extends StatefulWidget {
  @override
  AdminConfigState createState() => AdminConfigState();
}

final _storage = new FlutterSecureStorage();

class AdminConfigState extends State<AdminConfig> {
  final passwordCon = new TextEditingController();
  final emailCon = new TextEditingController();
  final phoneCon = new TextEditingController();
  final passCon = new TextEditingController();
  final newEmailCon = new TextEditingController();
  final newPhoneCon = new TextEditingController();
  final newPasswordCon = new TextEditingController();

  var _phone;
  var _email;
  var _password;

  String _wrongPassword;

  void deleteUser(bool resposta) {
    if (resposta) {
      userController.delete();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginMenu()));
    } else
      MyWidgets().logout(context, resposta);
  }

  void initPassword() async {
    passwordCon.text = await _storage.read(key: 'password');
  }

  @override
  void initState() {
    super.initState();
    emailCon.text = userController.email;
    phoneCon.text = userController.phoneNumber;
    initPassword();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        elevation: 5,
        shadowColor: Color.fromRGBO(0, 0, 0, 1),
        centerTitle: true,
        title: Container(
          child: Text(
            'Informações\nde usuario',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
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
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: [
                  MyWidgets().caixaTexto('Email', emailCon, enabled: false),
                  Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              passCon.text = "";
                            });
                            requestPassword(
                                _wrongPassword,
                                update("Insira o novo email:", emailCon,
                                    newEmailCon, null, "Email já cadastrado.",
                                    email: true));
                          },
                          child: Text("Alterar")))
                ],
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  MyWidgets().caixaTexto('Telefone', phoneCon, enabled: false),
                  Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              passCon.text = "";
                            });
                            requestPassword(
                                _wrongPassword,
                                update(
                                    "Insira o novo telefone:",
                                    phoneCon,
                                    newPhoneCon,
                                    null,
                                    "Telefone já cadastrado.",
                                    phoneNunber: true));
                          },
                          child: Text("Alterar")))
                ],
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  MyWidgets().caixaTexto('Senha', passwordCon,
                      isObscure: true, enabled: false),
                  Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              passCon.text = "";
                            });
                            requestPassword(
                                _wrongPassword,
                                update("Insira a nova senha:", passwordCon,
                                    newPasswordCon, null, null,
                                    password: true));
                          },
                          child: Text("Alterar")))
                ],
              ),
              MyWidgets().button(
                'Excluir usuário',
                150,
                45,
                17,
                Color.fromRGBO(255, 0, 0, 1),
                () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) => AlertDialog(
                            title: Text(
                                "Você realmente deseja excluir este usuário?"),
                            content: Text(
                              "Ao confirmar essa escolha, todos os seus perfis e suas respectivas carteiras de vacina serão excluídos. Tem certeza que deseja fazer isso?",
                              textAlign: TextAlign.justify,
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Não")),
                              TextButton(
                                  onPressed: () {
                                    userController.checkToken().then(
                                        (resposta) => deleteUser(resposta));
                                  },
                                  child: Text("Sim"))
                            ],
                          ));
                },
              ),
              Padding(
                padding: EdgeInsets.only(right: 248),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget update(
    String title,
    TextEditingController controller,
    TextEditingController newController,
    String errorText,
    String fromError, {
    bool email = false,
    bool phoneNunber = false,
    bool password = false,
  }) {
    return AlertDialog(
      title: Text(title),
      content: TextField(
        obscureText: password,
        controller: newController,
        decoration: InputDecoration(
          errorText: errorText,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancelar")),
        TextButton(
          onPressed: () async {
            print("email: $email, teltfone: $phoneNunber, senha: $password");
            if (email) {
              print("emailCon.text: ${newController.text}");
              print("passwordCon.text: ${passwordCon.text}");
              setState(() {
                _email = newController.text;
              });
              if (await userController.update(_email, phoneCon.text, null)) {
                await _storage.write(key: 'email', value: _email);
                setState(() {
                  controller.text = _email;
                });
                Navigator.of(context).pop();
              } else {
                print("Email ta errado");
                setState(() {
                  errorText = fromError;
                });
                Navigator.of(context).pop();
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (_) => update(
                        title, controller, newController, errorText, fromError,
                        email: email,
                        phoneNunber: phoneNunber,
                        password: password));
              }
            } else if (phoneNunber) {
              print("Email: $email, Telefone: $phoneNunber, Senha: $password");
              setState(() {
                _phone = newController.text;
              });
              if (await userController.update(emailCon.text, _phone, null)) {
                setState(() {
                  controller.text = _phone;
                });
                Navigator.of(context).pop();
              } else {
                setState(() {
                  errorText = fromError;
                });
                Navigator.of(context).pop();
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (_) => update(
                        title, controller, newController, errorText, fromError,
                        email: email,
                        phoneNunber: phoneNunber,
                        password: password));
              }
            } else if (password) {
              setState(() {
                _password = newController.text;
              });
              if (await userController.update(
                  emailCon.text, phoneCon.text, _password)) {
                await _storage.write(key: 'password', value: _password);
                setState(() {
                  controller.text = _password;
                });
                Navigator.of(context).pop();
              }
            }
          },
          child: Text("Ok"),
        )
      ],
    );
  }

  void requestPassword(String wrongPassword, Widget newPopUp) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Insira sua senha:"),
        content: TextField(
          obscureText: true,
          controller: passCon,
          decoration: InputDecoration(
            errorText: wrongPassword,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Cancelar",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              setState(() {
                _password = passCon.text;
              });
              if (await userController.login(userController.email, _password)) {
                Navigator.of(context).pop();
                setState(() {
                  newEmailCon.text = "";
                  newPhoneCon.text = "";
                  newPasswordCon.text = "";
                });
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (_) => newPopUp);
              } else {
                Navigator.of(context).pop();
                requestPassword("Senha incorreta", newPopUp);
              }
            },
            child: Text(
              "Ok",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
