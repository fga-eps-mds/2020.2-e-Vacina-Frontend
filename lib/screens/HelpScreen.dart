import 'package:flutter/material.dart';
import 'package:e_vacina/component/MyWidgets.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  double size = 16;

  IconData _arrow1 = Icons.arrow_downward;
  IconData _arrow2 = Icons.arrow_downward;
  IconData _arrow3 = Icons.arrow_downward;
  IconData _arrow4 = Icons.arrow_downward;
  IconData _arrow5 = Icons.arrow_downward;
  IconData _arrow6 = Icons.arrow_downward;
  IconData _arrow7 = Icons.arrow_downward;
  IconData _arrow8 = Icons.arrow_downward;
  IconData _arrow9 = Icons.arrow_downward;

  bool _addProfile = false;
  bool _deleteProfile = false;
  bool _editProfile = false;
  bool _changeProfile = false;
  bool _editLogin = false;
  bool _deleteUser = false;
  bool _addVacine = false;
  bool _deleteVacine = false;
  bool _viewVacine = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'e-Vacina',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyWidgets().borderButton(
                'Adicionar Perfil', 72, 16, Colors.black, _arrow1, () {
              _addProfile == false
                  ? changes(addProfile: true, arrow1: Icons.arrow_upward)
                  : changes();
            }),
            if (_addProfile == true) addProflile(),
            MyWidgets().borderButton(
                'Remover Perfil', 72, 16, Colors.black, _arrow2, () {
              _deleteProfile == false
                  ? changes(deleteProfile: true, arrow2: Icons.arrow_upward)
                  : changes();
            }),
            if (_deleteProfile == true) deleteProfile(),
            MyWidgets().borderButton(
                'Editar Perfil', 72, 16, Colors.black, _arrow3, () {
              _editProfile == false
                  ? changes(editProfile: true, arrow3: Icons.arrow_upward)
                  : changes();
            }),
            if (_editProfile == true) editProfile(),
            MyWidgets().borderButton(
                'Mudar de Perfil', 72, 16, Colors.black, _arrow4, () {
              _changeProfile == false
                  ? changes(changeProfile: true, arrow4: Icons.arrow_upward)
                  : changes();
            }),
            if (_changeProfile == true) changeProfile(),
            MyWidgets().borderButton(
                'Editar informações de Login', 72, 16, Colors.black, _arrow5,
                () {
              _editLogin == false
                  ? changes(editLogin: true, arrow5: Icons.arrow_upward)
                  : changes();
            }),
            if (_editLogin == true) editLogin(),
            MyWidgets().borderButton(
                'Excluir conta', 72, 16, Colors.black, _arrow6, () {
              _deleteUser == false
                  ? changes(deleteUser: true, arrow6: Icons.arrow_upward)
                  : changes();
            }),
            if (_deleteUser == true) deleteUser(),
            MyWidgets().borderButton(
                'Adicionar Vacina', 72, 16, Colors.black, _arrow7, () {
              _addVacine == false
                  ? changes(addVacine: true, arrow7: Icons.arrow_upward)
                  : changes();
            }),
            if (_addVacine == true) addVacine(),
            MyWidgets().borderButton(
                'Remover Vacina', 72, 16, Colors.black, _arrow8, () {
              _deleteVacine == false
                  ? changes(deleteVacine: true, arrow8: Icons.arrow_upward)
                  : changes();
            }),
            if (_deleteVacine == true) deleteVacine(),
            MyWidgets()
                .borderButton('Ver Vacina', 72, 16, Colors.black, _arrow9, () {
              _viewVacine == false
                  ? changes(viewVacine: true, arrow9: Icons.arrow_upward)
                  : changes();
            }),
            if (_viewVacine == true) viewVacine(),
          ],
        ),
      ),
    );
  }

  changes(
      {bool addProfile = false,
      bool deleteProfile = false,
      bool editProfile = false,
      bool changeProfile = false,
      bool editLogin = false,
      bool deleteUser = false,
      bool addVacine = false,
      bool deleteVacine = false,
      bool viewVacine = false,
      IconData arrow1 = Icons.arrow_downward,
      IconData arrow2 = Icons.arrow_downward,
      IconData arrow3 = Icons.arrow_downward,
      IconData arrow4 = Icons.arrow_downward,
      IconData arrow5 = Icons.arrow_downward,
      IconData arrow6 = Icons.arrow_downward,
      IconData arrow7 = Icons.arrow_downward,
      IconData arrow8 = Icons.arrow_downward,
      IconData arrow9 = Icons.arrow_downward}) {
    setState(() {
      _addProfile = addProfile;
      _deleteProfile = deleteProfile;
      _editProfile = editProfile;
      _changeProfile = changeProfile;
      _editLogin = editLogin;
      _deleteUser = deleteUser;
      _addVacine = addVacine;
      _deleteVacine = deleteVacine;
      _viewVacine = viewVacine;
      _arrow1 = arrow1;
      _arrow2 = arrow2;
      _arrow3 = arrow3;
      _arrow4 = arrow4;
      _arrow5 = arrow5;
      _arrow6 = arrow6;
      _arrow7 = arrow7;
      _arrow8 = arrow8;
      _arrow9 = arrow9;
    });
  }

  Widget addProflile() {
    return Container(
      width: 10000,
      decoration: (BoxDecoration(
        border: Border.all(
            width: 1.0, color: const Color.fromRGBO(100, 100, 100, 1)),
      )),
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text:
                        '\n1. Na tela inicial, clique no ícone de configuração ',
                    style: TextStyle(fontSize: size),
                  ),
                  WidgetSpan(
                    child: Icon(Icons.settings, size: 20),
                  ),
                  TextSpan(
                    text: '.\n',
                    style: TextStyle(fontSize: size),
                  ),
                ]),
              ),
              Text(
                '2. Nesse menu, clique em "Contas".\n',
                style: TextStyle(fontSize: size),
              ),
              Text(
                '3. Clique em "Adicionar Conta".\n',
                style: TextStyle(fontSize: size),
              ),
              Text(
                '4. Agora insira as informações nos campos de nome, CPF, data de nascimento e sexo e insira uma imagem para o perfil se necessário.\n',
                style: TextStyle(fontSize: size),
              ),
              Text(
                '5. Clique em "salvar".\n',
                style: TextStyle(fontSize: size),
              ),
              Text(
                'Agora seu novo perfil aparecerá na tela de contas.\n',
                style: TextStyle(fontSize: size),
              ),
            ],
          )),
    );
  }

  Widget deleteProfile() {
    return Container(
      width: 10000,
      decoration: (BoxDecoration(
        border: Border.all(
            width: 1.0, color: const Color.fromRGBO(100, 100, 100, 1)),
      )),
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text:
                        '\n1. Na tela inicial, clique no ícone de configuração ',
                    style: TextStyle(fontSize: size),
                  ),
                  WidgetSpan(
                    child: Icon(Icons.settings, size: 20),
                  ),
                  TextSpan(
                    text: '.\n',
                    style: TextStyle(fontSize: size),
                  ),
                ]),
              ),
              Text(
                '2. Nesse menu, clique em "Contas".\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: '3. Clique sobre o ícone de configuração ',
                    style: TextStyle(fontSize: size),
                  ),
                  WidgetSpan(
                    child: Icon(Icons.settings, size: 20),
                  ),
                  TextSpan(
                    text: 'correspondente ao perfil que deseja excluir.\n',
                    style: TextStyle(fontSize: size),
                  ),
                ]),
              ),
              Text(
                '4. No canto inferior da tela, clique no botão "Excluir Perfil".\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Agora o perfil escolhido foi deletado.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
            ],
          )),
    );
  }

  Widget editProfile() {
    return Container(
      width: 10000,
      decoration: (BoxDecoration(
        border: Border.all(
            width: 1.0, color: const Color.fromRGBO(100, 100, 100, 1)),
      )),
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text:
                        '\n1. Na tela inicial, clique no ícone de configuração ',
                    style: TextStyle(fontSize: size),
                  ),
                  WidgetSpan(
                    child: Icon(Icons.settings, size: 20),
                  ),
                  TextSpan(
                    text: '.\n',
                    style: TextStyle(fontSize: size),
                  ),
                ]),
              ),
              Text(
                '2. Nesse menu, clique em "Contas".\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: '3. Clique sobre o ícone de configuração ',
                    style: TextStyle(fontSize: size),
                  ),
                  WidgetSpan(
                    child: Icon(Icons.settings, size: 20),
                  ),
                  TextSpan(
                    text: 'correspondente ao perfil que deseja excluir.\n',
                    style: TextStyle(fontSize: size),
                  ),
                ]),
              ),
              Text(
                '4. Altere as informações desejadas.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                '5. Clique em "salvar" no canto superior direito da tela.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Agora o perfil escolhido foi atualizado.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
            ],
          )),
    );
  }

  Widget changeProfile() {
    return Container(
      width: 10000,
      decoration: (BoxDecoration(
        border: Border.all(
            width: 1.0, color: const Color.fromRGBO(100, 100, 100, 1)),
      )),
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text:
                        '\n1. Na tela inicial, clique no ícone de configuração ',
                    style: TextStyle(fontSize: size),
                  ),
                  WidgetSpan(
                    child: Icon(Icons.settings, size: 20),
                  ),
                  TextSpan(
                    text: '.\n',
                    style: TextStyle(fontSize: size),
                  ),
                ]),
              ),
              Text(
                '2. Nesse menu, clique em "Contas".\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                '3. Basta clicar sobre o perfil que deseja selecionar.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Agora você está visualizando o perfil selecionado.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
            ],
          )),
    );
  }

  Widget editLogin() {
    return Container(
      width: 10000,
      decoration: (BoxDecoration(
        border: Border.all(
            width: 1.0, color: const Color.fromRGBO(100, 100, 100, 1)),
      )),
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text:
                        '\n1. Na tela inicial, clique no ícone de configuração ',
                    style: TextStyle(fontSize: size),
                  ),
                  WidgetSpan(
                    child: Icon(Icons.settings, size: 20),
                  ),
                  TextSpan(
                    text: '.\n',
                    style: TextStyle(fontSize: size),
                  ),
                ]),
              ),
              Text(
                '2. Nesse menu, clique em "Informações de Login".\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                '3. Altere as informações desejadas.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                '4. Clique em "salvar" no canto superior direito da tela.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Agora suas informações de login foram atualizadas.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
            ],
          )),
    );
  }

  Widget deleteUser() {
    return Container(
      width: 10000,
      decoration: (BoxDecoration(
        border: Border.all(
            width: 1.0, color: const Color.fromRGBO(100, 100, 100, 1)),
      )),
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text:
                        '\n1. Na tela inicial, clique no ícone de configuração ',
                    style: TextStyle(fontSize: size),
                  ),
                  WidgetSpan(
                    child: Icon(Icons.settings, size: 20),
                  ),
                  TextSpan(
                    text: '.\n',
                    style: TextStyle(fontSize: size),
                  ),
                ]),
              ),
              Text(
                '2. Nesse menu, clique em "Informações de Login".\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                '3. No canto inferior da tela, clique no botão "Excluir usuário". \n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Agora o usuário conectado foi deletado.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
            ],
          )),
    );
  }

  Widget addVacine() {
    return Container(
      width: 10000,
      decoration: (BoxDecoration(
        border: Border.all(
            width: 1.0, color: const Color.fromRGBO(100, 100, 100, 1)),
      )),
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: '\n1. Na tela inicial, clique no ícone de pesquisa ',
                    style: TextStyle(fontSize: size),
                  ),
                  WidgetSpan(
                    child: Icon(Icons.search, size: 20),
                  ),
                  TextSpan(
                    text: '.\n',
                    style: TextStyle(fontSize: size),
                  ),
                ]),
              ),
              Text(
                '2. Navegue sobre esse tela ou pesquise e escolha a vacina desejada.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                '3. Clique sobre a vacina que deseja adicionar ao seu cartão de vacinas.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                '4. Nessa tela, clique sobre o botão "Adicionar Vacina ao Cartão".\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Agora a vacina escolhida aparecerá no seu cartão de vacinas.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
            ],
          )),
    );
  }

  Widget deleteVacine() {
    return Container(
      width: 10000,
      decoration: (BoxDecoration(
        border: Border.all(
            width: 1.0, color: const Color.fromRGBO(100, 100, 100, 1)),
      )),
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\n1. Na tela inicial, clique sobre a vacina que deseja excluir.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                '2. Clique sobre o botão "Retirar Vacina do Cartão"\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Agora a vacina escolhida foi removida do seu cartão de vacinas.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
            ],
          )),
    );
  }

  Widget viewVacine() {
    return Container(
      width: 10000,
      decoration: (BoxDecoration(
        border: Border.all(
            width: 1.0, color: const Color.fromRGBO(100, 100, 100, 1)),
      )),
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\n Ver vacina adicionada ao cartão:\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                '1. Basta navegar sobre a tela inicial e escolher a vacina desejada.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Nessa tela você estará vendo as informações da vacina escolhida.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                '\n Ver vacina não adicionada ao cartão:\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: '1. Na tela inicial, clique no ícone de pesquisa ',
                    style: TextStyle(fontSize: size),
                  ),
                  WidgetSpan(
                    child: Icon(Icons.search, size: 20),
                  ),
                  TextSpan(
                    text: '.\n',
                    style: TextStyle(fontSize: size),
                  ),
                ]),
              ),
              Text(
                '2. Navegue sobre esse tela ou pesquise e escolha a vacina desejada.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                '3. Clique sobre a vacina que deseja visualizar as informações.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Nessa tela você estará vendo as informações da vacina escolhida.\n',
                style: TextStyle(fontSize: size),
                textAlign: TextAlign.justify,
              ),
            ],
          )),
    );
  }
}
