import 'package:flutter/material.dart';


Widget buildVaccineCard(String title, String subtitle, {int numberOfDosesTaken, int numberOfDoses}) => Card(
        shadowColor: Colors.black,
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: numberOfDosesTaken != null? ((numberOfDosesTaken==0)?Color.fromRGBO(232, 202, 2, 1.0):
            (numberOfDosesTaken==numberOfDoses)?Color.fromRGBO(50, 198, 42, 1.0):
            Color.fromRGBO(42, 174, 198, 1.0)):Color.fromRGBO(42, 174, 198, 1.0),
            
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
                '$subtitle',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );