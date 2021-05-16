import 'package:flutter/material.dart';

class TakenVaccines extends StatefulWidget {
  final String name;
  final dynamic numberOfDoses;
  final dynamic periodicity;
  final dynamic numberOfDosesTaken;

  const TakenVaccines(this.name, this.numberOfDoses, this.periodicity, this.numberOfDosesTaken, {Key key}) : super(key: key);

  @override
  _TakenVaccinesState createState() => _TakenVaccinesState();
}

class _TakenVaccinesState extends State<TakenVaccines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         child: Column(
           children: [
             Text(widget.name),
             Text(widget.numberOfDoses.toString()),
             Text(widget.periodicity.toString()),
             Text(widget.numberOfDosesTaken.toString()),
           ]
         )
         
         
       )

      
    );
  }
}