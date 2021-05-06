import 'package:e_vacina/screens/HelpScreen.dart';
import 'package:flutter/material.dart';
import 'package:e_vacina/component/MyWidgets.dart';

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
        elevation: 5,
        shadowColor: Color.fromRGBO(0, 0, 0, 1),
        title: Text(
          'e-Vacina',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
          ),
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
