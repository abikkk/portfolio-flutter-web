import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            "i'm abik vaidhya, from pokhara. i'm 24 years young ( cuz i dont wanna feel old T_T ). i'm a graduate from informatics college pokhara where i graduated on second class honors on bachelors in information technology.",
            style: TextStyle(fontSize: 20),
          ),
          Divider(
            height: 10,
            color: Colors.transparent,
          ),
          Text(
            "currently im studying part-time masters in business and administration in herald international college. i work as a remote flutter developer in nipunna sewa, nucleus in pokhara. i handle frontedn for the projects outsourced from dubai team to our company.",
            style: TextStyle(fontSize: 20),
          ),
          Divider(
            height: 10,
            color: Colors.transparent,
          ),
          Text(
            "i stream games in my leisure time, as regular as i can. i play valorant, apex legends, pubg pc, minecraft, gta v online and whichever games that epic games provides free as their giveaway ( cuz im broke and cant buy shit )",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
