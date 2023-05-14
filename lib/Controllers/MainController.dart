import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Models/MorphButton.dart';
import 'package:my_porfolio/Utils/AppThemeData.dart';
import 'package:my_porfolio/Utils/Constants.dart';

import '../Utils/UiUtils.dart';

class MainController extends GetxController {
  // page controller
  final PageController pageController = PageController(
    initialPage: 0,
  );
  final PageController codingController = PageController(
    initialPage: 0,
  );
  final PageController streamController = PageController(
    initialPage: 0,
  );
  final PageController musicController = PageController(
    initialPage: 0,
  );
  final PageController socialsController = PageController(
    initialPage: 0,
  );

  // navigation bar
  final RxInt hoverID = 0.obs, navIndex = 0.obs, navIconID = 0.obs;
  final RxDouble navHovered = 0.0.obs,
      bgTop = 0.0.obs,
      headerTop = 0.0.obs,
      pad = 50.0.obs,
      scale = 0.0.obs;
  final RxBool showScrollDownBtn = false.obs;

// home screen
  final RxBool subtitle_1 = false.obs,
      subtitle_2 = false.obs,
      subtitle_3 = false.obs;

  // coding screen
  RxInt pieChartHover = 0.obs;
  final RxBool flutter = false.obs, react = false.obs, vue = false.obs;
  final RxDouble vsOpa = 0.0.obs, asOpa = 0.0.obs;
  final RxDouble vsValue = CONSTANTS.vscodePoints.obs,
      asValue = CONSTANTS.androidStudioPoints.obs;
  final Map<String, double> projectMap = {
    "Flutter": CONSTANTS.flutterProjects,
    "React": CONSTANTS.reactProjects,
    "Vue": CONSTANTS.vueProjects
  };
  final Map<String, double> usageFlutter = {
    "VS Code": 55,
    "Android Studio": 45,
  };
  final Map<String, double> usageReact = {
    "VS Code": 100,
    "Android Studio": 0,
  };
  final Map<String, double> usageVue = {
    "VS Code": 100,
    "Android Studio": 0,
  };
  final skillsGradientList = <List<Color>>[
    [
      Color.fromRGBO(41, 71, 236, 1),
      Color.fromRGBO(93, 147, 247, 1),
    ],
    [
      Color.fromRGBO(5, 111, 160, 1),
      Color.fromRGBO(12, 181, 248, 1),
    ],
    [
      Color.fromRGBO(14, 180, 116, 1),
      Color.fromRGBO(124, 238, 143, 1),
    ]
  ];
  final ideGradientList = <List<Color>>[
    [
      Color.fromRGBO(5, 111, 160, 1),
      Color.fromRGBO(12, 181, 248, 1),
    ],
    [
      Color.fromRGBO(124, 238, 143, 1),
      Color.fromRGBO(14, 180, 116, 1),
    ]
  ];

  // List<PieChartSectionData> showingSections() {
  //   return List.generate(
  //     3,
  //     (i) {
  //       const color0 = Colors.lightBlue;
  //       const color1 = Colors.blue;
  //       const color2 = Colors.green;

  //       switch (i) {
  //         case 0:
  //           return WidgetUtils.pieChartSegment(
  //               color0, CONSTANTS.flutterProjects, CONSTANTS.buttonFlutter);
  //         case 1:
  //           return WidgetUtils.pieChartSegment(
  //               color1, CONSTANTS.reactProjects, CONSTANTS.buttonReact);
  //         case 2:
  //           return WidgetUtils.pieChartSegment(
  //               color2, CONSTANTS.vueProjects, CONSTANTS.buttonVue);
  //         default:
  //           throw Error();
  //       }
  //     },
  //   );
  // }

  // gaming screen
  final RxBool ytHover = false.obs,
      twitchHover = false.obs,
      discordHover = false.obs;
  final gameGradientList = <List<Color>>[
    [
      Color.fromRGBO(212, 30, 30, 1),
      Color.fromRGBO(247, 83, 83, 1),
    ],
    [
      Color.fromRGBO(143, 38, 38, 1),
      Color.fromRGBO(235, 24, 24, 1),
    ],
    [
      Color.fromRGBO(14, 180, 116, 1),
      Color.fromRGBO(124, 238, 143, 1),
    ]
  ];
  final streamGradientList = <List<Color>>[
    [
      Color.fromRGBO(212, 30, 30, 1),
      Color.fromRGBO(247, 83, 83, 1),
    ],
    [
      Color.fromRGBO(176, 3, 245, 1),
      Color.fromRGBO(224, 82, 243, 1),
    ],
    [
      Color.fromRGBO(6, 118, 247, 1),
      Color.fromRGBO(73, 141, 243, 1),
    ]
  ];

  // socials screen
  final socialGradientList = <List<Color>>[
    [
      Color.fromRGBO(73, 141, 243, 1),
      Color.fromRGBO(6, 118, 247, 1),
    ],
    [
      Color.fromRGBO(238, 155, 61, 1),
      Color.fromRGBO(202, 15, 93, 1),
    ],
    [
      Color.fromRGBO(101, 160, 236, 1),
      Color.fromRGBO(38, 156, 235, 1),
    ],
    [
      Color.fromRGBO(6, 118, 247, 1),
      Color.fromRGBO(73, 141, 243, 1),
    ],
  ];

  // music screen
  final musicGradientList = <List<Color>>[
    [
      Color.fromRGBO(238, 65, 21, 1),
      Color.fromRGBO(241, 115, 77, 1),
    ],
    [
      Color.fromRGBO(238, 46, 46, 1),
      Color.fromRGBO(247, 83, 83, 1),
    ],
  ];

// morphic buttons
  RxList<MorphButton> codingMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'flutter'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'react'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'vue'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs)
      ].obs,
      codeIDEMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'vscode'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'vscode'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'android_studio'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'android_studio'.obs),
      ].obs,
      gamingMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'valorant'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'valorant'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'apex'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'apex legends'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'gtav'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'gta v'.obs),
      ].obs,
      streamMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'yt'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'yt'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'twitch'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'twitch'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'discord'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'discord'.obs),
      ].obs,
      socialMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'fb'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'fb'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'ig'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'ig'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'twitter'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'twitter'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'linkd'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'linkd'.obs),
      ].obs,
      jobSocialsMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'linkd'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'linkd'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'github'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'gitlab'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'gitlab'.obs),
      ].obs,
      musicMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'soundcloud'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'soundcloud'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'bandlab'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'bandlabs'.obs),
      ].obs;

  // RxBool fbClicked = false.obs,
  //     igClicked = false.obs,
  //     twitterClicked = false.obs,
  //     linkdClicked = false.obs,
  //     ytClicked = false.obs,
  //     twitchClicked = false.obs,
  //     discordClicked = false.obs;
  // RxDouble fbScale = 0.0.obs,
  //     igScale = 0.0.obs,
  //     twitterScale = 0.0.obs,
  //     linkdScale = 0.0.obs,
  //     ytScale = 0.0.obs,
  //     twitchScale = 0.0.obs,
  //     discordScale = 0.0.obs,
  //     fbPad = 50.0.obs,
  //     igPad = 50.0.obs,
  //     twitterPad = 50.0.obs,
  //     linkdPad = 50.0.obs,
  //     ytPad = 50.0.obs,
  //     twitchPad = 50.0.obs,
  //     discordPad = 50.0.obs;
  // RxString fbImage = 'fb'.obs,
  //     igImage = 'ig'.obs,
  //     ttImage = 'twitter'.obs,
  //     linkdImage = 'linkd'.obs,
  //     ytImage = 'yt'.obs,
  //     twitchImage = 'twitch'.obs,
  //     discordImage = 'discord'.obs;

  // final buttonDetails = {
  //       'flutterDetails': false.obs,
  //       'vueDetails': false.obs,
  //       'dnetDetails': false.obs,
  //       'reactDetails': false.obs,
  //       'twitchDetails': false.obs,
  //       'discordDetails': false.obs,
  //       'ytDetails': false.obs,
  //       'valorantDetails': false.obs,
  //       'apexDetails': false.obs,
  //       'pubgDetails': false.obs,
  //       'gtavDetails': false.obs,
  //     },
  //     buttonClicked = {
  //       'twitchClicked': false.obs,
  //       'discordClicked': false.obs,
  //       'ytClicked': false.obs,
  //       'valorantClicked': false.obs,
  //       'apexClicked': false.obs,
  //       'pubgClicked': false.obs,
  //       'gtavClicked': false.obs
  //     },
  //     buttonScale = {
  //       'flutterScale': 0.0.obs,
  //       'cScale': 0.0.obs,
  //       'reactScale': 0.0.obs,
  //       'vueScale': 0.0.obs,
  //       'dnetScale': 0.0.obs,
  //       'discordScale': 0.0.obs,
  //       'twitchScale': 0.0.obs,
  //       'ytScale': 0.0.obs,
  //       'valorantScale': 0.0.obs,
  //       'apexScale': 0.0.obs,
  //       'pubgScale': 0.0.obs,
  //       'gtavScale': 0.0.obs,
  //     },
  //     buttonPad = {
  //       'flutterPad': 5.0.obs,
  //       'cPad': 5.0.obs,
  //       'reactPad': 5.0.obs,
  //       'vuePad': 5.0.obs,
  //       'dnetPad': 5.0.obs
  //     };
}
