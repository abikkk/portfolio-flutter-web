import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CodingScreen extends StatefulWidget {
  const CodingScreen({Key? key}) : super(key: key);

  @override
  State<CodingScreen> createState() => _CodingScreenState();
}

class _CodingScreenState extends State<CodingScreen> {
  bool flutterDetails = false,
      vueDetails = false,
      dnetDetails = false,
      reactDetails = false;
  double flutterScale = 0,
      flutterPad = 5,
      cScale = 0,
      cPad = 5,
      reactScale = 0,
      reactPad = 5,
      vueScale = 0,
      vuePad = 5,
      dnetScale = 0,
      dnetPad = 5;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'my skills',
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  skillBox(0),
                  skillBox(1),
                  skillBox(2),
                  skillBox(3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  animateCard(int card) {}

  cardMouseEntry(int card) {
    switch (card) {
      case 0:
        setState(() {
          flutterDetails = true;
          flutterScale = MediaQuery.of(context).size.height * .28;
          flutterPad = 0;
        });
        break;
      case 1:
        setState(() {
          reactDetails = true;
          reactScale = MediaQuery.of(context).size.height * .28;
          reactPad = 0;
        });
        break;
      case 2:
        setState(() {
          vueDetails = true;
          vueScale = MediaQuery.of(context).size.height * .28;
          vuePad = 0;
        });
        break;
      case 3:
        setState(() {
          dnetDetails = true;
          dnetScale = MediaQuery.of(context).size.height * .28;
          dnetPad = 0;
        });
        break;
    }
  }

  cardMouseExit(int card) {
    switch (card) {
      case 0:
        setState(() {
          flutterDetails = false;
          flutterScale = MediaQuery.of(context).size.height * .2;
          flutterPad = 5;
        });
        break;
      case 1:
        setState(() {
          reactDetails = false;
          reactScale = MediaQuery.of(context).size.height * .2;
          reactPad = 5;
        });
        break;
      case 2:
        setState(() {
          vueDetails = false;
          vueScale = MediaQuery.of(context).size.height * .2;
          vuePad = 5;
        });
        break;
      case 3:
        setState(() {
          dnetDetails = false;
          dnetScale = MediaQuery.of(context).size.height * .2;
          dnetPad = 5;
        });
        break;
    }
  }

  Widget skillBox(int skill) {
    late String title, exp, personal, professional, image;
    late bool detail;
    late double pad, scale;

    switch (skill) {
      case 0:
        title = 'flutter';
        exp = "2 years.";
        personal = "6";
        professional = "15+";
        image = "flutter";
        detail = flutterDetails;
        pad = flutterPad;
        scale = flutterScale;
        break;
      case 1:
        title = 'react';
        exp = "1 year.";
        personal = "2";
        professional = "1";
        image = "vue";
        detail = reactDetails;
        pad = reactPad;
        scale = reactScale;
        break;
      case 2:
        title = "vue";
        exp = "1 year.";
        personal = "2";
        professional = "0";
        image = "react";
        detail = vueDetails;
        pad = vuePad;
        scale = vueScale;
        break;
      case 3:
        title = "asp.net";
        exp = "1 year.";
        personal = "3";
        professional = "0";
        image = "dotnet";
        detail = dnetDetails;
        pad = dnetPad;
        scale = dnetScale;
        break;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onLongPress: () {
              Get.defaultDialog(
                  title: title,
                  titleStyle: TextStyle(fontStyle: FontStyle.normal),
                  radius: 15,
                  content: Wrap(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Column(
                                children: [
                                  Text(
                                    " work projects: $professional ",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    " personal projects: $personal ",
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
            },
            child: Card(
              child: MouseRegion(
                onEnter: (a) => cardMouseEntry(skill),
                onExit: (a) => cardMouseExit(skill),
                child: Wrap(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                          children: [
                            AnimatedContainer(
                              padding: EdgeInsets.symmetric(vertical: pad),
                              height: scale != 0.0
                                  ? scale
                                  : MediaQuery.of(context).size.height * .2,
                              duration: Duration(milliseconds: 150),
                              child: Image.asset(
                                'images/${image}.png',
                              ),
                            ),
                            Stack(
                              children: [
                                AnimatedOpacity(
                                  opacity: detail ? 1 : 0,
                                  duration: Duration(milliseconds: 150),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              title,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              " experience : $exp ",
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
