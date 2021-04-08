import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _nome = 'Exemplo';
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      bottomNavigationBar: BottomBar(),
    );
  }

  Widget appBar() {
    return AppBar(
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
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }
}
