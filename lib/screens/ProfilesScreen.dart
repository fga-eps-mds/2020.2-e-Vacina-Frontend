import 'package:e_vacina/controllers/profileController.dart';
import 'package:e_vacina/screens/CreateProfileScreen.dart';
import 'package:flutter/material.dart';
import 'MainScreen.dart';
import 'MyWidgets.dart';
import '../globals.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _nome = "Ana Maria";
  /*void values() async {
    for (int i = 0; i < profiles.length; i++) {
      await profileController.getById(profiles[i]);
      setState(() {
        _name[i] = profileController.currentName;
      });
    }
  }*/

  final itens = List<String>.generate(20, (i) => "Perfil $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(right: 30),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                radius: 17.5,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  _nome.substring(0, 2).toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Text(
              _nome,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
              ),
            ),
          ]),
        ),
        leading: Builder(builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                print('voltar');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              },
              alignment: Alignment.centerRight,
            ),
          );
        }),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
              //alignment: Alignment.centerRight,
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.add, size: 30),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 40, 30, 40),
                      child: Text(
                        "Adicionar Perfil",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateProfile()));
                },
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: itens.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      print("Perfil $i selecionado");
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              CircleAvatar(
                                radius: 20.0,
                                backgroundImage:
                                    AssetImage("assets/EmptyProfile.png"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text("${itens[i]}"),
                              ),
                            ]),
                            IconButton(
                                icon: const Icon(Icons.settings_outlined),
                                onPressed: () {
                                  print("Configuração $i selecionada");
                                })
                          ],
                        ),
                      ),
                    ),
                  );
                  /*ListTile(
                    leading: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage("assets/EmptyProfile.png"),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${itens[i]}"),
                        IconButton(
                            icon: const Icon(Icons.settings_outlined),
                            onPressed: () {
                              print("Configuração $i selecionado");
                            })
                      ],
                    ),
                    onTap: () {
                      debugPrint("perfil $i selecionado");
                    },
                  );*/
                }),
          ],
        ),
      ),
      /*MyWidgets().BorderButton(
              'name', 72, 16, Colors.black, Icons.arrow_forward, () {},
              icon: Icon(
                Icons.vpn_key_outlined,
                color: Colors.black,
              )),
          MyWidgets().BorderButton(
              'Ajuda', 72, 16, Colors.black, Icons.arrow_forward, () {},
              icon: Icon(
                Icons.help_outline_outlined,
                color: Colors.black,
              )),*/
      //  ],
      // ),
    );
  }
}
