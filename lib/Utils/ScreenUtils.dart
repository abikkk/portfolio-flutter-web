import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Controllers/CodingController.dart';
import 'package:my_porfolio/Controllers/GamingController.dart';
import 'package:my_porfolio/Controllers/MainController.dart';
import 'package:my_porfolio/Utils/AppThemeData.dart';
import 'package:my_porfolio/Utils/ConstantsImages.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';

class Screens {
  static Widget mobileLayout(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    return SingleChildScrollView(
      child: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
              color: mainController.isDark.value
                  ? Colors.grey.shade300.withOpacity(0.3)
                  : Colors.grey.shade300.withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 330,
          child: Column(
            spacing: 15,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).width / 1.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImagesConstants.own),
                      fit: BoxFit.cover,
                    ),
                    color: mainController.isDark.value
                        ? Colors.grey.withOpacity(0.1)
                        : Colors.grey.shade300.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Text(
                    'flutter developer',
                    style: TextStyle(
                      color: mainController.isDark.value ? Colors.white : null,
                    ),
                  ),
                ),
              ),
              Divider(
                indent: 30,
                endIndent: 30,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300.withOpacity(0.3),
                    child: Icon(
                      Icons.mail_outline,
                      color: mainController.isDark.value ? Colors.white : null,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => Clipboard.setData(
                        ClipboardData(text: "abikvaidhya@gmail.com")),
                    child: Text(
                      'abikvaidhya@gmail.com',
                      style: TextStyle(
                        color:
                            mainController.isDark.value ? Colors.white : null,
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: "+977-986-908-0265"));
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300.withOpacity(0.3),
                      child: Icon(
                        Icons.phone_iphone_rounded,
                        color:
                            mainController.isDark.value ? Colors.white : null,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '+977-986-908-0265',
                      style: TextStyle(
                        color:
                            mainController.isDark.value ? Colors.white : null,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300.withOpacity(0.3),
                    child: Icon(
                      Icons.pin_drop,
                      color: mainController.isDark.value ? Colors.white : null,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Kathmandu, Nepal',
                    style: TextStyle(
                      color: mainController.isDark.value ? Colors.white : null,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300.withOpacity(0.3),
                    child: Icon(
                      Icons.book,
                      color: mainController.isDark.value ? Colors.white : null,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'Herald International College',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color:
                            mainController.isDark.value ? Colors.white : null,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget HomeContainer(
      {required BuildContext context,
      required MainController mainController,
      required bool isDesktop}) {
    return (isDesktop)
        ? Widgets.customShadowBox(
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                  label: 'about me',
                                  id: 0,
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Widgets.subtitleTexts(
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
      {required BuildContext context, required bool isDesktop}) {
    MainController mainController = Get.find<MainController>();

    return Stack(
      children: [
        Column(
          children: [
            Expanded(
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
                    isDesktop: isDesktop,
                  ),
                  Widgets.FlutterDetails(
                    isDesktop: isDesktop,
                  ),
                  Widgets.ReactDetails(
                    isDesktop: isDesktop,
                  ),
                  Widgets.VueDetails(
                    isDesktop: isDesktop,
                  ),
                  // if (isDesktop)
                  Widgets.ProjectDetails(isDesktop: isDesktop)
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
                  // for (int i = 0; i < 2; i++) {
                  //   if (mainController.codingController.page!.round() != i + 1)
                  //     codingController.codingMorphButtons[i].isFocused.value =
                  //         false;
                  //   else
                  //     codingController.codingMorphButtons[i].isFocused.value =
                  //         true;
                  // }

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
              () => Widgets.desktopScrollButton(mainController.codingController,
                  mainController.isCodeScrollDown),
            ),
          ),
      ],
    );
  }

  static Widget GamingContainer(
      {required BuildContext context, required bool isDesktop}) {
    MainController mainController = Get.find<MainController>();
    GamingController gamingController = Get.find<GamingController>();

    return Column(
      children: [
        Expanded(
          child: SizedBox(
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
                    physics: isDesktop
                        ? NeverScrollableScrollPhysics()
                        : ClampingScrollPhysics(),
                    onPageChanged: (event) {
                      for (int i = 0; i < 3; i++) {
                        if (mainController.streamController.page!.round() != i)
                          gamingController
                              .streamMorphButtons[i].isFocused.value = false;
                        else
                          gamingController
                              .streamMorphButtons[i].isFocused.value = true;
                      }

                      mainController.gamingIndex.value =
                          mainController.streamController.page!.round();
                    },
                    children: [
                      Widgets.YoutubeDetails(
                        context: context,
                        isDesktop: isDesktop,
                      ),
                      Widgets.TwitchDetails(
                        context: context,
                        isDesktop: isDesktop,
                      ),
                      Widgets.DiscordDetails(
                        context: context,
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
                        Widgets.streamMorphButtons(context, 0),
                        Widgets.streamMorphButtons(context, 1),
                        Widgets.streamMorphButtons(context, 2),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
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
              Widgets.musicMorphButtons(context, 0, isDesktop: isDesktop),
              Widgets.musicMorphButtons(context, 1, isDesktop: isDesktop),
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
                  Widgets.socialMorphButtons(context, 0, isDesktop: isDesktop),
                  Widgets.socialMorphButtons(context, 1, isDesktop: isDesktop),
                ],
              ),
              Flex(
                direction: !isDesktop ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: isDesktop
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  Widgets.socialMorphButtons(context, 2, isDesktop: isDesktop),
                  Widgets.socialMorphButtons(context, 3, isDesktop: isDesktop),
                ],
              ),
              Flex(
                direction: !isDesktop ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: isDesktop
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  Widgets.codingMorphButtons(context, 3, isDesktop: isDesktop),
                  Widgets.codingMorphButtons(context, 4, isDesktop: isDesktop),
                ],
              ),
              if (isDesktop)
                Flex(
                  direction: !isDesktop ? Axis.horizontal : Axis.vertical,
                  mainAxisAlignment: isDesktop
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Widgets.codingMorphButtons(context, 5,
                        isDesktop: isDesktop),
                    Widgets.streamMorphButtons(context, 2,
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
