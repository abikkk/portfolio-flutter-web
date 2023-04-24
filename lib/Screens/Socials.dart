import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialsContainer extends StatefulWidget {
  const SocialsContainer({Key? key}) : super(key: key);

  @override
  _SocialsContainerState createState() => _SocialsContainerState();
}

class _SocialsContainerState extends State<SocialsContainer> {
  bool fbClicked = false,
      igClicked = false,
      twitterClicked = false,
      linkdClicked = false;
  double fbScale = 0,
      igScale = 0,
      twitterScale = 0,
      linkdScale = 0,
      fbPad = 50,
      igPad = 50,
      twitterPad = 50,
      linkdPad = 50;
  Color fbBorder = Colors.transparent,
      ig = Colors.transparent,
      linkdBorder = Colors.transparent,
      twitterBorder = Colors.transparent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'connect with me',
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MouseRegion(
                    onEnter: (a) {
                      setState(() {
                        fbScale = MediaQuery.of(context).size.height * .14;
                      });
                    },
                    onExit: (a) {
                      setState(() {
                        fbScale = MediaQuery.of(context).size.height * .12;
                      });
                    },
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          fbClicked = !fbClicked;
                        });

                        // delay
                        Future.delayed(const Duration(milliseconds: 150), () {
                          setState(() {
                            fbClicked = !fbClicked;
                          });
                          openLink('fb');
                        });
                      },
                      child: Wrap(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.fastOutSlowIn,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: !fbClicked
                                    ? [
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
                                      ]
                                    : null),
                            child: Padding(
                              padding: EdgeInsets.all(fbPad),
                              child: AnimatedContainer(
                                curve: Curves.easeIn,
                                height: fbScale != 0.0
                                    ? fbScale
                                    : MediaQuery.of(context).size.height * .12,
                                duration: Duration(milliseconds: 150),
                                child: Image.asset(
                                  'assets/images/fb.png',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MouseRegion(
                    onEnter: (a) {
                      setState(() {
                        igScale = MediaQuery.of(context).size.height * .14;
                        // igPad = 45;
                      });
                    },
                    onExit: (a) {
                      setState(() {
                        igScale = MediaQuery.of(context).size.height * .12;
                        // igPad = 50;
                      });
                    },
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          igClicked = !igClicked;
                        });
                        Future.delayed(const Duration(milliseconds: 150), () {
                          setState(() {
                            igClicked = !igClicked;
                          });
                          openLink('ig');
                        });
                      },
                      child: Wrap(
                        children: [
                          AnimatedContainer(
                            // height: 100,
                            // width: 100,
                            duration: Duration(milliseconds: 100),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: !igClicked
                                    ? [
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
                                      ]
                                    : null),
                            child: Padding(
                              padding: EdgeInsets.all(igPad),
                              child: AnimatedContainer(
                                curve: Curves.easeIn,
                                height: igScale != 0.0
                                    ? igScale
                                    : MediaQuery.of(context).size.height * .12,
                                duration: Duration(milliseconds: 150),
                                child: Image.asset(
                                  'assets/images/ig.png',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MouseRegion(
                    onEnter: (a) {
                      setState(() {
                        twitterScale = MediaQuery.of(context).size.height * .14;
                        // twitterPad = 45;
                      });
                    },
                    onExit: (a) {
                      setState(() {
                        twitterScale = MediaQuery.of(context).size.height * .12;
                        // twitterPad = 50;
                      });
                    },
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          twitterClicked = !twitterClicked;
                        });
                        Future.delayed(const Duration(milliseconds: 150), () {
                          setState(() {
                            twitterClicked = !twitterClicked;
                          });
                          openLink('twitter');
                        });
                      },
                      child: AnimatedContainer(
                        // height: 100,
                        // width: 100,
                        duration: Duration(milliseconds: 100),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: !twitterClicked
                                ? [
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
                                  ]
                                : null),
                        child: Padding(
                          padding: EdgeInsets.all(twitterPad),
                          child: AnimatedContainer(
                            curve: Curves.easeIn,
                            height: twitterScale != 0.0
                                ? twitterScale
                                : MediaQuery.of(context).size.height * .12,
                            duration: Duration(milliseconds: 150),
                            child: Image.asset(
                              'assets/images/twitter.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MouseRegion(
                    onEnter: (a) {
                      setState(() {
                        linkdScale = MediaQuery.of(context).size.height * .14;
                        // linkdPad = 45;
                      });
                    },
                    onExit: (a) {
                      setState(() {
                        linkdScale = MediaQuery.of(context).size.height * .12;
                        // linkdPad = 50;
                      });
                    },
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          linkdClicked = !linkdClicked;
                        });
                        Future.delayed(const Duration(milliseconds: 150), () {
                          setState(() {
                            linkdClicked = !linkdClicked;
                          });
                          openLink('linkd');
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: !linkdClicked
                                ? [
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
                                  ]
                                : null),
                        child: Padding(
                          padding: EdgeInsets.all(linkdPad),
                          child: AnimatedContainer(
                            curve: Curves.easeIn,
                            height: linkdScale != 0.0
                                ? linkdScale
                                : MediaQuery.of(context).size.height * .12,
                            duration: Duration(milliseconds: 150),
                            child: Image.asset(
                              'assets/images/linkd.png',
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
