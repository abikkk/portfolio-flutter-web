import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Models/MorphButton.dart';
import 'package:my_porfolio/Utils/Constants.dart';

import '../Models/ProjectCard.dart';
import '../Screens/Coding.dart';
import '../Screens/Gaming.dart';
import '../Screens/Head.dart';
import '../Screens/Music.dart';
import '../Screens/Socials.dart';

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
  final PageController gamingController = PageController(
    initialPage: 0,
  );
  final PageController musicController = PageController(
    initialPage: 0,
  );
  final PageController socialsController = PageController(
    initialPage: 0,
  );
  RxDouble showScrollBtn = 0.0.obs, scrollIndex = 0.0.obs;
  RxBool isCodeScrollDown = true.obs, isGameScrollDown = true.obs;

  // navigation bar
  final RxInt hoverID = 0.obs, navIndex = 0.obs, navIconID = 0.obs;
  final RxDouble navHovered = 0.0.obs,scrollBtn=0.0.obs,
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
    CONSTANTS.vsCode: 55,
    CONSTANTS.androidStudio: 45,
  };
  final Map<String, double> usageReact = {
    CONSTANTS.vsCode: 100,
    CONSTANTS.androidStudio: 0,
  };
  final Map<String, double> usageVue = {
    CONSTANTS.vsCode: 100,
    CONSTANTS.androidStudio: 0,
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

  // projects
  RxList<ProjectCard> projects = [
    ProjectCard(
        showDetails: false.obs,
        image: 'original_grey_bg.png'.obs,
        label: 'portfolio'.obs,
        details: ''.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: 'northern_trails.png'.obs,
        label: 'northern trails cafe app'.obs,
        details: ''.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: 'weather_app.png'.obs,
        label: 'weather app'.obs,
        details: ''.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: 'pfd_logo.png'.obs,
        label: 'Pokhara Food Delivery App'.obs,
        details: ''.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: 'vansales_logo.png'.obs,
        label: 'ILG Vansales App (Mobile Sales)'.obs,
        details: ''.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: 'ilg_logo.png'.obs,
        label: 'ILG Order Booking App'.obs,
        details: ''.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: 'ebt_logo.jpeg'.obs,
        label: 'EBT Hospitality App'.obs,
        details: ''.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: 'electronica_logo.jpeg'.obs,
        label: 'EBT Delivery App'.obs,
        details: ''.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: 'fasttrack_logo.png'.obs,
        label: 'EBT Fasttrack App'.obs,
        details: ''.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: 'tim_hortons_logo.png'.obs,
        label: 'Tim Hortons POS'.obs,
        details: ''.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: 'hypercity_logo.jpeg'.obs,
        label: 'HyperCity MPOS'.obs,
        details: ''.obs,
        link: 'github'.obs),
  ].obs;

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
            image_hovered: 'flutter_white'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'react'.obs,
            image_hovered: 'react_white'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'vue'.obs,
            image_hovered: 'vue_white'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs)
      ].obs,
      codeIDEMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'vscode'.obs,
            image_hovered: 'vscode'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'vscode'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'android_studio'.obs,
            image_hovered: 'android_studio'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'android_studio'.obs),
      ].obs,
      gamingMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'valorant'.obs,
            image_hovered: 'valorant'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'valorant'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'apex'.obs,
            image_hovered: 'apex'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'apex legends'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'gtav'.obs,
            image_hovered: 'gtav'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'gta v'.obs),
      ].obs,
      streamMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'yt'.obs,
            image_hovered: 'yt_white'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'yt'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'twitch'.obs,
            image_hovered: 'twitch_white'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'twitch'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'discord'.obs,
            image_hovered: 'discord_white'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'discord'.obs),
      ].obs,
      socialMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'fb'.obs,
            image_hovered: 'fb_white'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'fb'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'ig'.obs,
            image_hovered: 'ig_white'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'ig'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'twitter'.obs,
            image_hovered: 'twitter_white'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'twitter'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'linkd'.obs,
            image_hovered: 'linkd_white'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'linkd'.obs),
      ].obs,
      jobSocialsMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'linkd'.obs,
            image_hovered: 'linkd'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'linkd'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'github'.obs,
            image_hovered: 'github'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'gitlab'.obs,
            image_hovered: 'gitlab'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'gitlab'.obs),
      ].obs,
      musicMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'soundcloud'.obs,
            image_hovered: 'soundcloud_white'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'soundcloud'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            image: 'bandlab'.obs,
            image_hovered: 'bandlab_white'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'bandlabs'.obs),
      ].obs;
}
