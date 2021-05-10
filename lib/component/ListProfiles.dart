import 'package:e_vacina/screens/MainScreen.dart';
import 'package:e_vacina/screens/UserConfig.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

Widget buildListProfiles(BuildContext context, String name, String prifoleId) {
  return GestureDetector(
    onTap: () async {
      await profileController.getById(prifoleId);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    },
    child: Container(
      height: 70,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.black, width: 1.0),
              bottom: BorderSide(color: Colors.black, width: 1.0))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage("assets/EmptyProfile.png"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("$name"),
              ),
            ]),
            IconButton(
                icon: const Icon(Icons.settings_outlined),
                onPressed: () async {
                  await profileController.getById(prifoleId);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserConfig()));
                })
          ],
        ),
      ),
    ),
  );
}
