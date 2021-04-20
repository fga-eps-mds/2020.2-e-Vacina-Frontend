import 'package:e_vacina/screens/UserConfig.dart';
import 'package:e_vacina/screens/adminConfig_screen.dart';
import 'package:flutter/material.dart';
import 'MyWidgets.dart';
import 'GeneralScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _nome = 'Exemplo';
  int _selectedItem = 1;

  final tabs = [ConfigTab(), MainTab(), Center(child: Text('Adicionar aqui'))];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: tabs[_selectedItem],
      bottomNavigationBar: BottomBar(),
    );
  }

  Widget appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
        ],
      ),
    );
  }

  Widget BottomBar() {
    return BottomNavigationBar(
      selectedFontSize: 14,
      unselectedFontSize: 14,
      backgroundColor: Colors.white,
      iconSize: 45,
      onTap: _onItemTapped,
      currentIndex: _selectedItem,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: 'Configurações'),
        BottomNavigationBarItem(
            icon: Icon(Icons.folder_shared_outlined), label: 'Carteiras'),
        BottomNavigationBarItem(
            icon: Icon(Icons.create_new_folder_outlined), label: 'Adicionar'),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }
}

class ConfigTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 100,
            child: Center(
              child: Text(
                'Configurações',
                style: TextStyle(
                  color: MyWidgets().gangGray,
                  fontSize: 24,
                  fontFamily: 'SuezOne',
                ),
              ),
            ),
          ),
          MyWidgets().BorderButton('Informações de Login', 86, 25, Colors.black,
              () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AdminConfig()));
          }),
          MyWidgets().BorderButton('Geral', 86, 25, Colors.black, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GeneralScreen()));
          }),
          MyWidgets().BorderButton('Perfis', 86, 25, Colors.black, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserConfig()));
          }),
          MyWidgets()
              .BorderButton('Termos de Uso', 86, 25, Colors.black, () {}),
          MyWidgets().BorderButton('Sair', 86, 25, Colors.black, () {
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }
}

class MainTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 90,
        width: 90,
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.white,
          onPressed: () {
            print('Botão');
          },
          child: new Icon(Icons.add,
              color: Theme.of(context).primaryColor, size: 80),
        ),
      ),
    );
  }
}
