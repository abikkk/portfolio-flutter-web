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
  RxDouble showScrollBtn = 0.3.obs,
      scrollIndex = 0.0.obs,
      cursorX = 0.0.obs,
      cursorY = 0.0.obs;
  RxBool isCodeScrollDown = true.obs,
      isGameScrollDown = true.obs,
      projectDetails = false.obs;
  late ProjectCard selectedProject;

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
        details:
            'this is my portfolio website developed using flutter web. it contains information about my skillset and what i am available for.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['web'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagLaunched,
          CONSTANTS.projectTagWorkingOn,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.pfd),
        label: 'Pokhara Food Delivery App'.obs,
        details:
            'food order/delivery application currently operational in Pokhara.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [CONSTANTS.projectTagCompleted].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.ilg),
        label: 'ILG Order Booking App'.obs,
        details:
            'inventory management and stock order application designed by EBT LLC, Dubai for their clients.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagLaunched,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.vansales),
        label: 'ILG Vansales App (Mobile Sales)'.obs,
        details:
            'updated version of ILG Order Booking App with then latest dart version (3.0.7), with modified features.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagLaunched,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.ebt),
        label: 'EBT Hospitality App'.obs,
        details:
            'menu + mobile POS system for multiple restaurants and lounges for clients of EBT LLC, Dubai.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagLaunched,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.electronica),
        label: 'EBT Delivery App'.obs,
        details:
            'delivery service application with staff management features for clients of EBT LLC, Dubai.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagLaunched,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.fasttrack),
        label: 'EBT Fasttrack App'.obs,
        details:
            'garage application with mechanic support and vehicle support features for clients for EBT LLC, Dubai.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagLaunched,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.tim_hortons),
        label: 'Tim Hortons POS'.obs,
        details:
            'mobile POS application for Tim Hortons clients of EBT LLC, Dubai.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagLaunched,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.hypercity),
        label: 'HyperCity MPOS'.obs,
        details:
            'mobile POS application for HyperCity client of EBT LLC, Dubai.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagLaunched,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.northern_trails),
        label: 'northern trails cafe app'.obs,
        details:
            'a simple cafe menu app for a cafe located in khahare, lakeside.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagWorkingOn,
          CONSTANTS.projectTagUnder,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.own),
        label: 'weather app'.obs,
        details: 'a simple weather application.'.obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagWorkingOn,
          CONSTANTS.projectTagUnder,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.own),
        label: 'aayush man gubaju - portfolio'.obs,
        details:
            'portfolio web application for a graphic designer, Mr. Aayush Man Gubaju.'
                .obs,
        devLang: 'flutter web'.obs,
        platform: ['web'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagUnder,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.own),
        label: 'passenger life'.obs,
        details:
            'portfolio/blog web application for ui/ux designer, Ms. Aayushi Shrestha.'
                .obs,
        devLang: 'flutter web'.obs,
        platform: ['web'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagUnder,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.own),
        label: 'ghar jagga'.obs,
        details: 'real estate application for Pokhara, Nepal.'.obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagWorkingOn,
          CONSTANTS.projectTagUnder,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.own),
        label: 'nepanime'.obs,
        details:
            'e-commerce mobile app for anime accessories in Pokhara, Nepal.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagWorkingOn,
          CONSTANTS.projectTagUnder,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.own),
        label: 'toda mart'.obs,
        details: 'profile website for Toda Mart, Pokhara'.obs,
        devLang: 'react'.obs,
        platform: ['web'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagUnder,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.own),
        label: 'hotel northern trails'.obs,
        details:
            'profile web site for Hotel Northern Trails located in Khahare, Lakeside, Pokhara.'
                .obs,
        devLang: 'react'.obs,
        platform: ['web'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagUnder,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.own),
        label: 'employee attendance system'.obs,
        details:
            'attendance system for employees for a company, developed as a intern project for Utsaha Advert, Pokhara.'
                .obs,
        devLang: 'vue'.obs,
        platform: ['web'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagDropped,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(AppImages.own),
        label: 'inventory management system '.obs,
        details:
            'stock/inventory management system for a company, developed as a intern project for Utsaha Advert, Pokhara.'
                .obs,
        devLang: 'vue'.obs,
        platform: ['web'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagDropped,
        ].obs),
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
