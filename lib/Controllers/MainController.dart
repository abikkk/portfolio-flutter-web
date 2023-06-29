import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Models/Images.dart';
import 'package:my_porfolio/Models/MorphButton.dart';
import 'package:my_porfolio/Utils/Constants.dart';
import '../Models/ProjectCard.dart';

class MainController extends GetxController {
  // page controller
  final RxInt codingIndex = 0.obs, gamingIndex = 0.obs;
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
  final RxDouble navHovered = 0.0.obs,
      scrollBtn = 0.0.obs,
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

  // gaming screen
  final RxBool ytHover = false.obs,
      twitchHover = false.obs,
      discordHover = false.obs;

  // IDE usage maps
  final Map<String, double> projectMap = {
        CONSTANTS.buttonFlutter: CONSTANTS.flutterProjects,
        CONSTANTS.buttonReact: CONSTANTS.reactProjects,
        CONSTANTS.buttonVue: CONSTANTS.vueProjects
      },
      usageFlutter = {
        CONSTANTS.vsCode: 55,
        CONSTANTS.androidStudio: 45,
      },
      usageReact = {
        CONSTANTS.vsCode: 100,
        CONSTANTS.androidStudio: 0,
      },
      usageVue = {
        CONSTANTS.vsCode: 100,
        CONSTANTS.androidStudio: 0,
      };

  // projects
  RxList<ProjectCard> projects = [
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.own),
        label: 'portfolio'.obs,
        details: ''.obs,
        devLang: 'flutter'.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.northern_trails),
        label: 'northern trails cafe app'.obs,
        details: ''.obs,
        devLang: 'flutter'.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.weather_app),
        label: 'weather app'.obs,
        details: ''.obs,
        devLang: 'flutter'.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.pfd),
        label: 'Pokhara Food Delivery App'.obs,
        details: ''.obs,
        devLang: 'flutter'.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.vansales),
        label: 'ILG Vansales App (Mobile Sales)'.obs,
        details: ''.obs,
        devLang: 'flutter'.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.ilg),
        label: 'ILG Order Booking App'.obs,
        details: ''.obs,
        devLang: 'flutter'.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.ebt),
        label: 'EBT Hospitality App'.obs,
        details: ''.obs,
        devLang: 'flutter'.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.electronica),
        label: 'EBT Delivery App'.obs,
        details: ''.obs,
        devLang: 'flutter'.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.fasttrack),
        label: 'EBT Fasttrack App'.obs,
        details: ''.obs,
        devLang: 'flutter'.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.tim_hortons),
        label: 'Tim Hortons POS'.obs,
        details: ''.obs,
        devLang: 'flutter'.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.hypercity),
        label: 'HyperCity MPOS'.obs,
        details: ''.obs,
        devLang: 'flutter'.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.own),
        label: 'toda mart'.obs,
        details: ''.obs,
        devLang: 'react'.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.own),
        label: 'hotel northern trails'.obs,
        details: ''.obs,
        devLang: 'react'.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.own),
        label: 'employee attendance system'.obs,
        details: ''.obs,
        devLang: 'vue'.obs,
        link: 'github'.obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.own),
        label: 'inventory management system '.obs,
        details: ''.obs,
        devLang: 'vue'.obs,
        link: 'github'.obs),
  ].obs;

  // gradient colors list
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
      ],
      streamGradientList = <List<Color>>[
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
      ],
      socialGradientList = <List<Color>>[
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
      ],
      musicGradientList = <List<Color>>[
        [
          Color.fromRGBO(238, 65, 21, 1),
          Color.fromRGBO(241, 115, 77, 1),
        ],
        [
          Color.fromRGBO(238, 46, 46, 1),
          Color.fromRGBO(247, 83, 83, 1),
        ],
      ],
      skillsGradientList = <List<Color>>[
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
      ],
      ideGradientList = <List<Color>>[
        [
          Color.fromRGBO(5, 111, 160, 1),
          Color.fromRGBO(12, 181, 248, 1),
        ],
        [
          Color.fromRGBO(124, 238, 143, 1),
          Color.fromRGBO(14, 180, 116, 1),
        ]
      ];

// morphic buttons
  RxList<MorphButton> codingMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.flutter),
            image_hovered: Image.asset(AppImages.flutter_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.react),
            image_hovered: Image.asset(AppImages.react_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.vue),
            image_hovered: Image.asset(AppImages.vue_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs)
      ].obs,
      codeIDEMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.vs_code),
            image_hovered: Image.asset(AppImages.vs_code_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'vscode'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.android_studio),
            image_hovered: Image.asset(AppImages.android_studio_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'android_studio'.obs),
      ].obs,
      gamingMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.valorant),
            image_hovered: Image.asset(AppImages.valorant_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'valorant'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.apex),
            image_hovered: Image.asset(AppImages.apex_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'apex legends'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.gtav),
            image_hovered: Image.asset(AppImages.gtav_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'gta v'.obs),
      ].obs,
      streamMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: true.obs,
            image: Image.asset(AppImages.yt),
            image_hovered: Image.asset(AppImages.yt_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'yt'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.twitch),
            image_hovered: Image.asset(AppImages.twitch_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'twitch'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.discord),
            image_hovered: Image.asset(AppImages.discord_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'discord'.obs),
      ].obs,
      socialMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.fb),
            image_hovered: Image.asset(AppImages.fb_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'fb'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.ig),
            image_hovered: Image.asset(AppImages.ig_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'ig'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.twitter),
            image_hovered: Image.asset(AppImages.twitter_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'twitter'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.linkd),
            image_hovered: Image.asset(AppImages.linkd_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'linkd'.obs),
      ].obs,
      jobSocialsMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.linkd),
            image_hovered: Image.asset(AppImages.linkd_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'linkd'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.github),
            image_hovered: Image.asset(AppImages.github_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.gitlab),
            image_hovered: Image.asset(AppImages.gitlab_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'gitlab'.obs),
      ].obs,
      musicMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.soundcloud),
            image_hovered: Image.asset(AppImages.soundcloud_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'soundcloud'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(AppImages.bandlab),
            image_hovered: Image.asset(AppImages.bandlab_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'bandlabs'.obs),
      ].obs;
}
