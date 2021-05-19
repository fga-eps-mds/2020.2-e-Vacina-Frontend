import 'package:e_vacina/component/MyWidgets.dart';
import 'package:e_vacina/globals.dart';
import 'package:e_vacina/screens/MainScreen.dart';
import 'package:flutter/material.dart';

class TakenVaccines extends StatefulWidget {
  final String name;
  final dynamic numberOfDoses;
  final dynamic periodicity;
  final dynamic numberOfDosesTaken;
  final dynamic takenVaccineId;

  const TakenVaccines(this.name, this.numberOfDoses, this.periodicity,
      this.numberOfDosesTaken, this.takenVaccineId,
      {Key key})
      : super(key: key);

  @override
  _TakenVaccinesState createState() => _TakenVaccinesState();
}

class _TakenVaccinesState extends State<TakenVaccines> {
  String dropdownValue;
  final birthDateCon = new TextEditingController();
  String _wrongBirthDate;
  String dropdown;
  var dateTakenVaccines = new List();

  //  void initState() {
  //   super.initState();
  //   dropdown = "1";
  //   birthDateCon.text = vaccineController.takenVaccines[0];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              color: Theme.of(context).primaryColor,
              child: Text(
                widget.name.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 33,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              child: Text(
                  "Número de doses: ${widget.numberOfDosesTaken.length} / ${widget.numberOfDoses.toString()}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 55, 15, 35),
              child: Row(
                children: [
                  Text("Numero da dose:",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: dosePick(widget.numberOfDoses),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dose tomada em:",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  DatePick(
                    birthDateCon,
                    errorText: _wrongBirthDate,
                    backColor: Colors.white,
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Data prevista para próxima dose:",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabled: false,
                        border: OutlineInputBorder(),
                        labelText: 'Indisponivel',
                      ),
                    ),
                  ],
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              child: MyWidgets().button('Tomar dose', 177.0, 45.0, 20,
                  Color.fromRGBO(153, 238, 255, 1), () async {
                dateTakenVaccines = vaccineController.dateOfTakenVaccines;
                int intParse = int.parse(dropdown);
                print(intParse);
                print(birthDateCon.text);
                if (intParse > dateTakenVaccines.length) {
                  dateTakenVaccines.add(birthDateCon.text);
                } else {
                  dateTakenVaccines[intParse - 1] = birthDateCon.text;
                }
                await vaccineController.updateTakenVaccine(
                    widget.takenVaccineId, dateTakenVaccines);
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => PopUpAlertDialog(
                    "Dose tomada com sucesso.",
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    },
                  ),
                );
              }, textColor: Colors.black),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.116,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              child: MyWidgets().button(
                  'Retirar vacina do cartão', 250.0, 39.0, 16, Colors.red[600],
                  () async {
                await vaccineController
                    .deleteTakenVaccine(widget.takenVaccineId);
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => PopUpAlertDialog(
                    "Vacina retirada do cartão.",
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    },
                  ),
                );
              }),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              // child: Icon(Icons.arrow_downward,),
              child: IconButton(
                iconSize: 40,
                icon: const Icon(Icons.arrow_upward),
                onPressed: () {
                  Navigator.pop(context);
                },
                alignment: Alignment.centerRight,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget dosePick(int tamanho) {
    final itens = List<String>.generate(tamanho, (i) => "${i + 1}");
    return Container(
      alignment: Alignment.bottomCenter,
      // padding: EdgeInsets.only(right:15),
      width: MediaQuery.of(context).size.width * 0.475,
      height: 80,
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            fillColor: Colors.white,
            filled: true,
          ),
          hint: Text('Dose'),
          value: dropdown,
          isExpanded: true,
          onChanged: (String newValue) {
            setState(() {
              dropdown = newValue;
            });
          },
          items: itens.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value.toString(),
              child: Text(value.toString()),
            );
          }).toList()),
    );
  }

  bool isEmpty() {
    String text = "";
    bool empty = false;
    setState(() {
      birthDateCon.text.isEmpty
          ? _wrongBirthDate = text
          : _wrongBirthDate = null;
    });
    if (birthDateCon.text.isEmpty) {
      empty = true;
    }
    return empty;
  }
}
