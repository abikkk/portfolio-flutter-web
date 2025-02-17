import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Controllers/MainController.dart';
import 'package:my_porfolio/Utils/AppThemeData.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';

class Screens {
  static Widget HomeContainer(
      {required BuildContext context,
      required MainController mainController,
      required bool isDesktop}) {
    return (isDesktop)
        ? Widgets.customShadowBox(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'hi there!',
                    style: AppThemeData.appThemeData.textTheme.headlineSmall!
                        .copyWith(
                            color: mainController.isDark.value
                                ? Colors.white
                                : Colors.black),
                  ),
                  Text(
                    'abik vaidhya',
                    style: AppThemeData.appThemeData.textTheme.headlineLarge!
                        .copyWith(
                            color: mainController.isDark.value
                                ? Colors.white
                                : Colors.black),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Widgets.subtitleTexts(
                                mainController: mainController,
                                label: 'about me',
                                id: 0,
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Widgets.subtitleTexts(
                                  mainController: mainController,
                                  label: 'connect with me',
                                  id: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Widgets.customShadowBox(
                Image(
                  image: AssetImage('assets/images/logo/black_transparent.png'),
                  height: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? MediaQuery.of(context).size.height - 25
                      : null,
                  fit:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? BoxFit.cover
                          : BoxFit.fitHeight,
                ),
              ),
            ],
          );
  }

  static Widget CodingContainer(
      {required BuildContext context,
      required MainController mainController,
      required bool isDesktop}) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              // flex: 3,
              child: PageView(
                pageSnapping: isDesktop ? false : true,
                allowImplicitScrolling: isDesktop ? false : true,
                physics: isDesktop
                    ? NeverScrollableScrollPhysics()
                    : ClampingScrollPhysics(),
                scrollDirection: (isDesktop) ? Axis.vertical : Axis.horizontal,
                children: [
                  Widgets.CodingIntroDetails(
                    context: context,
                    mainController: mainController,
                    isDesktop: isDesktop,
                  ),
                  Widgets.FlutterDetails(
                    mainController: mainController,
                    isDesktop: isDesktop,
                  ),
                  Widgets.ReactDetails(
                    mainController: mainController,
                    isDesktop: isDesktop,
                  ),
                  Widgets.VueDetails(
                    mainController: mainController,
                    isDesktop: isDesktop,
                  ),
                  // if (isDesktop)
                  Widgets.ProjectDetails(
                      mainController: mainController, isDesktop: isDesktop)
                ],
                controller: mainController.codingController,
                onPageChanged: (value) {
                  // scroll up/down button icon changes
                  if (mainController.codingController.page!.round() > 0 &&
                      isDesktop) {
                    mainController.isCodeScrollDown.value = false;
                  } else {
                    mainController.isCodeScrollDown.value = true;
                  }

                  // focus for morph buttons
                  for (int i = 0; i < 3; i++) {
                    if (mainController.codingController.page!.round() != i + 1)
                      mainController.codingMorphButtons[i].isFocused.value =
                          false;
                    else
                      mainController.codingMorphButtons[i].isFocused.value =
                          true;
                  }

                  mainController.codingIndex.value =
                      mainController.codingController.page!.round();
                },
              ),
            ),
          ],
        ),

        // scroll up/down button
        if (isDesktop)
          Positioned(
            left: 30,
            bottom: 30,
            child: Obx(
              () => Widgets.desktopScrollButton(
                  mainController,
                  mainController.codingController,
                  mainController.isCodeScrollDown),
            ),
          ),
      ],
    );
  }

  static Widget GamingContainer(
      {required BuildContext context,
      required MainController mainController,
      required bool isDesktop}) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: PageView(
                  pageSnapping: isDesktop ? false : true,
                  allowImplicitScrolling: isDesktop ? false : true,
                  physics:
                      // NeverScrollableScrollPhysics(),
                      isDesktop
                          ? NeverScrollableScrollPhysics()
                          : ClampingScrollPhysics(),
                  scrollDirection:
                      (isDesktop) ? Axis.vertical : Axis.horizontal,
                  controller: mainController.gamingController,
                  onPageChanged: (value) {
                    if (mainController.gamingController.page!.round() == 1) {
                      mainController.isGameScrollDown.value = false;
                    } else {
                      mainController.isGameScrollDown.value = true;
                    }
                  },
                  children: [
                    // youtube twitch discord
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: PageView(
                              pageSnapping: isDesktop ? false : true,
                              allowImplicitScrolling: true,
                              scrollDirection:
                                  (isDesktop) ? Axis.vertical : Axis.horizontal,
                              onPageChanged: (event) {
                                for (int i = 0; i < 3; i++) {
                                  if (mainController.streamController.page!
                                          .round() !=
                                      i)
                                    mainController.streamMorphButtons[i]
                                        .isFocused.value = false;
                                  else
                                    mainController.streamMorphButtons[i]
                                        .isFocused.value = true;
                                }

                                mainController.gamingIndex.value =
                                    mainController.streamController.page!
                                        .round();
                              },
                              children: [
                                Widgets.YoutubeDetails(
                                  context: context,
                                  mainController: mainController,
                                  isDesktop: isDesktop,
                                ),
                                Widgets.TwitchDetails(
                                  context: context,
                                  mainController: mainController,
                                  isDesktop: isDesktop,
                                ),
                                Widgets.DiscordDetails(
                                  context: context,
                                  mainController: mainController,
                                  isDesktop: isDesktop,
                                ),
                              ],
                              controller: mainController.streamController,
                            ),
                          ),
                          if (isDesktop)
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Widgets.streamMorphButtons(
                                      context, mainController, 0),
                                  Widgets.streamMorphButtons(
                                      context, mainController, 1),
                                  Widgets.streamMorphButtons(
                                      context, mainController, 2),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        ),
        SizedBox.shrink()
      ],
    );
  }

  static Widget MusicContainer(
      {required BuildContext context,
      required MainController mainController,
      required bool isDesktop}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Widgets.customShadowBox(
                  Text('listen to my music',
                      style: AppThemeData.appThemeData.textTheme.headlineMedium!
                          .copyWith(
                              color: (mainController.isDark.value)
                                  ? Colors.white
                                  : Colors.black)),
                ),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Flex(
            direction:
                MediaQuery.of(context).orientation == Orientation.landscape ||
                        !isDesktop
                    ? Axis.horizontal
                    : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Widgets.musicMorphButtons(context, mainController, 0,
                  isDesktop: isDesktop),
              Widgets.musicMorphButtons(context, mainController, 1,
                  isDesktop: isDesktop),
            ],
          ),
        ),
      ],
    );
  }

  static Widget SocialsContainer(
      {required BuildContext context,
      required MainController mainController,
      required bool isDesktop}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Widgets.customShadowBox(
                  Text(
                    'connect with me',
                    style: AppThemeData.appThemeData.textTheme.headlineMedium!
                        .copyWith(
                            color: (mainController.isDark.value)
                                ? Colors.white
                                : Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: (isDesktop) ? 24 : 0,
              )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flex(
                direction: !isDesktop ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: isDesktop
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  Widgets.socialMorphButtons(context, mainController, 0,
                      isDesktop: isDesktop),
                  Widgets.socialMorphButtons(context, mainController, 1,
                      isDesktop: isDesktop),
                ],
              ),
              Flex(
                direction: !isDesktop ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: isDesktop
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  Widgets.socialMorphButtons(context, mainController, 2,
                      isDesktop: isDesktop),
                  Widgets.socialMorphButtons(context, mainController, 3,
                      isDesktop: isDesktop),
                ],
              ),
              Flex(
                direction: !isDesktop ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: isDesktop
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  Widgets.codingMorphButtons(context, mainController, 3,
                      isDesktop: isDesktop),
                  Widgets.codingMorphButtons(context, mainController, 4,
                      isDesktop: isDesktop),
                ],
              ),
              if (isDesktop)
                Flex(
                  direction: !isDesktop ? Axis.horizontal : Axis.vertical,
                  mainAxisAlignment: isDesktop
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Widgets.codingMorphButtons(context, mainController, 5,
                        isDesktop: isDesktop),
                    Widgets.streamMorphButtons(context, mainController, 2,
                        isDesktop: isDesktop, isSocials: true),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
