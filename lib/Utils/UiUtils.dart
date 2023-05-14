// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Controllers/MainController.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'AppThemeData.dart';
// import 'Constants.dart';
// import 'Constants.dart';

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
      case 'discord':
        {
          if (!await launchUrl(Uri.parse('https://discord.gg/949XfbfzpA')))
            throw 'Could not launch Discord Link!';
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
      default:
        {
          throw '${type}';
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
            mainController.codingMorphButtons[buttonType].showDetails.value =
                true;
          },
          onExit: (a) {
            mainController.codingMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .12;
            mainController.codingMorphButtons[buttonType].showDetails.value =
                false;
          },
          child: InkWell(
            onTap: () async {
              mainController.codingMorphButtons[buttonType].isClicked.value =
                  !mainController
                      .codingMorphButtons[buttonType].isClicked.value;

              mainController.codingController.animateToPage((buttonType + 1),
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut);

              // delay
              Future.delayed(const Duration(milliseconds: 150), () {
                mainController.codingMorphButtons[buttonType].isClicked.value =
                    !mainController
                        .codingMorphButtons[buttonType].isClicked.value;

                // mainController
                //     .codingMorphButtons[buttonType].showDetails.value = true;
              });
            },
            child: Wrap(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: (mainController
                              .codingMorphButtons[buttonType].showDetails.value)
                          ? LinearGradient(
                              colors:
                                  mainController.skillsGradientList[buttonType])
                          : null,
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
                        'assets/images/icons/${mainController.codingMorphButtons[buttonType].image}.png',
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
            mainController.gamingMorphButtons[buttonType].showDetails.value =
                true;
          },
          onExit: (a) {
            mainController.gamingMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .12;
            mainController.gamingMorphButtons[buttonType].showDetails.value =
                false;
          },
          child: InkWell(
            onTap: () async {
              mainController.gamingMorphButtons[buttonType].isClicked.value =
                  !mainController
                      .gamingMorphButtons[buttonType].isClicked.value;

              // mainController.gamingController.animateToPage(buttonType + 1,
              //     duration: Duration(milliseconds: 200),
              //     curve: Curves.easeInOut);

              // delay
              Future.delayed(const Duration(milliseconds: 150), () {
                mainController.gamingMorphButtons[buttonType].isClicked.value =
                    !mainController
                        .gamingMorphButtons[buttonType].isClicked.value;

                UiUtils.openLink(
                    mainController.gamingMorphButtons[buttonType].link.value);
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
                      gradient: (mainController
                              .gamingMorphButtons[buttonType].showDetails.value)
                          ? LinearGradient(
                              colors:
                                  mainController.gameGradientList[buttonType])
                          : null,
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
                        'assets/images/icons/${mainController.gamingMorphButtons[buttonType].image}.png',
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

  static Widget streamMorphButtons(
      BuildContext context, MainController mainController, int buttonType) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15.0),
        child: MouseRegion(
          onEnter: (a) {
            mainController.streamMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .14;
            mainController.streamMorphButtons[buttonType].showDetails.value =
                true;
          },
          onExit: (a) {
            mainController.streamMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .12;
            mainController.streamMorphButtons[buttonType].showDetails.value =
                false;
          },
          child: InkWell(
            onTap: () async {
              mainController.streamMorphButtons[buttonType].isClicked.value =
                  !mainController
                      .streamMorphButtons[buttonType].isClicked.value;

              mainController.streamController.animateToPage(buttonType,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut);

              // delay
              Future.delayed(const Duration(milliseconds: 150), () {
                mainController.streamMorphButtons[buttonType].isClicked.value =
                    !mainController
                        .streamMorphButtons[buttonType].isClicked.value;

                // UiUtils.openLink(
                //     mainController.streamMorphButtons[buttonType].link.value);
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
                      gradient: (mainController
                              .streamMorphButtons[buttonType].showDetails.value)
                          ? LinearGradient(
                              colors:
                                  mainController.streamGradientList[buttonType])
                          : null,
                      boxShadow: !mainController
                              .streamMorphButtons[buttonType].isClicked.value
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
                        .streamMorphButtons[buttonType].pad.value),
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      height: mainController
                                  .streamMorphButtons[buttonType].scale.value !=
                              0.0
                          ? mainController
                              .streamMorphButtons[buttonType].scale.value
                          : MediaQuery.of(context).size.height * .12,
                      duration: Duration(milliseconds: 150),
                      child: Image.asset(
                        'assets/images/icons/${mainController.streamMorphButtons[buttonType].image}.png',
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
            mainController.socialMorphButtons[buttonType].showDetails.value =
                true;
          },
          onExit: (a) {
            mainController.socialMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .12;
            mainController.socialMorphButtons[buttonType].showDetails.value =
                false;
          },
          child: InkWell(
            onTap: () async {
              mainController.socialMorphButtons[buttonType].isClicked.value =
                  !mainController
                      .socialMorphButtons[buttonType].isClicked.value;

              // mainController.socialsController.animateToPage(buttonType,
              //     duration: Duration(milliseconds: 200),
              //     curve: Curves.easeInOut);

              // delay
              Future.delayed(const Duration(milliseconds: 150), () {
                mainController.socialMorphButtons[buttonType].isClicked.value =
                    !mainController
                        .socialMorphButtons[buttonType].isClicked.value;

                UiUtils.openLink(
                    mainController.socialMorphButtons[buttonType].link.value);
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
                      gradient: (mainController
                              .socialMorphButtons[buttonType].showDetails.value)
                          ? LinearGradient(
                              colors:
                                  mainController.socialGradientList[buttonType])
                          : null,
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
                        'assets/images/icons/${mainController.socialMorphButtons[buttonType].image}.png',
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
            mainController.musicMorphButtons[buttonType].showDetails.value =
                true;
          },
          onExit: (a) {
            mainController.musicMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .12;
            mainController.musicMorphButtons[buttonType].showDetails.value =
                false;
          },
          child: InkWell(
            onTap: () async {
              mainController.musicMorphButtons[buttonType].isClicked.value =
                  !mainController.musicMorphButtons[buttonType].isClicked.value;

              // mainController.musicController.animateToPage(buttonType + 1,
              //     duration: Duration(milliseconds: 200),
              //     curve: Curves.easeInOut);

              // delay
              Future.delayed(const Duration(milliseconds: 150), () {
                mainController.musicMorphButtons[buttonType].isClicked.value =
                    !mainController
                        .musicMorphButtons[buttonType].isClicked.value;

                UiUtils.openLink(
                    mainController.musicMorphButtons[buttonType].link.value);
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
                      gradient: (mainController
                              .musicMorphButtons[buttonType].showDetails.value)
                          ? LinearGradient(
                              colors:
                                  mainController.musicGradientList[buttonType])
                          : null,
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
                        'assets/images/icons/${mainController.musicMorphButtons[buttonType].image}.png',
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

  static Widget StreamLinkButtons(
    MainController mainController,
    int id,
    String label,
  ) {
    return MouseRegion(
      onEnter: (event) {
        switch (id) {
          case 0:
            mainController.ytHover.value = true;
            break;
          case 1:
            mainController.twitchHover.value = true;
            break;
          case 2:
            mainController.discordHover.value = true;
            break;
        }
      },
      onExit: (event) {
        switch (id) {
          case 0:
            mainController.ytHover.value = false;
            break;
          case 1:
            mainController.twitchHover.value = false;
            break;
          case 2:
            mainController.discordHover.value = false;
            break;
        }
      },
      child: Obx(
        () => AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
              gradient: ((id == 0)
                      ? mainController.ytHover.value
                      : (id == 1)
                          ? mainController.twitchHover.value
                          : mainController.discordHover.value)
                  ? LinearGradient(
                      colors: mainController.streamGradientList[id])
                  : null,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: (mainController.ytHover.value)
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
          child: TextButton.icon(
            onPressed: () {
              switch (id) {
                case 0:
                  UiUtils.openLink('yt');
                  break;
                case 1:
                  UiUtils.openLink('twitch');
                  break;
                case 2:
                  UiUtils.openLink('discord');
                  break;
              }
            },
            label: Text(
              '${label}',
              style: AppThemeData.appThemeData.textTheme.headlineMedium,
            ),
            icon: Icon(
              // !((id == 0)
              //         ? mainController.ytHover.value
              //         : (id == 1)
              //             ? mainController.twitchHover.value
              //             : mainController.discordHover.value)
              //     ? Icons.link
              //     :
              Icons.arrow_forward_ios_rounded,
              color: ((id == 0)
                      ? mainController.ytHover.value
                      : (id == 1)
                          ? mainController.twitchHover.value
                          : mainController.discordHover.value)
                  ? AppThemeData.appThemeData.primaryColor
                  : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  static Widget codingProgressRow(
      MainController mainController, String label, int id) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text('${label} skills'),
          ),
        ),
        Expanded(
          flex: 2,
          child: FAProgressBar(
            size: 24,
            backgroundColor:
                AppThemeData.appThemeData.primaryColor.withOpacity(0.2),
            animatedDuration: Duration(milliseconds: 300),
            currentValue: (id == 0)
                ? mainController.vsValue.value
                : mainController.asValue.value,
            displayText: '%',
            progressGradient:
                LinearGradient(colors: mainController.ideGradientList[id]),
          ),
        ),
      ],
    );
  }

  static Widget pieChart(MainController mainController, BuildContext context,
      var dataMap, String label, var gradientList,
      {bool isGradient = false}) {
    // return SizedBox(
    //   height: double.minPositive,
    //   child: PieChart(
    //     PieChartData(
    //       pieTouchData: PieTouchData(
    //         touchCallback: (FlTouchEvent event, pieTouchResponse) {
    //           if (!event.isInterestedForInteractions ||
    //               pieTouchResponse == null ||
    //               pieTouchResponse.touchedSection == null) {
    //             mainController.pieChartHover.value = -1;
    //             return;
    //           }
    //           mainController.pieChartHover.value =
    //               pieTouchResponse.touchedSection!.touchedSectionIndex;
    //         },
    //       ),
    //       // startDegreeOffset: 180,
    //       borderData: FlBorderData(
    //         show: true,
    //       ),
    //       sectionsSpace: 5,
    //       centerSpaceRadius: 50,
    //       sections: mainController.showingSections(),
    //     ),
    //   ),
    // );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 333,
        width: 333,
        child: PieChart(
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 800),
          chartLegendSpacing: 44,
          chartRadius: MediaQuery.of(context).size.width / 8,
          initialAngleInDegree: 0,
          chartType: ChartType.disc,
          // ringStrokeWidth: 44,
          centerText: "${label}",
          legendOptions: LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.left,
            showLegends: true,
            legendShape: BoxShape.rectangle,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          chartValuesOptions: ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: false,
            showChartValuesOutside: false,
            decimalPlaces: 0,
          ),
          gradientList: (isGradient) ? gradientList : null,
        ),
      ),
    );
  }

  // static PieChartSectionData pieChartSegment(
  //     MaterialColor color0, double value, String label) {
  //   return PieChartSectionData(
  //     color: color0,
  //     value: (value /
  //             (CONSTANTS.flutterProjects +
  //                 CONSTANTS.reactProjects +
  //                 CONSTANTS.vueProjects)) *
  //         100,
  //     title: '${label}',
  //     titleStyle: AppThemeData.appThemeData.textTheme.bodySmall,
  //     radius: 50,
  //     titlePositionPercentageOffset: .5,
  //   );
  // }

// class StreamLinkButtons extends StatelessWidget {
//   StreamLinkButtons({
//     Key? key,
//     required this.mainController,
//     required this.id,
//     required this.label,
//   }) : super(key: key);

//   final MainController mainController;
//   final int id;
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (event) {
//         switch (id) {
//           case 0:
//             mainController.ytHover.value = true;
//             break;
//           case 1:
//             mainController.twitchHover.value = true;
//             break;
//           case 2:
//             mainController.discordHover.value = true;
//             break;
//         }
//       },
//       onExit: (event) {
//         switch (id) {
//           case 0:
//             mainController.ytHover.value = false;
//             break;
//           case 1:
//             mainController.twitchHover.value = false;
//             break;
//           case 2:
//             mainController.discordHover.value = false;
//             break;
//         }
//       },
//       child: Obx(
//         () => AnimatedContainer(
//           duration: Duration(milliseconds: 200),
//           padding: EdgeInsets.all(14),
//           decoration: BoxDecoration(
//               gradient: ((id == 0)
//                       ? mainController.ytHover.value
//                       : (id == 1)
//                           ? mainController.twitchHover.value
//                           : mainController.discordHover.value)
//                   ? LinearGradient(
//                       colors: mainController.streamGradientList[id])
//                   : null,
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               boxShadow: (mainController.ytHover.value)
//                   ? [
//                       BoxShadow(
//                           color: Colors.grey[500]!,
//                           offset: Offset(4, 4),
//                           blurRadius: 15,
//                           spreadRadius: 1),
//                       BoxShadow(
//                           color: Colors.white,
//                           offset: Offset(-4, -4),
//                           blurRadius: 15,
//                           spreadRadius: 1)
//                     ]
//                   : null),
//           child: TextButton.icon(
//             onPressed: () {
//               switch (id) {
//                 case 0:
//                   UiUtils.openLink('yt');
//                   break;
//                 case 1:
//                   UiUtils.openLink('twitch');
//                   break;
//                 case 2:
//                   UiUtils.openLink('discord');
//                   break;
//               }
//             },
//             label: Text(
//               '${label}',
//               style: AppThemeData.appThemeData.textTheme.headlineMedium,
//             ),
//             icon: Icon(
//               Icons.arrow_forward_ios_rounded,
//               color: ((id == 0)
//                       ? mainController.ytHover.value
//                       : (id == 1)
//                           ? mainController.twitchHover.value
//                           : mainController.discordHover.value)
//                   ? AppThemeData.appThemeData.primaryColor
//                   : Colors.transparent,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class codingProgressRow extends StatelessWidget {
//   const codingProgressRow({
//     Key? key,
//     required this.mainController,
//     required this.label,
//     required this.id,
//   }) : super(key: key);

//   final MainController mainController;
//   final String label;
//   final int id;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20.0),
//             child: MouseRegion(
//               onEnter: (e) {
//                 switch (id) {
//                   case 0:
//                     mainController.flutterOpa.value = 1.0;
//                     mainController.flutterValue.value =
//                         (CONSTANTS.flutterProjects /
//                                 (CONSTANTS.flutterProjects +
//                                     CONSTANTS.reactProjects +
//                                     CONSTANTS.vueProjects)) *
//                             100;
//                     break;
//                   case 1:
//                     mainController.reactOpa.value = 1.0;
//                     mainController.reactValue.value = (CONSTANTS.reactProjects /
//                             (CONSTANTS.flutterProjects +
//                                 CONSTANTS.reactProjects +
//                                 CONSTANTS.vueProjects)) *
//                         100;
//                     break;
//                   case 2:
//                     mainController.vueOpa.value = 1.0;
//                     mainController.vueValue.value = (CONSTANTS.vueProjects /
//                             (CONSTANTS.flutterProjects +
//                                 CONSTANTS.reactProjects +
//                                 CONSTANTS.vueProjects)) *
//                         100;
//                     break;
//                 }
//               },
//               // onExit: (e) {
//               //   mainController.flutterOpa.value = 0.0;
//               //   mainController.reactOpa.value = 0.0;
//               //   mainController.vueOpa.value = 0.0;
//               //   mainController.flutterValue.value = 0.0;
//               //   mainController.reactValue.value = 0.0;
//               //   mainController.vueValue.value = 0.0;
//               // },
//               child: Text('${label} skills'),
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 4,
//           child: Obx(
//             () => AnimatedOpacity(
//               opacity: (id == 0)
//                   ? mainController.flutterOpa.value
//                   : (id == 1)
//                       ? mainController.reactOpa.value
//                       : mainController.vueOpa.value,
//               duration: Duration(milliseconds: 200),
//               child: FAProgressBar(
//                 progressColor:
//                     AppThemeData.appThemeData.primaryColor.withOpacity(0.3),
//                 size: 24,
//                 animatedDuration: Duration(milliseconds: 300),
//                 currentValue: (id == 0)
//                     ? mainController.flutterValue.value
//                     : (id == 1)
//                         ? mainController.reactValue.value
//                         : mainController.vueValue.value,
//                 displayText: '%',
//                 progressGradient: LinearGradient(
//                     colors: mainController.skillsGradientList[id]),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

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
