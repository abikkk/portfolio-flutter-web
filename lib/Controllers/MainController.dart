import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  RxBool isDark = true.obs;

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
          // Color.fromRGBO(93, 147, 247, 1),
          Color.fromRGBO(5, 111, 160, 1),
          Color.fromRGBO(12, 181, 248, 1),
        ],
        [
          // Color.fromRGBO(12, 181, 248, 1),
          Color.fromRGBO(14, 180, 116, 1),
          Color.fromRGBO(124, 238, 143, 1),
        ],
        [
          // Color.fromRGBO(124, 238, 143, 1),
          Color.fromRGBO(197, 197, 197, 1),
          Color.fromRGBO(180, 180, 180, 1),
        ],
        [
          // Color.fromRGBO(180, 180, 180, 1),
          Color.fromRGBO(235, 94, 29, 1),
          Color.fromRGBO(224, 118, 85, 1),
        ],
        [
          // Color.fromRGBO(224, 118, 85, 1),
          Color.fromRGBO(109, 235, 84, 1),
          Color.fromRGBO(58, 204, 14, 1),
        ],
        [
          Color.fromRGBO(58, 204, 14, 1),
          Color.fromRGBO(12, 181, 248, 1),
          // Color.fromRGBO(93, 147, 247, 1),
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
}
