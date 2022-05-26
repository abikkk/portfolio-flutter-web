import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      gtavClicked = false;

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
      padding: const EdgeInsets.all(20.0),
      height: (MediaQuery.of(context).size.height / 1.2),
      child: Column(
        children: [
          // games
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onLongPress: () {
                          Get.defaultDialog(
                              title: "valorant",
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
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: Text(
                                              " main agent(s): chamber | omen "),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Text(" hours played: 17 "),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child:
                                              Text(" initial rank: bronze ii "),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child:
                                              Text("latest rank: platinum ii"),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                        onTap: () async {
                          setState(() {
                            valorantClicked = !valorantClicked;
                          });
                          Future.delayed(const Duration(milliseconds: 150), () {
                            setState(() {
                              valorantClicked = !valorantClicked;
                              valorantScale =
                                  MediaQuery.of(context).size.height * .2;
                            });
                            openLink('valorant');
                          });
                        },
                        child: Card(
                          child: MouseRegion(
                            onEnter: (a) {
                              setState(() {
                                valorantScale =
                                    MediaQuery.of(context).size.height * .24;
                              });
                            },
                            onExit: (a) {
                              setState(() {
                                valorantScale =
                                    MediaQuery.of(context).size.height * .2;
                              });
                            },
                            child: Wrap(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 100),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: !valorantClicked
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
                                    padding: const EdgeInsets.all(50.0),
                                    child: Column(
                                      children: [
                                        AnimatedContainer(
                                          height: valorantScale != 0.0
                                              ? valorantScale
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .2,
                                          duration: Duration(milliseconds: 150),
                                          child: Image.asset(
                                            'images/valorant.png',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                " last act rank: plat i ",
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
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onLongPress: () {
                          Get.defaultDialog(
                              title: "apex legends",
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
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: Text(
                                              " main agent(s): ash | wraith "),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Text(" hours played: 51.6 "),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child:
                                              Text(" initial rank: bronze ii "),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text("latest rank: rookie ii"),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                        onTap: () async {
                          setState(() {
                            apexClicked = !apexClicked;
                          });
                          Future.delayed(const Duration(milliseconds: 150), () {
                            setState(() {
                              apexClicked = !apexClicked;
                              apexScale =
                                  MediaQuery.of(context).size.height * .2;
                            });
                            openLink('apex');
                          });
                        },
                        child: Card(
                          child: MouseRegion(
                            onEnter: (a) {
                              setState(() {
                                apexScale =
                                    MediaQuery.of(context).size.height * .24;
                              });
                            },
                            onExit: (a) {
                              setState(() {
                                apexScale =
                                    MediaQuery.of(context).size.height * .2;
                              });
                            },
                            child: Wrap(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 100),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: !apexClicked
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
                                    padding: const EdgeInsets.all(50.0),
                                    child: Column(
                                      children: [
                                        AnimatedContainer(
                                          height: apexScale != 0.0
                                              ? apexScale
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .2,
                                          duration: Duration(milliseconds: 150),
                                          child: Image.asset(
                                            'images/apex.png',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                " last act rank: bronze i ",
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
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onLongPress: () {
                          Get.defaultDialog(
                              title: "pubg pc",
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
                                          child: Text(" hours played: 4 "),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                        onTap: () async {
                          setState(() {
                            pubgClicked = !pubgClicked;
                          });
                          Future.delayed(const Duration(milliseconds: 150), () {
                            setState(() {
                              pubgClicked = !pubgClicked;
                              pubgScale =
                                  MediaQuery.of(context).size.height * .2;
                            });
                            openLink('pubg');
                          });
                        },
                        child: Card(
                          child: MouseRegion(
                            onEnter: (a) {
                              setState(() {
                                pubgScale =
                                    MediaQuery.of(context).size.height * .24;
                              });
                            },
                            onExit: (a) {
                              setState(() {
                                pubgScale =
                                    MediaQuery.of(context).size.height * .2;
                              });
                            },
                            child: Wrap(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 100),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: !pubgClicked
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
                                    padding: const EdgeInsets.all(50.0),
                                    child: Column(
                                      children: [
                                        AnimatedContainer(
                                          height: pubgScale != 0.0
                                              ? pubgScale
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .2,
                                          duration: Duration(milliseconds: 150),
                                          child: Image.asset(
                                            'images/pubg.png',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                " chicken dinners: 16 ",
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
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onLongPress: () {
                          Get.defaultDialog(
                              title: "valorant",
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
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: Text(" apartments: 2 "),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Text(" hours played: 287 "),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Text(" online rank: 96 "),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                        onTap: () async {
                          setState(() {
                            gtavClicked = !gtavClicked;
                          });
                          Future.delayed(const Duration(milliseconds: 150), () {
                            setState(() {
                              gtavClicked = !gtavClicked;
                              gtavScale =
                                  MediaQuery.of(context).size.height * .2;
                            });
                            openLink('gtav');
                          });
                        },
                        child: Card(
                          child: MouseRegion(
                            onEnter: (a) {
                              setState(() {
                                gtavScale =
                                    MediaQuery.of(context).size.height * .24;
                              });
                            },
                            onExit: (a) {
                              setState(() {
                                gtavScale =
                                    MediaQuery.of(context).size.height * .2;
                              });
                            },
                            child: Wrap(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 100),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: !gtavClicked
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
                                    padding: const EdgeInsets.all(50.0),
                                    child: Column(
                                      children: [
                                        AnimatedContainer(
                                          height: gtavScale != 0.0
                                              ? gtavScale
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .2,
                                          duration: Duration(milliseconds: 150),
                                          child: Image.asset(
                                            'images/gtav.png',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                " online hours: 287 and counting ",
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
                  ),
                ),
              ],
            ),
          ),

          // twitch discord youtube
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            twitchClicked = !twitchClicked;
                          });
                          Future.delayed(const Duration(milliseconds: 150), () {
                            setState(() {
                              twitchClicked = !twitchClicked;
                            });
                            openLink('twitch');
                          });
                        },
                        child: Card(
                          child: MouseRegion(
                            onEnter: (a) {
                              setState(() {
                                twitchScale =
                                    MediaQuery.of(context).size.height * .24;
                              });
                            },
                            onExit: (a) {
                              setState(() {
                                twitchScale =
                                    MediaQuery.of(context).size.height * .2;
                              });
                            },
                            child: Wrap(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 100),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: !twitchClicked
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
                                    padding: const EdgeInsets.all(50.0),
                                    child: Column(
                                      children: [
                                        AnimatedContainer(
                                          curve: Curves.easeIn,
                                          height: twitchScale != 0.0
                                              ? twitchScale
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .2,
                                          duration: Duration(milliseconds: 150),
                                          child: Image.asset(
                                            'images/twitch.png',
                                          ),
                                        ),
                                        Text(
                                            'i stream games on my leisure time.')
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
                      child: MouseRegion(
                        onEnter: (a) {
                          setState(() {
                            discordScale =
                                MediaQuery.of(context).size.height * .24;
                          });
                        },
                        onExit: (a) {
                          setState(() {
                            discordScale =
                                MediaQuery.of(context).size.height * .2;
                          });
                        },
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              discordClicked = !discordClicked;
                            });
                            Future.delayed(const Duration(milliseconds: 150),
                                () {
                              setState(() {
                                discordClicked = !discordClicked;
                              });
                              openLink('discord');
                            });
                          },
                          child: Wrap(
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: !twitchClicked
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
                                  padding: const EdgeInsets.all(50.0),
                                  child: Column(
                                    children: [
                                      AnimatedContainer(
                                        curve: Curves.easeIn,
                                        height: discordScale != 0.0
                                            ? discordScale
                                            : MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .2,
                                        duration: Duration(milliseconds: 150),
                                        child: Image.asset(
                                          'images/discord.png',
                                        ),
                                      ),
                                      Text(' OogieBoogie#1416 ')
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
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: MouseRegion(
                        onEnter: (a) {
                          setState(() {
                            ytScale = MediaQuery.of(context).size.height * .24;
                          });
                        },
                        onExit: (a) {
                          setState(() {
                            ytScale = MediaQuery.of(context).size.height * .2;
                          });
                        },
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              ytClicked = !ytClicked;
                            });
                            Future.delayed(const Duration(milliseconds: 150),
                                () {
                              setState(() {
                                ytClicked = !ytClicked;
                              });
                              openLink('yt');
                            });
                          },
                          child: Wrap(
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: !ytClicked
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
                                  padding: const EdgeInsets.all(50.0),
                                  child: Column(
                                    children: [
                                      AnimatedContainer(
                                        curve: Curves.easeIn,
                                        height: ytScale != 0.0
                                            ? ytScale
                                            : MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .2,
                                        duration: Duration(milliseconds: 150),
                                        child: Image.asset(
                                          'assets/images/yt.png',
                                        ),
                                      ),
                                      Text(
                                          'i put clips from my twitch live stream')
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
              ],
            ),
          ),
          // Column(
          //   children: [
          //     Text(
          //       "games have always been my passion along with coding. the first time my papa put me in his lap to play super mario, i knew i was hooked. since early on, i've always been into open world games and fps particularly. but i've dabbled in few of other genres like sandbox, simulators, survivals, action adventures, real time strategy, rpg, and mmorpg. something about getting lost in a virtual world, unlocking levels, achieving new items, surviving and wining over enemies and basically challenging myself to do better in any games has pushed me mentally and emotionally as well.",
          //       style: TextStyle(fontSize: 20),
          //     ),
          //     Divider(
          //       height: 10,
          //       color: Colors.transparent,
          //     ),
          //     Text(
          //       "fps and open world games have always intrigued me more than any other video game genres. in open world, i could get lost for more than i can admit. a part of me wanted to complete the main story line to complete the plot of the game, while the other wanted to just go about and explore wherever and whatever. growing up, the grand theft auto series was a big part of my gaming journey. spending hours and hours long just roaming around, completing missions, doing bunch of gta stuffs, i dont have a single memeory where i got bored playing those games. it was just not possible.",
          //       style: TextStyle(fontSize: 20),
          //     ),
          //     Divider(
          //       height: 10,
          //       color: Colors.transparent,
          //     ),
          //     Text(
          //       "waiting for the exams to be over when i finally got to go back home and start roaming on those mean groove streets of los santos or go on a rampage on downton, vice city or just drive my truck in euro truck simulator, time really flew right past me and i only hope to relive those days. good ol' days i guess",
          //       style: TextStyle(fontSize: 20),
          //     ),
          //     Divider(
          //       height: 10,
          //       color: Colors.transparent,
          //     ),
          //     Text(
          //       "in fps, i could name a dozens of games that i loved playing. arma, halo, battlefield, call of duty, half life and the og of all online shooters, counter strike. particularly cs 1.6. i remember me and my friends in our school computer lab, switching to desktop when our tutor came to check our work and and back to the game as soon as he turned his back. kaale, hade, edu, hamma, navey, kerey, kina, miss my cs gang.",
          //       style: TextStyle(fontSize: 20),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
