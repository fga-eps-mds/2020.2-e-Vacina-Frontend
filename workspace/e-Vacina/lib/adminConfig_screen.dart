import 'package:flutter/material.dart';
import 'Caixa.dart';

class AdminConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
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
              onPressed: null,
              alignment: Alignment.centerRight,
            ),
          );
        }),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
              child: TextButton(
                  onPressed: () {
                    print("Salvar");
                  },
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 15,
                      color: Color.fromRGBO(42, 174, 198, 1),
                    ),
                  ),
            )
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MyWidgets().caixaTexto('Email'),
              MyWidgets().caixaTexto('Telefone'),
              MyWidgets().caixaTexto('Senha'),
              Padding(
                padding: EdgeInsets.only(right: 248),
                child: TextButton(
                  onPressed: () {
                    print("Excluir Conta");
                  },
                  child: Text(
                    "Excluir Conta",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 17,
                      color: Color.fromARGB(0xFF, 255, 66, 66),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
