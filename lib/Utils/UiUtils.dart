import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Controllers/MainController.dart';
import 'package:url_launcher/url_launcher.dart';

class UiUtils {
  // web page launcher
  static openLink(type) async {
    switch (type) {
      case 'fb':
        {
          if (!await launchUrl(
              Uri.parse("https://www.facebook.com/abik.vaidhya")))
            throw 'Could not launch Facebook Link!';
          break;
        }
      case 'ig':
        {
          if (!await launchUrl(
              Uri.parse('https://www.instagram.com/_abik.vaidhya_/')))
            throw 'Could not launch Instagram Link!';
        }
        break;
      case 'twitch':
        {
          if (!await launchUrl(Uri.parse('https://www.twitch.tv/uugiebuugie')))
            throw 'Could not launch Twitch Link!';
        }
        break;
      case 'yt':
        {
          if (!await launchUrl(Uri.parse(
              'https://www.youtube.com/channel/UCaPj2jBIWUN7nZQWfyRr1pg')))
            throw 'Could not launch YouTube Link!';
        }
        break;
      case 'twitter':
        {
          if (!await launchUrl(
              Uri.parse('https://twitter.com/u_serious_dafuq')))
            throw 'Could not launch Twitter Link!';
        }
        break;
      case 'linkd':
        {
          if (!await launchUrl(
              Uri.parse('https://www.linkedin.com/in/abik-vaidhya-ab9015168/')))
            throw 'Could not launch LinkedIn Link!';
          break;
        }
      case 'valorant':
        {
          if (!await launchUrl(Uri.parse(
              'https://tracker.gg/valorant/profile/riot/OogieBoogie%2348Kk/overview')))
            throw 'Could not launch Valorant stats Link!';
          break;
        }
      case 'apex legends':
        {
          if (!await launchUrl(Uri.parse(
              'https://apex.tracker.gg/apex/profile/origin/TheOogieBoogie/overview')))
            throw 'Could not launch Apex stats Link!';
          break;
        }
      case 'gta v':
        {
          if (!await launchUrl(Uri.parse(
              'https://socialclub.rockstargames.com/member/thepepepopoman/')))
            throw 'Could not launch GTA V Social Club Link!';
          break;
        }
      case 'soundcloud':
        {
          if (!await launchUrl(Uri.parse('https://soundcloud.com/48-ik')))
            throw 'Could not launch SoundCloud Link!';
          break;
        }
      case 'bandlabs':
        {
          if (!await launchUrl(
              Uri.parse('https://www.bandlab.com/abikvaidhya')))
            throw 'Could not launch BandLabs Link!';
          break;
        }
      case 'github':
        {
          if (!await launchUrl(Uri.parse('https://github.com/abikkk')))
            throw 'Could not launch GitHub Link!';
          break;
        }
    }
  }

  static navigate(int navIndex, MainController mainController) {
    mainController.pageController.animateToPage(navIndex - 1,
        duration: Duration(milliseconds: 444), curve: Curves.easeInOut);
    mainController.navIndex.value = navIndex - 1;
  }
}

class WidgetUtils {
  static Widget bulletineIcon() {
    return Icon(
      Icons.circle,
      color: Colors.white,
    );
  }

  static Widget codingMorphButtons(
      BuildContext context, MainController mainController, int buttonType) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15.0),
        child: MouseRegion(
          onEnter: (a) {
            mainController.codingMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .14;
          },
          onExit: (a) {
            mainController.codingMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .12;
          },
          child: InkWell(
            onTap: () async {
              mainController.codingMorphButtons[buttonType].isClicked.value =
                  !mainController
                      .codingMorphButtons[buttonType].isClicked.value;

              // delay
              Future.delayed(const Duration(milliseconds: 150), () {
                mainController.codingMorphButtons[buttonType].isClicked.value =
                    !mainController
                        .codingMorphButtons[buttonType].isClicked.value;

                // UiUtils.openLink(
                //     mainController.codingMorphButtons[buttonType].link);
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
                      boxShadow: !mainController
                              .codingMorphButtons[buttonType].isClicked.value
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
                    padding: EdgeInsets.all(mainController
                        .codingMorphButtons[buttonType].pad.value),
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      height: mainController
                                  .codingMorphButtons[buttonType].scale.value !=
                              0.0
                          ? mainController
                              .codingMorphButtons[buttonType].scale.value
                          : MediaQuery.of(context).size.height * .12,
                      duration: Duration(milliseconds: 150),
                      child: Image.asset(
                        'assets/images/${mainController.codingMorphButtons[buttonType].image}.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget gamingMorphButtons(
      BuildContext context, MainController mainController, int buttonType) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15.0),
        child: MouseRegion(
          onEnter: (a) {
            mainController.gamingMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .14;
          },
          onExit: (a) {
            mainController.gamingMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .12;
          },
          child: InkWell(
            onTap: () async {
              mainController.gamingMorphButtons[buttonType].isClicked.value =
                  !mainController
                      .gamingMorphButtons[buttonType].isClicked.value;

              // delay
              Future.delayed(const Duration(milliseconds: 150), () {
                mainController.gamingMorphButtons[buttonType].isClicked.value =
                    !mainController
                        .gamingMorphButtons[buttonType].isClicked.value;

                // UiUtils.openLink(
                //     mainController.gamingMorphButtons[buttonType].link);
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
                      boxShadow: !mainController
                              .gamingMorphButtons[buttonType].isClicked.value
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
                    padding: EdgeInsets.all(mainController
                        .gamingMorphButtons[buttonType].pad.value),
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      height: mainController
                                  .gamingMorphButtons[buttonType].scale.value !=
                              0.0
                          ? mainController
                              .gamingMorphButtons[buttonType].scale.value
                          : MediaQuery.of(context).size.height * .12,
                      duration: Duration(milliseconds: 150),
                      child: Image.asset(
                        'assets/images/${mainController.gamingMorphButtons[buttonType].image}.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget socialMorphButtons(
      BuildContext context, MainController mainController, int buttonType) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15.0),
        child: MouseRegion(
          onEnter: (a) {
            mainController.socialMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .14;
          },
          onExit: (a) {
            mainController.socialMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .12;
          },
          child: InkWell(
            onTap: () async {
              mainController.socialMorphButtons[buttonType].isClicked.value =
                  !mainController
                      .socialMorphButtons[buttonType].isClicked.value;

              // delay
              Future.delayed(const Duration(milliseconds: 150), () {
                mainController.socialMorphButtons[buttonType].isClicked.value =
                    !mainController
                        .socialMorphButtons[buttonType].isClicked.value;

                // UiUtils.openLink(
                //     mainController.gamingMorphButtons[buttonType].link);
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
                      boxShadow: !mainController
                              .socialMorphButtons[buttonType].isClicked.value
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
                    padding: EdgeInsets.all(mainController
                        .socialMorphButtons[buttonType].pad.value),
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      height: mainController
                                  .socialMorphButtons[buttonType].scale.value !=
                              0.0
                          ? mainController
                              .socialMorphButtons[buttonType].scale.value
                          : MediaQuery.of(context).size.height * .12,
                      duration: Duration(milliseconds: 150),
                      child: Image.asset(
                        'assets/images/${mainController.socialMorphButtons[buttonType].image}.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget musicMorphButtons(
      BuildContext context, MainController mainController, int buttonType) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15.0),
        child: MouseRegion(
          onEnter: (a) {
            mainController.musicMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .14;
          },
          onExit: (a) {
            mainController.musicMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .12;
          },
          child: InkWell(
            onTap: () async {
              mainController.musicMorphButtons[buttonType].isClicked.value =
                  !mainController.musicMorphButtons[buttonType].isClicked.value;

              // delay
              Future.delayed(const Duration(milliseconds: 150), () {
                mainController.musicMorphButtons[buttonType].isClicked.value =
                    !mainController
                        .musicMorphButtons[buttonType].isClicked.value;

                // UiUtils.openLink(
                //     mainController.gamingMorphButtons[buttonType].link);
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
                      boxShadow: !mainController
                              .musicMorphButtons[buttonType].isClicked.value
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
                    padding: EdgeInsets.all(
                        mainController.musicMorphButtons[buttonType].pad.value),
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      height: mainController
                                  .musicMorphButtons[buttonType].scale.value !=
                              0.0
                          ? mainController
                              .musicMorphButtons[buttonType].scale.value
                          : MediaQuery.of(context).size.height * .12,
                      duration: Duration(milliseconds: 150),
                      child: Image.asset(
                        'assets/images/${mainController.musicMorphButtons[buttonType].image}.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // static Future openLinkDialog(BuildContext context) {
  //   return Get.defaultDialog(
  //       title: 'links:',
  //       titleStyle: TextStyle(fontStyle: FontStyle.normal),
  //       content: Container(
  //         width: MediaQuery.of(context).size.width / 4,
  //         height: MediaQuery.of(context).size.height / 4,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             Center(
  //               child: InkWell(
  //                 onTap: () async {
  //                   UiUtils.openLink('soundcloud');
  //                 },
  //                 child: MouseRegion(
  //                   onEnter: (a) {
  //                     scScale = MediaQuery.of(context).size.height * .2;
  //                   },
  //                   onExit: (a) {
  //                     scScale = MediaQuery.of(context).size.height * .18;
  //                   },
  //                   child: Card(
  //                     child: Wrap(
  //                       children: [
  //                         AnimatedContainer(
  //                           duration: Duration(milliseconds: 100),
  //                           decoration: BoxDecoration(
  //                               color: Colors.white,
  //                               borderRadius: BorderRadius.circular(15),
  //                               boxShadow: !scClicked
  //                                   ? [
  //                                       BoxShadow(
  //                                           color: Colors.grey[500]!,
  //                                           offset: Offset(4, 4),
  //                                           blurRadius: 15,
  //                                           spreadRadius: 1),
  //                                       BoxShadow(
  //                                           color: Colors.white,
  //                                           offset: Offset(-4, -4),
  //                                           blurRadius: 15,
  //                                           spreadRadius: 1)
  //                                     ]
  //                                   : null),
  //                           child: Padding(
  //                             padding: const EdgeInsets.all(5.0),
  //                             child: AnimatedContainer(
  //                               height: scScale != 0.0
  //                                   ? scScale
  //                                   : MediaQuery.of(context).size.height * .18,
  //                               duration: Duration(milliseconds: 150),
  //                               child: Image.asset(
  //                                 'images/soundcloud.png',
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Center(
  //               child: InkWell(
  //                 onTap: () async {
  //                   UiUtils.openLink('soundcloud');
  //                 },
  //                 child: MouseRegion(
  //                   onEnter: (a) {
  //                     scScale = MediaQuery.of(context).size.height * .2;
  //                   },
  //                   onExit: (a) {
  //                     scScale = MediaQuery.of(context).size.height * .18;
  //                   },
  //                   child: Card(
  //                     child: Wrap(
  //                       children: [
  //                         AnimatedContainer(
  //                           duration: Duration(milliseconds: 100),
  //                           decoration: BoxDecoration(
  //                               color: Colors.white,
  //                               borderRadius: BorderRadius.circular(15),
  //                               boxShadow: !scClicked
  //                                   ? [
  //                                       BoxShadow(
  //                                           color: Colors.grey[500]!,
  //                                           offset: Offset(4, 4),
  //                                           blurRadius: 15,
  //                                           spreadRadius: 1),
  //                                       BoxShadow(
  //                                           color: Colors.white,
  //                                           offset: Offset(-4, -4),
  //                                           blurRadius: 15,
  //                                           spreadRadius: 1)
  //                                     ]
  //                                   : null),
  //                           child: Padding(
  //                             padding: const EdgeInsets.all(5.0),
  //                             child: AnimatedContainer(
  //                               height: scScale != 0.0
  //                                   ? scScale
  //                                   : MediaQuery.of(context).size.height * .18,
  //                               duration: Duration(milliseconds: 150),
  //                               child: Image.asset(
  //                                 'images/soundcloud.png',
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Center(
  //               child: InkWell(
  //                 onTap: () async {
  //                   UiUtils.openLink('bandlabs');
  //                 },
  //                 child: MouseRegion(
  //                   onEnter: (a) {
  //                     bdScale = MediaQuery.of(context).size.height * .2;
  //                   },
  //                   onExit: (a) {
  //                     bdScale = MediaQuery.of(context).size.height * .18;
  //                   },
  //                   child: Card(
  //                     child: Wrap(
  //                       children: [
  //                         AnimatedContainer(
  //                           duration: Duration(milliseconds: 100),
  //                           decoration: BoxDecoration(
  //                               color: Colors.white,
  //                               borderRadius: BorderRadius.circular(15),
  //                               boxShadow: !blClicked
  //                                   ? [
  //                                       BoxShadow(
  //                                           color: Colors.grey[500]!,
  //                                           offset: Offset(4, 4),
  //                                           blurRadius: 15,
  //                                           spreadRadius: 1),
  //                                       BoxShadow(
  //                                           color: Colors.white,
  //                                           offset: Offset(-4, -4),
  //                                           blurRadius: 15,
  //                                           spreadRadius: 1)
  //                                     ]
  //                                   : null),
  //                           child: Padding(
  //                             padding: const EdgeInsets.all(5.0),
  //                             child: AnimatedContainer(
  //                               height: bdScale != 0.0
  //                                   ? bdScale
  //                                   : MediaQuery.of(context).size.height * .18,
  //                               duration: Duration(milliseconds: 150),
  //                               child: Image.asset(
  //                                 'images/bandlab.png',
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ));
  // }
}
