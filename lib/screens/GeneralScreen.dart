import 'package:e_vacina/screens/HelpScreen.dart';
import 'package:flutter/material.dart';
import 'MyWidgets.dart';

class GeneralScreen extends StatefulWidget {
  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  String _nome = 'Ana Maria';

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
      ),
      body: Column(
        children: [
          textSwitch("Tema Escuro", 72, 16,
              icon: Icon(
                Icons.bedtime_outlined,
                color: Colors.black,
              )),
          textSwitch("Notificações", 72, 16,
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
              )),
          MyWidgets().BorderButton(
              'Permissões', 72, 16, Colors.black, Icons.arrow_forward, () {},
              icon: Icon(
                Icons.vpn_key_outlined,
                color: Colors.black,
              )),
          MyWidgets().BorderButton(
              'Ajuda', 72, 16, Colors.black, Icons.arrow_forward, () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HelpScreen()));
          },
              icon: Icon(
                Icons.help_outline_outlined,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
