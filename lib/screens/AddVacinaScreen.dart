import 'package:e_vacina/component/MyWidgets.dart';
import 'package:e_vacina/screens/MainScreen.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

class AddVacina extends StatefulWidget {
  @override
  _AddVacinaState createState() => _AddVacinaState();
}

class _AddVacinaState extends State<AddVacina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              color: Theme.of(context).primaryColor,
              child: Text(
                vaccineController.vaccineName,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 33, color: Colors.black),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              child: Text("Número de doses: ${vaccineController.numberOfDoses}",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.59,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(vaccineController.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.10,
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColor,
                child: MyWidgets().button('Adicionar vacina ao cartão', 240.0,
                    39.0, 15, Colors.red[600], () {
                  vaccineController
                      .postTakenVaccine()
                      .then((resposta) => validate(resposta));
                  print("cadastou");
                })),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              // child: Icon(Icons.arrow_downward,),
              child: IconButton(
                icon: const Icon(Icons.arrow_downward),
                onPressed: () {
                  Navigator.pop(context);
                },
                alignment: Alignment.centerRight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validate(bool resposta) {
    if (resposta == false) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => PopUpAlertDialog(
                "Vacina já foi inserida na carteira, impossivel inserir novamente",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ));
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => PopUpAlertDialog(
          "Vacina adicionada com sucesso.",
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
        ),
      );
    }
  }
}
