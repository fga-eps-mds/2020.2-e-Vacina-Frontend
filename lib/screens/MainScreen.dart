import 'package:flutter/material.dart';
import 'package:e_vacina/globals.dart';
import 'package:e_vacina/screens/UserConfig.dart';
import 'package:e_vacina/screens/adminConfig_screen.dart';
import 'package:e_vacina/component/MyWidgets.dart';
import 'GeneralScreen.dart';
import 'package:e_vacina/screens/ProfilesScreen.dart';
import 'package:e_vacina/component/CardVaccine.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

bool _isLoading = true;

class _MainScreenState extends State<MainScreen> {
  List array = profileController.currentName.split(' ');
  String _nome = profileController.currentName;
  int _selectedItem = 1;

  String splitName(List array) {
    String name;
    if (array.length > 1) {
      name = array[0].substring(0, 1).toUpperCase() +
          array[1].substring(0, 1).toUpperCase();
    } else {
      name = array[0].substring(0, 1).toUpperCase();
    }
    return name;
  }

  final tabs = [ConfigTab(), MainTab(), Center(child: Text('Adicionar aqui'))];

  @override
  Widget build(BuildContext context) {
    vaccineController.getTakenVaccine();
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
      title: GestureDetector(
        onTap: () {
          setState(() {
            _isLoading = true;
          });
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 17.5,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  splitName(array),
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
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Adicionar'),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
      _isLoading = true;
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
          MyWidgets().BorderButton(
              'Informações de Login', 86, 25, Colors.black, Icons.arrow_forward,
              () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdminConfig()));
          }),
          MyWidgets().BorderButton(
              'Geral', 86, 25, Colors.black, Icons.arrow_forward, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GeneralScreen()));
          }),
          MyWidgets().BorderButton(
              'Perfis', 86, 25, Colors.black, Icons.arrow_forward, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
          }),
          MyWidgets().BorderButton(
              'Termos de Uso', 86, 25, Colors.black, Icons.arrow_forward, () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => UserConfig()));
          }),
          MyWidgets().BorderButton(
              'Sair', 86, 25, Colors.black, Icons.arrow_forward, () {
            userController.logout();
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }
}

class MainTab extends StatelessWidget {
  //bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: vaccineController.getTakenVaccine(),
            builder: (context, projectSnap) {
              if (projectSnap.hasData) {
                _isLoading = false;
              }
              if (_isLoading == true) {
                return Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                );
              } else if (projectSnap.data.isEmpty || projectSnap.data == null) {
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
              } else {
                return ListView.builder(
                    itemCount: projectSnap.data.length,
                    padding: EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      Map list = projectSnap.data[index];
                      return buildVaccineCard(
                          list["vaccineId"]["name"],
                          list["numberOfDosesTaken"],
                          list["vaccineId"]["numberOfDoses"]);
                    });
              }
            }));
  }
}
