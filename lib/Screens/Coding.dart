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
      height: (MediaQuery.of(context).size.height / 1.11) - 10,
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
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onLongPress: () {
                          Get.defaultDialog(
                              title: "flutter",
                              titleStyle:
                                  TextStyle(fontStyle: FontStyle.normal),
                              radius: 15,
                              content: Wrap(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 5),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Text(" experience: 1+ years "),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                        child: Card(
                          child: MouseRegion(
                            onEnter: (a) {
                              setState(() {
                                flutterDetails = true;
                                flutterScale =
                                    MediaQuery.of(context).size.height * .28;
                                flutterPad = 0;
                              });
                            },
                            onExit: (a) {
                              setState(() {
                                flutterDetails = false;
                                flutterScale =
                                    MediaQuery.of(context).size.height * .2;
                                flutterPad = 5;
                              });
                            },
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
                                          padding: EdgeInsets.symmetric(
                                              vertical: flutterPad),
                                          height: flutterScale != 0.0
                                              ? flutterScale
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .2,
                                          duration: Duration(milliseconds: 150),
                                          child: Image.asset(
                                            'images/flutter.png',
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            AnimatedOpacity(
                                                opacity:
                                                    !flutterDetails ? 1 : 0,
                                                duration:
                                                    Duration(milliseconds: 150),
                                                child: Center(
                                                    child: Text('flutter'))),
                                            AnimatedOpacity(
                                              opacity: flutterDetails ? 1 : 0,
                                              duration:
                                                  Duration(milliseconds: 150),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: Text(
                                                          " personal projects: 6 ",
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: Text(
                                                          " work projects: 20+ ",
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ],
                                                    ),
                                                    // Row(
                                                    //   children: [
                                                    //     Expanded(
                                                    //         child: Text(
                                                    //       " experience: 1+ years ",
                                                    //       textAlign: TextAlign.center,
                                                    //     )),
                                                    //   ],
                                                    // ),
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
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onLongPress: () {
                          Get.defaultDialog(
                              title: "vue.js",
                              titleStyle:
                                  TextStyle(fontStyle: FontStyle.normal),
                              radius: 15,
                              content: Wrap(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 5),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child:
                                              Text(" experience: 6+ months "),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                        child: Card(
                          child: MouseRegion(
                            onEnter: (a) {
                              setState(() {
                                vueDetails = true;
                                vueScale =
                                    MediaQuery.of(context).size.height * .28;
                                vuePad = 0;
                              });
                            },
                            onExit: (a) {
                              setState(() {
                                vueDetails = false;
                                vueScale =
                                    MediaQuery.of(context).size.height * .2;
                                vuePad = 5;
                              });
                            },
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
                                          padding: EdgeInsets.symmetric(
                                              vertical: vuePad),
                                          height: vueScale != 0.0
                                              ? vueScale
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .2,
                                          duration: Duration(milliseconds: 150),
                                          child: Image.asset(
                                            'images/vue.png',
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            AnimatedOpacity(
                                                opacity: !vueDetails ? 1 : 0,
                                                duration:
                                                    Duration(milliseconds: 150),
                                                child: Center(
                                                    child: Text('vue.js'))),
                                            AnimatedOpacity(
                                              opacity: vueDetails ? 1 : 0,
                                              duration:
                                                  Duration(milliseconds: 150),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: Text(
                                                          " personal projects: 2 ",
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: Text(
                                                          " work projects: n/a ",
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ],
                                                    ),
                                                    // Row(
                                                    //   children: [
                                                    //     Expanded(
                                                    //         child: Text(
                                                    //       " experience: 6+ months ",
                                                    //       textAlign: TextAlign.center,
                                                    //     )),
                                                    //   ],
                                                    // ),
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
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onLongPress: () {
                          Get.defaultDialog(
                              title: "react.js",
                              titleStyle:
                                  TextStyle(fontStyle: FontStyle.normal),
                              radius: 15,
                              content: Wrap(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 5),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child:
                                              Text(" experience: 3+ months "),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                        child: Card(
                          child: MouseRegion(
                            onEnter: (a) {
                              setState(() {
                                reactDetails = true;
                                reactScale =
                                    MediaQuery.of(context).size.height * .28;
                                reactPad = 0;
                              });
                            },
                            onExit: (a) {
                              setState(() {
                                reactDetails = false;
                                reactScale =
                                    MediaQuery.of(context).size.height * .2;
                                reactPad = 0;
                              });
                            },
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
                                          padding: EdgeInsets.symmetric(
                                              vertical: reactPad),
                                          height: reactScale != 0.0
                                              ? reactScale
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .2,
                                          duration: Duration(milliseconds: 150),
                                          child: Image.asset(
                                            'images/react.png',
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            AnimatedOpacity(
                                                opacity: !reactDetails ? 1 : 0,
                                                duration:
                                                    Duration(milliseconds: 150),
                                                child: Center(
                                                    child: Text('react.js'))),
                                            AnimatedOpacity(
                                              opacity: reactDetails ? 1 : 0,
                                              duration:
                                                  Duration(milliseconds: 150),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: Text(
                                                          " personal projects: 2 ",
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: Text(
                                                          " work projects: n/a ",
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ],
                                                    ),
                                                    // Row(
                                                    //   children: [
                                                    //     Expanded(
                                                    //         child: Text(
                                                    //       " experience: 3+ months ",
                                                    //       textAlign: TextAlign.center,
                                                    //     )),
                                                    //   ],
                                                    // ),
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
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onLongPress: () {
                          Get.defaultDialog(
                              title: ".net, c#",
                              titleStyle:
                                  TextStyle(fontStyle: FontStyle.normal),
                              radius: 15,
                              content: Wrap(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 5),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child:
                                              Text(" experience: 6+ months "),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                        child: Card(
                          child: MouseRegion(
                            onEnter: (a) {
                              setState(() {
                                dnetDetails = true;
                                dnetScale =
                                    MediaQuery.of(context).size.height * .28;
                                dnetPad = 0;
                              });
                            },
                            onExit: (a) {
                              setState(() {
                                dnetDetails = false;
                                dnetScale =
                                    MediaQuery.of(context).size.height * .2;
                                dnetPad = 0;
                              });
                            },
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
                                          padding: EdgeInsets.symmetric(
                                              vertical: dnetPad),
                                          height: dnetScale != 0.0
                                              ? dnetScale
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .2,
                                          duration: Duration(milliseconds: 150),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Image.asset(
                                                  'images/dotnet.png',
                                                  // scale: 5,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            AnimatedOpacity(
                                                opacity: !dnetDetails ? 1 : 0,
                                                duration:
                                                    Duration(milliseconds: 150),
                                                child: Center(
                                                    child: Text('.net / c#'))),
                                            AnimatedOpacity(
                                              opacity: dnetDetails ? 1 : 0,
                                              duration:
                                                  Duration(milliseconds: 150),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: Text(
                                                          " personal projects: 5 ",
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: Text(
                                                          " work projects: n/a ",
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ],
                                                    ),
                                                    // Row(
                                                    //   children: [
                                                    //     Expanded(
                                                    //         child: Text(
                                                    //       " experience: 5+ months ",
                                                    //       textAlign: TextAlign.center,
                                                    //     )),
                                                    //   ],
                                                    // ),
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
