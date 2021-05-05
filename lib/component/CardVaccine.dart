import 'package:flutter/material.dart';


Widget buildVaccineCard(String title, int dosesTaken, int numberOfDoses) => Card(
        shadowColor: Colors.black,
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color:
            (dosesTaken==0)?Colors.yellow:
            (dosesTaken==numberOfDoses)?Colors.green:
            Colors.blue,
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Doses tomadas $dosesTaken/$numberOfDoses',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );