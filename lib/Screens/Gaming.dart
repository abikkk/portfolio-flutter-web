import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';

class GamingScreen extends StatefulWidget {
  const GamingScreen({Key? key}) : super(key: key);

  @override
  State<GamingScreen> createState() => _GamingScreenState();
}

class _GamingScreenState extends State<GamingScreen> {
  bool twitchClicked = false,
      discordClicked = false,
      ytClicked = false,
      valorantClicked = false,
      apexClicked = false,
      pubgClicked = false,
      gtavClicked = false,
      twitchDetails = false,
      discordDetails = false,
      ytDetails = false,
      valorantDetails = false,
      apexDetails = false,
      pubgDetails = false,
      gtavDetails = false;

  double discordScale = 0,
      twitchScale = 0,
      ytScale = 0,
      valorantScale = 0,
      apexScale = 0,
      pubgScale = 0,
      gtavScale = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(20.0),
      // height: (MediaQuery.of(context).size.height),
      child: Column(children: [
        // games
        Row(
          children: [
            Expanded(
              child: gameCard(0),
            ),
            Expanded(
              child: gameCard(1),
            ),
            Expanded(
              child: gameCard(2),
            ),
          ],
        ),

        // twitch discord youtube
        Row(
          children: [
            Expanded(child: streamCard(0)),
            Expanded(child: streamCard(1)),
            Expanded(child: streamCard(2))

            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(15.0),
            //     child: InkWell(
            //       onTap: () async {
            //         setState(() {
            //           twitchClicked = !twitchClicked;
            //         });
            //         Future.delayed(const Duration(milliseconds: 150), () {
            //           setState(() {
            //             twitchClicked = !twitchClicked;
            //           });
            //           openLink('twitch');
            //         });
            //       },
            //       child: Card(
            //         child: MouseRegion(
            //           onEnter: (a) {
            //             setState(() {
            //               twitchScale =
            //                   MediaQuery.of(context).size.height * .24;
            //             });
            //           },
            //           onExit: (a) {
            //             setState(() {
            //               twitchScale =
            //                   MediaQuery.of(context).size.height * .2;
            //             });
            //           },
            //           child: Wrap(
            //             children: [
            //               AnimatedContainer(
            //                 duration: Duration(milliseconds: 100),
            //                 decoration: BoxDecoration(
            //                     color: Colors.white,
            //                     borderRadius: BorderRadius.circular(15),
            //                     boxShadow: !twitchClicked
            //                         ? [
            //                             BoxShadow(
            //                                 color: Colors.grey[500]!,
            //                                 offset: Offset(4, 4),
            //                                 blurRadius: 15,
            //                                 spreadRadius: 1),
            //                             BoxShadow(
            //                                 color: Colors.white,
            //                                 offset: Offset(-4, -4),
            //                                 blurRadius: 15,
            //                                 spreadRadius: 1)
            //                           ]
            //                         : null),
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(50.0),
            //                   child: Column(
            //                     children: [
            //                       AnimatedContainer(
            //                         curve: Curves.easeIn,
            //                         height: twitchScale != 0.0
            //                             ? twitchScale
            //                             : MediaQuery.of(context).size.height *
            //                                 .2,
            //                         duration: Duration(milliseconds: 150),
            //                         child: Image.asset(
            //                           'images/twitch.png',
            //                         ),
            //                       ),
            //                       Text('i stream games on my leisure time.')
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(15.0),
            //     child: MouseRegion(
            //       onEnter: (a) {
            //         setState(() {
            //           discordScale = MediaQuery.of(context).size.height * .24;
            //         });
            //       },
            //       onExit: (a) {
            //         setState(() {
            //           discordScale = MediaQuery.of(context).size.height * .2;
            //         });
            //       },
            //       child: InkWell(
            //         onTap: () async {
            //           setState(() {
            //             discordClicked = !discordClicked;
            //           });
            //           Future.delayed(const Duration(milliseconds: 150), () {
            //             setState(() {
            //               discordClicked = !discordClicked;
            //             });
            //             openLink('discord');
            //           });
            //         },
            //         child: Wrap(
            //           children: [
            //             AnimatedContainer(
            //               duration: Duration(milliseconds: 100),
            //               decoration: BoxDecoration(
            //                   color: Colors.white,
            //                   borderRadius: BorderRadius.circular(15),
            //                   boxShadow: !twitchClicked
            //                       ? [
            //                           BoxShadow(
            //                               color: Colors.grey[500]!,
            //                               offset: Offset(4, 4),
            //                               blurRadius: 15,
            //                               spreadRadius: 1),
            //                           BoxShadow(
            //                               color: Colors.white,
            //                               offset: Offset(-4, -4),
            //                               blurRadius: 15,
            //                               spreadRadius: 1)
            //                         ]
            //                       : null),
            //               child: Padding(
            //                 padding: const EdgeInsets.all(50.0),
            //                 child: Column(
            //                   children: [
            //                     AnimatedContainer(
            //                       curve: Curves.easeIn,
            //                       height: discordScale != 0.0
            //                           ? discordScale
            //                           : MediaQuery.of(context).size.height *
            //                               .2,
            //                       duration: Duration(milliseconds: 150),
            //                       child: Image.asset(
            //                         'images/discord.png',
            //                       ),
            //                     ),
            //                     Text(' OogieBoogie#1416 ')
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(15.0),
            //     child: MouseRegion(
            //       onEnter: (a) {
            //         setState(() {
            //           ytScale = MediaQuery.of(context).size.height * .24;
            //         });
            //       },
            //       onExit: (a) {
            //         setState(() {
            //           ytScale = MediaQuery.of(context).size.height * .2;
            //         });
            //       },
            //       child: InkWell(
            //         onTap: () async {
            //           setState(() {
            //             ytClicked = !ytClicked;
            //           });
            //           Future.delayed(const Duration(milliseconds: 150), () {
            //             setState(() {
            //               ytClicked = !ytClicked;
            //             });
            //             openLink('yt');
            //           });
            //         },
            //         child: Wrap(
            //           children: [
            //             AnimatedContainer(
            //               duration: Duration(milliseconds: 100),
            //               decoration: BoxDecoration(
            //                   color: Colors.white,
            //                   borderRadius: BorderRadius.circular(15),
            //                   boxShadow: !ytClicked
            //                       ? [
            //                           BoxShadow(
            //                               color: Colors.grey[500]!,
            //                               offset: Offset(4, 4),
            //                               blurRadius: 15,
            //                               spreadRadius: 1),
            //                           BoxShadow(
            //                               color: Colors.white,
            //                               offset: Offset(-4, -4),
            //                               blurRadius: 15,
            //                               spreadRadius: 1)
            //                         ]
            //                       : null),
            //               child: Padding(
            //                 padding: const EdgeInsets.all(50.0),
            //                 child: Column(
            //                   children: [
            //                     AnimatedContainer(
            //                       curve: Curves.easeIn,
            //                       height: ytScale != 0.0
            //                           ? ytScale
            //                           : MediaQuery.of(context).size.height *
            //                               .2,
            //                       duration: Duration(milliseconds: 150),
            //                       child: Image.asset(
            //                         'assets/images/yt.png',
            //                       ),
            //                     ),
            //                     Text('i put clips from my twitch live stream')
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ]),
    );
  }

  gameCardMouseEntry(int card) {
    switch (card) {
      case 0:
        setState(() {
          valorantDetails = true;
          valorantScale = MediaQuery.of(context).size.height * .24;
        });
        break;
      case 1:
        setState(() {
          apexDetails = true;
          apexScale = MediaQuery.of(context).size.height * .24;
        });
        break;
      case 2:
        setState(() {
          gtavDetails = true;
          gtavScale = MediaQuery.of(context).size.height * .24;
        });
        break;
    }
  }

  gameCardMouseExit(int card) {
    switch (card) {
      case 0:
        setState(() {
          valorantDetails = false;
          valorantScale = MediaQuery.of(context).size.height * .2;
        });
        break;
      case 1:
        setState(() {
          apexDetails = false;
          apexScale = MediaQuery.of(context).size.height * .2;
        });
        break;
      case 2:
        setState(() {
          gtavDetails = false;
          gtavScale = MediaQuery.of(context).size.height * .2;
        });
        break;
    }
  }

  Widget gameCard(int game) {
    late String title, exp, agent, rank, image;
    late bool clicked, detail;
    late double pad, scale;

    switch (game) {
      case 0:
        title = 'valorant';
        exp = "40+ hours";
        agent = "omen, chamber";
        rank = "last act rank : diamond 3";
        image = "valorant";
        clicked = valorantClicked;
        scale = valorantScale;
        detail = valorantDetails;
        break;
      case 1:
        title = 'apex legends';
        exp = "80+ hours";
        agent = "wraith, ash";
        rank = "last act rank : bronze 2";
        image = "apex";
        clicked = apexClicked;
        scale = apexScale;
        detail = apexDetails;
        break;
      case 2:
        title = "gta v";
        exp = "400+ hours";
        agent = "";
        rank = "";
        image = "gtav";
        clicked = gtavClicked;
        scale = gtavScale;
        detail = gtavDetails;
        break;
    }

    return Center(
      child: Padding(
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
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(" main agent(s): ${agent} "),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(" hours played: ${exp} "),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(" latest rank: ${rank} "),
                          )
                        ],
                      ),
                    ),
                  ],
                ));
          },
          onTap: () async {
            setState(() {
              clicked = !clicked;
            });
            Future.delayed(const Duration(milliseconds: 150), () {
              setState(() {
                clicked = !clicked;
              });
              openLink(title);
            });
          },
          child: Card(
            child: MouseRegion(
              onEnter: (a) {
                gameCardMouseEntry(game);
              },
              onExit: (a) {
                gameCardMouseExit(game);
              },
              child: Wrap(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.fastOutSlowIn,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: !clicked
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
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          AnimatedContainer(
                            curve: Curves.easeIn,
                            height: scale != 0.0
                                ? scale
                                : MediaQuery.of(context).size.height * .2,
                            duration: Duration(milliseconds: 150),
                            child: Image.asset(
                              'images/${image}.png',
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: detail ? 1 : 0,
                            duration: Duration(milliseconds: 150),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "${rank} ",
                                  textAlign: TextAlign.center,
                                )),
                              ],
                            ),
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
    );
  }

  streamCardMouseEntry(int card) {
    switch (card) {
      case 0:
        setState(() {
          twitchDetails = true;
          twitchScale = MediaQuery.of(context).size.height * .24;
        });
        break;
      case 1:
        setState(() {
          discordDetails = true;
          discordScale = MediaQuery.of(context).size.height * .24;
        });
        break;
      case 2:
        setState(() {
          ytDetails = true;
          ytScale = MediaQuery.of(context).size.height * .24;
        });
        break;
    }
  }

  streamCardMouseExit(int card) {
    switch (card) {
      case 0:
        setState(() {
          twitchDetails = false;
          twitchScale = MediaQuery.of(context).size.height * .2;
        });
        break;
      case 1:
        setState(() {
          discordDetails = false;
          discordScale = MediaQuery.of(context).size.height * .2;
        });
        break;
      case 2:
        setState(() {
          ytDetails = false;
          ytScale = MediaQuery.of(context).size.height * .2;
        });
        break;
    }
  }

  Widget streamCard(int type) {
    late String title, site, agent, image, subTitle, link;
    late bool clicked, detail;
    late double pad, scale;

    switch (type) {
      case 0:
        site = 'twitch';
        title = "uugiebuugie";
        image = "twitch";
        clicked = twitchClicked;
        scale = twitchScale;
        subTitle = "i stream as much as i can";
        link = "twitch";
        detail = twitchDetails;

        break;
      case 1:
        site = 'discord';
        title = "some_weird_dude#1416";
        image = "discord";
        clicked = discordClicked;
        scale = discordScale;
        subTitle = "add me on discord";
        link = "discord";
        detail = discordDetails;
        break;
      case 2:
        site = "youtube";
        title = "oogieboogie";
        image = "yt";
        clicked = ytClicked;
        scale = ytScale;
        subTitle = "clips from my gameplays and streams";
        link = "yt";
        detail = ytDetails;
        break;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: InkWell(
          onTap: () async {
            // setState(() {
            //   clicked = !clicked;
            // });
            // Future.delayed(const Duration(milliseconds: 150), () {
            //   setState(() {
            //     clicked = !clicked;
            //     scale = MediaQuery.of(context).size.height * .2;
            //   });
            //   openLink(title);
            // });
          },
          child: Card(
            child: MouseRegion(
              onEnter: (a) {
                streamCardMouseEntry(type);
              },
              onExit: (a) {
                streamCardMouseExit(type);
              },
              child: Wrap(
                children: [
                  InkWell(
                    onTap: () async {
                      debugPrint('${clicked.toString()}');
                      setState(() {
                        clicked = !clicked;
                      });
                      debugPrint('${clicked.toString()}');
                      Future.delayed(const Duration(milliseconds: 150), () {
                        setState(() {
                          clicked = !clicked;
                          debugPrint('${clicked.toString()}');
                        });
                        openLink(link);
                      });
                      debugPrint('checkpoint');
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: !clicked
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
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            AnimatedContainer(
                              height: scale != 0.0
                                  ? scale
                                  : MediaQuery.of(context).size.height * .2,
                              duration: Duration(milliseconds: 150),
                              child: Image.asset(
                                'images/${image}.png',
                              ),
                            ),
                            AnimatedOpacity(
                              opacity: detail ? 1 : 0,
                              duration: Duration(milliseconds: 150),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      " ${subTitle} ",
                                      textAlign: TextAlign.center,
                                    )),
                                  ],
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
          ),
        ),
      ),
    );
  }
}
