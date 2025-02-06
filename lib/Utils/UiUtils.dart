import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Controllers/MainController.dart';
import 'package:my_porfolio/Models/ProjectCard.dart';
import 'package:my_porfolio/Utils/AppThemeData.dart';
import 'package:my_porfolio/Utils/ConstantsImages.dart';
import 'package:my_porfolio/Utils/Utils.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Widgets {
  static Widget sideBar({required MainController mainController}) {
    return Column(
      children: [
        Container(
          height: 300,
          // width: 300,
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
        SizedBox(
          height: 15,
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
        SizedBox(
          height: 10,
        ),
        Divider(
          indent: 30,
          endIndent: 30,
        ),
        SizedBox(
          height: 5,
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
              onTap: () {},
              child: Text(
                'abikvaidhya@gmail.com',
                style: TextStyle(
                  color: mainController.isDark.value ? Colors.white : null,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade300.withOpacity(0.3),
              child: Icon(
                Icons.phone_iphone_rounded,
                color: mainController.isDark.value ? Colors.white : null,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '+977-986-908-0265',
              style: TextStyle(
                color: mainController.isDark.value ? Colors.white : null,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
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
        SizedBox(
          height: 20,
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
                  color: mainController.isDark.value ? Colors.white : null,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Future defaultDialog(String label) {
    return Get.defaultDialog(
      title: '$label',
      middleText: "i worked on $label",
      barrierDismissible: true,
      radius: 30,
      content: Text('hello world'),
      backgroundColor: Colors.grey.shade700.withOpacity(0.6),
      titleStyle: TextStyle(color: Colors.white),
      middleTextStyle: TextStyle(color: Colors.white),
    );
  }

  static Widget scrollButton(MainController mainController) {
    return Obx(
      () => AnimatedOpacity(
        opacity: mainController.scrollBtn.value,
        duration: Duration(milliseconds: 200),
        child: IconButton(
            onPressed: () {
              mainController.navHovered.value = 0.0;
              Functions.navigate(
                  0, mainController.pageController, mainController);
            },
            icon: Icon(
              Icons.arrow_drop_up_rounded,
              color: mainController.isDark.value ? Colors.white : Colors.black,
            )),
      ),
    );
  }

  static Widget bulletineIcon(bool hasColor,
      {double? iconSize, Color iconColor = Colors.white}) {
    return Icon(
      Icons.circle,
      size: iconSize,
      color: (hasColor) ? iconColor : AppThemeData.appThemeData.primaryColor,
    );
  }

  static FlashyTabBarItem flashyTabBarItem(String label, IconData iconData) {
    return FlashyTabBarItem(
      icon: Icon(iconData),
      title: Text('${label}'),
    );
  }

  static MouseRegion desktopScrollButton(MainController mainController,
      PageController pageController, RxBool scrollDown) {
    return MouseRegion(
      onEnter: (e) {
        mainController.showScrollBtn.value = 1.0;
      },
      onExit: (e) {
        mainController.showScrollBtn.value =
            (mainController.isDark.value) ? 0.6 : 0.3;
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: mainController.showScrollBtn.value,
        child: IconButton(
            onPressed: () {
              if (scrollDown.value)
                pageController.nextPage(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.fastOutSlowIn);
              else
                pageController.animateTo(pageController.initialPage.toDouble(),
                    duration: Duration(milliseconds: 200),
                    curve: Curves.fastOutSlowIn);
            },
            icon: Icon((scrollDown.value)
                ? Icons.keyboard_arrow_down_rounded
                : Icons.keyboard_arrow_up_rounded)),
      ),
    );
  }

  static Container projectCard(
      MainController mainController, ProjectCard project, Color iconColor) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Card(
        color:
            mainController.isDark.value ? Colors.white30 : Colors.grey.shade200,
        elevation: 5,
        child: GestureDetector(
          onTap: () {
            mainController.projectDetails.value =
                !mainController.projectDetails.value;
            mainController.selectedProject = project;
          },
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  child: Image(
                    // height: 100,
                    width: 100,
                    image: project.image.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      '${project.label}',
                      style: AppThemeData.appThemeData.textTheme.bodySmall!
                          .copyWith(
                              height: 1,
                              color: mainController.isDark.value
                                  ? Colors.white
                                  : Colors.black),
                      textAlign: TextAlign.start,
                      softWrap: true,
                    )),
                    bulletineIcon(true, iconColor: iconColor)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget subtitleTexts(
      {required MainController mainController,
      required int id,
      required String label}) {
    return MouseRegion(
      onEnter: (v) {
        switch (id) {
          case 0:
            mainController.subtitle_1.value = true;
            break;
          case 3:
            mainController.subtitle_2.value = true;
            break;
        }
      },
      onExit: (v) {
        switch (id) {
          case 0:
            mainController.subtitle_1.value = false;
            break;
          case 3:
            mainController.subtitle_2.value = false;
            break;
        }
      },
      child: Center(
        child: Obx(
          () => AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 111),
            style: !((id == 0)
                    ? mainController.subtitle_1.value
                    // : (id == 1)
                    //     ? mainController.subtitle_2.value
                    : mainController.subtitle_2.value)
                ? AppThemeData.appThemeData.textTheme.displaySmall!.copyWith(
                    color: mainController.isDark.value
                        ? Colors.white
                        : Colors.black)
                : AppThemeData.appThemeData.textTheme.titleSmall!.copyWith(
                    color: mainController.isDark.value
                        ? Colors.white
                        : Colors.black),
            child: GestureDetector(
              // hoverColor: Colors.transparent,
              onTap: () {
                Functions.navigate(
                    id + 2, mainController.pageController, mainController);
              },
              child: Text(
                '${label}',
              ),
            ),
          ),
        ),
      ),
    );
  }

  static SimpleShadow customShadowBox(Widget child,
      {double opacity = 0.6, double sigma = 4}) {
    return SimpleShadow(
      opacity: opacity,
      offset: Offset(8.0, 6.0),
      sigma: sigma,
      child: child,
    );
  }

// coding
  static Widget CodingIntroDetails(
      {required BuildContext context,
      required MainController mainController,
      required bool isDesktop}) {
    return Padding(
      padding: EdgeInsets.all((isDesktop) ? 44.0 : 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Widgets.customShadowBox(
                      Text(
                        'portfolio',
                        style: AppThemeData
                            .appThemeData.textTheme.headlineMedium!
                            .copyWith(
                                color: mainController.isDark.value
                                    ? Colors.white
                                    : Colors.black),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Widgets.customShadowBox(
                          Text(
                            'i am a flutter developer .\ni have experiences with frontend development for 4+ years now.\nother skillsets that i have are as follows:\ GitHub/GitLab, JS, NPM, Figma',
                            softWrap: true,
                            style: AppThemeData
                                .appThemeData.textTheme.bodyMedium!
                                .copyWith(
                                    color: mainController.isDark.value
                                        ? Colors.white
                                        : Colors.black),
                            maxLines: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isDesktop)
            Expanded(
              flex: 2,
              child: Wrap(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Widgets.codingMorphButtons(context, mainController, 0,
                      isDesktop: isDesktop),
                  Widgets.codingMorphButtons(context, mainController, 1,
                      isDesktop: isDesktop),
                  Widgets.codingMorphButtons(context, mainController, 2,
                      isDesktop: isDesktop),
                  Widgets.codingMorphButtons(context, mainController, 3,
                      isDesktop: isDesktop),
                  Widgets.codingMorphButtons(context, mainController, 4,
                      isDesktop: isDesktop),
                  Widgets.codingMorphButtons(context, mainController, 5,
                      isDesktop: isDesktop),
                  Widgets.codingMorphButtons(context, mainController, 6,
                      isDesktop: isDesktop),
                ],
              ),
            ),
        ],
      ),
    );
  }

  static Widget FlutterDetails(
      {required MainController mainController, required bool isDesktop}) {
    return Padding(
      padding: const EdgeInsets.all(44.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Widgets.customShadowBox(
                Text(
                  'flutter',
                  style: AppThemeData.appThemeData.textTheme.headlineMedium!
                      .copyWith(
                          color: mainController.isDark.value
                              ? Colors.white
                              : Colors.black),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: Widgets.customShadowBox(
                    Text(
                      'i am currently working as a senior flutter developer for a private software solution company in Kathmandu, involved in multiple local as well as international projects for our clients\n* notable examples of projects I have worked on:',
                      maxLines: 8,
                      style: AppThemeData.appThemeData.textTheme.bodyMedium!
                          .copyWith(
                              color: mainController.isDark.value
                                  ? Colors.white
                                  : Colors.black),
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: Widgets.customShadowBox(
                    Text(
                      '> Wholistic Minds which is available on Apple App Store as well as Google Play Store',
                      maxLines: 2,
                      style: AppThemeData.appThemeData.textTheme.bodyMedium!
                          .copyWith(
                              color: mainController.isDark.value
                                  ? Colors.white
                                  : Colors.black),
                      softWrap: true,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Widgets.customShadowBox(
                  GestureDetector(
                      onTap: () {
                        Functions.openLink('wm');
                      },
                      child: Icon(Icons.link,
                          color: mainController.isDark.value
                              ? Colors.white
                              : Colors.black)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: Widgets.customShadowBox(
                    Text(
                      '> My Hotel and Home which is available on Google Play Store',
                      maxLines: 2,
                      style: AppThemeData.appThemeData.textTheme.bodyMedium!
                          .copyWith(
                              color: mainController.isDark.value
                                  ? Colors.white
                                  : Colors.black),
                      softWrap: true,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Widgets.customShadowBox(
                  GestureDetector(
                      onTap: () {
                        Functions.openLink('hnh');
                      },
                      child: Icon(Icons.link,
                          color: mainController.isDark.value
                              ? Colors.white
                              : Colors.black)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: Widgets.customShadowBox(
                    Text(
                      '> Pokhara Food Delivery which is availabe both on Google Play Store.',
                      maxLines: 2,
                      style: AppThemeData.appThemeData.textTheme.bodyMedium!
                          .copyWith(
                              color: mainController.isDark.value
                                  ? Colors.white
                                  : Colors.black),
                      softWrap: true,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Widgets.customShadowBox(
                  GestureDetector(
                      onTap: () {
                        Functions.openLink('pfd');
                      },
                      child: Icon(Icons.link,
                          color: mainController.isDark.value
                              ? Colors.white
                              : Colors.black)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget ReactDetails(
      {required MainController mainController, required bool isDesktop}) {
    return Padding(
      padding: EdgeInsets.all((isDesktop) ? 44.0 : 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Widgets.customShadowBox(
                Text(
                  'react.js',
                  style: AppThemeData.appThemeData.textTheme.headlineMedium!
                      .copyWith(
                          color: mainController.isDark.value
                              ? Colors.white
                              : Colors.black),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Widgets.customShadowBox(
                        Text(
                          'i worked as a freelancer for 8 months. my projects ranges as follows:',
                          softWrap: true,
                          style: AppThemeData.appThemeData.textTheme.bodyMedium!
                              .copyWith(
                                  color: mainController.isDark.value
                                      ? Colors.white
                                      : Colors.black),
                          maxLines: 4,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Widgets.customShadowBox(
                      Text(
                        ' - portfolio websites\n - cafe website\n - e-commerce\n - warehouse/inventory management',
                        softWrap: true,
                        style: AppThemeData.appThemeData.textTheme.bodyMedium!
                            .copyWith(
                                color: mainController.isDark.value
                                    ? Colors.white
                                    : Colors.black),
                        maxLines: 8,
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget VueDetails(
      {required MainController mainController, required bool isDesktop}) {
    return Padding(
      padding: EdgeInsets.all((isDesktop) ? 44.0 : 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Widgets.customShadowBox(
                Text(
                  'vue.js',
                  style: AppThemeData.appThemeData.textTheme.headlineMedium!
                      .copyWith(
                          color: mainController.isDark.value
                              ? Colors.white
                              : Colors.black),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: Widgets.customShadowBox(
                    Text(
                      'i worked as an intern for a private company in Pokhara as their junior frontend developer for 6 months. i was involved in development of employee record management system and attendance management system. i have my own portfolio website under development as well.',
                      maxLines: 8,
                      style: AppThemeData.appThemeData.textTheme.bodyMedium!
                          .copyWith(
                              color: mainController.isDark.value
                                  ? Colors.white
                                  : Colors.black),
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget ProjectDetails(
      {required MainController mainController, required bool isDesktop}) {
    return Padding(
      padding: EdgeInsets.all((isDesktop) ? 44.0 : 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Widgets.customShadowBox(
                Text(
                  'projects',
                  style: AppThemeData.appThemeData.textTheme.headlineMedium!
                      .copyWith(
                          color: mainController.isDark.value
                              ? Colors.white
                              : Colors.black),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: (mainController.projectDetails.value)
                            ? projectDetailSection(mainController, isDesktop)
                            : GridView(
                                shrinkWrap: true,
                                padding: EdgeInsets.all(10),
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: (isDesktop) ? 6 : 2),
                                children: [
                                  for (ProjectCard project
                                      in mainController.projects)
                                    Widgets.projectCard(
                                        mainController,
                                        project,
                                        project.devLang.value == 'vue'
                                            ? Colors.green
                                            : project.devLang.value == 'react'
                                                ? Color.fromARGB(
                                                    255, 3, 117, 248)
                                                : Color.fromARGB(
                                                    255, 9, 74, 187))
                                ],
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Padding projectDetailSection(
      MainController mainController, bool isDesktop) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: customShadowBox(
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      mainController.projectDetails.value =
                          !mainController.projectDetails.value;
                    },
                    child: Icon(Icons.arrow_back_ios)),
                Expanded(
                  child: Center(
                    child: Text(
                      mainController.selectedProject.label.value,
                      style: AppThemeData.appThemeData.textTheme.displayLarge,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    mainController.selectedProject.details.value,
                    softWrap: true,
                    maxLines: 8,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text('developed using:'),
                ),
                Expanded(
                    flex: (isDesktop) ? 3 : 1,
                    child: Text(mainController.selectedProject.devLang.value))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text('platforms:'),
                ),
                Expanded(
                    flex: (isDesktop) ? 3 : 1,
                    child: Text(
                        mainController.selectedProject.platform.toString()))
              ],
            )
          ],
        ),
      ),
    );
  }

// gaming
  static Widget YoutubeDetails(
      {required BuildContext context,
      required MainController mainController,
      required bool isDesktop}) {
    return Padding(
      padding: const EdgeInsets.all(44.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Widgets.StreamLinkButtons(
                mainController,
                0,
                'youtube',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Widgets.customShadowBox(
                    Text(
                      'i upload clips from my gameplays and live streams to my youtube channel. drop by and show some love if you can. thanks!',
                      style: AppThemeData.appThemeData.textTheme.bodyMedium!
                          .copyWith(
                              color: mainController.isDark.value
                                  ? Colors.white
                                  : Colors.black),
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          (isDesktop)
              ? SizedBox()
              : Widgets.streamMorphButtons(context, mainController, 0,
                  isDesktop: false)
        ],
      ),
    );
  }

  static Widget TwitchDetails(
      {required BuildContext context,
      required MainController mainController,
      required bool isDesktop}) {
    return Padding(
      padding: const EdgeInsets.all(44.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Widgets.StreamLinkButtons(
                mainController,
                1,
                'twitch',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Widgets.customShadowBox(
                    Text(
                      'i try to stream regularly, as much as i can. i normally just stream for myself. my live streams include games like valorant, apex legends, gta v online, singing sessions, podcasts and coding streams.\nyou can check out my twitch.',
                      style: AppThemeData.appThemeData.textTheme.bodyMedium!
                          .copyWith(
                              color: mainController.isDark.value
                                  ? Colors.white
                                  : Colors.black),
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          (isDesktop)
              ? SizedBox()
              : Widgets.streamMorphButtons(context, mainController, 1,
                  isDesktop: false)
        ],
      ),
    );
  }

  static Widget DiscordDetails(
      {required BuildContext context,
      required MainController mainController,
      required bool isDesktop}) {
    return Padding(
      padding: const EdgeInsets.all(44.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Widgets.StreamLinkButtons(
                mainController,
                2,
                'discord',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Widgets.customShadowBox(
                    Text(
                      'you can join my discord server. we can have fun together with my friends.',
                      style: AppThemeData.appThemeData.textTheme.bodyMedium!
                          .copyWith(
                              color: mainController.isDark.value
                                  ? Colors.white
                                  : Colors.black),
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          (isDesktop)
              ? SizedBox()
              : Widgets.streamMorphButtons(context, mainController, 2,
                  isDesktop: false)
        ],
      ),
    );
  }

// morph buttons
  static Widget codingMorphButtons(
      BuildContext context, MainController mainController, int buttonType,
      {bool isDesktop = true}) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.all((isDesktop) ? 15.0 : 5),
        child: MouseRegion(
          onEnter: (a) {
            mainController.codingMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .12;
            mainController.codingMorphButtons[buttonType].showDetails.value =
                true;
          },
          onExit: (a) {
            mainController.codingMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .10;
            mainController.codingMorphButtons[buttonType].showDetails.value =
                false;
          },
          child: InkWell(
            onTap: () async {
              if (buttonType < 3 || buttonType == 6) {
                mainController.codingMorphButtons[buttonType].isClicked.value =
                    !mainController
                        .codingMorphButtons[buttonType].isClicked.value;

                mainController.codingController.animateToPage((buttonType + 1),
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut);

                // delay
                Future.delayed(const Duration(milliseconds: 150), () {
                  mainController
                          .codingMorphButtons[buttonType].isClicked.value =
                      !mainController
                          .codingMorphButtons[buttonType].isClicked.value;
                });
              } else {
                Functions.openLink(
                    mainController.codingMorphButtons[buttonType].link.value);
              }
            },
            child: Wrap(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                      color: (mainController.isDark.value)
                          ? Colors.black
                          : Colors.white,
                      gradient: (mainController.codingMorphButtons[buttonType]
                                  .showDetails.value ||
                              mainController.codingMorphButtons[buttonType]
                                  .isFocused.value)
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
                                  offset: (mainController.isDark.value)
                                      ? Offset(2, 2)
                                      : Offset(4, 4),
                                  blurRadius:
                                      mainController.isDark.value ? 5 : 15,
                                  spreadRadius: 1),
                              BoxShadow(
                                  color: Colors.white,
                                  offset: (mainController.isDark.value)
                                      ? Offset(-2, -2)
                                      : Offset(-4, -4),
                                  blurRadius:
                                      mainController.isDark.value ? 5 : 15,
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
                          : MediaQuery.of(context).size.height * .10,
                      duration: Duration(milliseconds: 150),
                      child: mainController
                              .codingMorphButtons[buttonType].showDetails.value
                          ? (mainController.isDark.value)
                              ? mainController
                                  .codingMorphButtons[buttonType].image_hovered
                              : mainController
                                  .codingMorphButtons[buttonType].image
                          : (mainController.isDark.value)
                              ? mainController
                                  .codingMorphButtons[buttonType].image_hovered
                              : mainController
                                  .codingMorphButtons[buttonType].image,
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
                MediaQuery.of(context).size.height * .12;
            mainController.gamingMorphButtons[buttonType].showDetails.value =
                true;
          },
          onExit: (a) {
            mainController.gamingMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .10;
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

                Functions.openLink(
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
                          : MediaQuery.of(context).size.height * .10,
                      duration: Duration(milliseconds: 150),
                      child: mainController
                              .gamingMorphButtons[buttonType].showDetails.value
                          ? mainController
                              .gamingMorphButtons[buttonType].image_hovered
                          : mainController.gamingMorphButtons[buttonType].image,
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
      BuildContext context, MainController mainController, int buttonType,
      {bool isDesktop = true, bool isSocials = false}) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.all((isDesktop) ? 15.0 : 5),
        child: MouseRegion(
          onEnter: (a) {
            mainController.streamMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .12;
            mainController.streamMorphButtons[buttonType].showDetails.value =
                true;
          },
          onExit: (a) {
            mainController.streamMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .10;
            mainController.streamMorphButtons[buttonType].showDetails.value =
                false;
          },
          child: InkWell(
            onTap: () async {
              if (!isSocials) {
                mainController.streamMorphButtons[buttonType].isClicked.value =
                    !mainController
                        .streamMorphButtons[buttonType].isClicked.value;

                // delay
                Future.delayed(const Duration(milliseconds: 150), () {
                  mainController
                          .streamMorphButtons[buttonType].isClicked.value =
                      !mainController
                          .streamMorphButtons[buttonType].isClicked.value;

                  if (isDesktop)
                    mainController.streamController.animateToPage(buttonType,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut);
                  else
                    Functions.openLink(mainController
                        .streamMorphButtons[buttonType].link.value);
                });
              } else {
                Functions.openLink(
                    mainController.streamMorphButtons[buttonType].link.value);
              }
            },
            child: Wrap(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                      color: (mainController.isDark.value)
                          ? Colors.black
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      gradient: (mainController.streamMorphButtons[buttonType]
                                  .showDetails.value ||
                              mainController.streamMorphButtons[buttonType]
                                      .isFocused.value &&
                                  isDesktop)
                          ? LinearGradient(
                              colors:
                                  mainController.streamGradientList[buttonType])
                          : null,
                      boxShadow: !mainController
                              .streamMorphButtons[buttonType].isClicked.value
                          ? [
                              BoxShadow(
                                  color: Colors.grey[500]!,
                                  offset: mainController.isDark.value
                                      ? Offset(2, 2)
                                      : Offset(4, 4),
                                  blurRadius:
                                      mainController.isDark.value ? 5 : 15,
                                  spreadRadius: 1),
                              BoxShadow(
                                  color: Colors.white,
                                  offset: mainController.isDark.value
                                      ? Offset(-2, -2)
                                      : Offset(-4, -4),
                                  blurRadius:
                                      mainController.isDark.value ? 5 : 15,
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
                          : MediaQuery.of(context).size.height * .10,
                      duration: Duration(milliseconds: 150),
                      child: mainController
                              .streamMorphButtons[buttonType].showDetails.value
                          ? (mainController.isDark.value)
                              ? mainController
                                  .streamMorphButtons[buttonType].image
                              : mainController
                                  .streamMorphButtons[buttonType].image_hovered
                          : (mainController.isDark.value)
                              ? mainController
                                  .streamMorphButtons[buttonType].image_hovered
                              : mainController
                                  .streamMorphButtons[buttonType].image,
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
      BuildContext context, MainController mainController, int buttonType,
      {bool isDesktop = true}) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.all((isDesktop) ? 15.0 : 5),
        child: MouseRegion(
          onEnter: (a) {
            mainController.socialMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .12;
            mainController.socialMorphButtons[buttonType].showDetails.value =
                true;
          },
          onExit: (a) {
            mainController.socialMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .10;
            mainController.socialMorphButtons[buttonType].showDetails.value =
                false;
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

                Functions.openLink(
                    mainController.socialMorphButtons[buttonType].link.value);
              });
            },
            child: Wrap(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                      color: mainController.isDark.value
                          ? Colors.black
                          : Colors.white,
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
                                  offset: mainController.isDark.value
                                      ? Offset(2, 2)
                                      : Offset(4, 4),
                                  blurRadius:
                                      mainController.isDark.value ? 5 : 15,
                                  spreadRadius: 1),
                              BoxShadow(
                                  color: Colors.white,
                                  offset: mainController.isDark.value
                                      ? Offset(-2, -2)
                                      : Offset(-4, -4),
                                  blurRadius:
                                      mainController.isDark.value ? 5 : 15,
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
                          : MediaQuery.of(context).size.height * .10,
                      duration: Duration(milliseconds: 150),
                      child: mainController
                              .socialMorphButtons[buttonType].showDetails.value
                          ? mainController.isDark.value
                              ? mainController
                                  .socialMorphButtons[buttonType].image
                              : mainController
                                  .socialMorphButtons[buttonType].image_hovered
                          : mainController.isDark.value
                              ? mainController
                                  .socialMorphButtons[buttonType].image_hovered
                              : mainController
                                  .socialMorphButtons[buttonType].image,
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
      BuildContext context, MainController mainController, int buttonType,
      {bool isDesktop = true}) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.all((isDesktop) ? 15.0 : 5),
        child: MouseRegion(
          onEnter: (a) {
            mainController.musicMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .12;
            mainController.musicMorphButtons[buttonType].showDetails.value =
                true;
          },
          onExit: (a) {
            mainController.musicMorphButtons[buttonType].scale.value =
                MediaQuery.of(context).size.height * .10;
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

                Functions.openLink(
                    mainController.musicMorphButtons[buttonType].link.value);
              });
            },
            child: Wrap(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                      color: mainController.isDark.value
                          ? Colors.black
                          : Colors.white,
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
                                  offset: mainController.isDark.value
                                      ? Offset(2, 2)
                                      : Offset(4, 4),
                                  blurRadius:
                                      mainController.isDark.value ? 5 : 15,
                                  spreadRadius: 1),
                              BoxShadow(
                                  color: Colors.white,
                                  offset: mainController.isDark.value
                                      ? Offset(-2, -2)
                                      : Offset(-4, -4),
                                  blurRadius:
                                      mainController.isDark.value ? 5 : 15,
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
                          : MediaQuery.of(context).size.height * .10,
                      duration: Duration(milliseconds: 150),
                      child: mainController
                              .musicMorphButtons[buttonType].showDetails.value
                          ? mainController.isDark.value
                              ? mainController
                                  .musicMorphButtons[buttonType].image
                              : mainController
                                  .musicMorphButtons[buttonType].image_hovered
                          : mainController.isDark.value
                              ? mainController
                                  .musicMorphButtons[buttonType].image_hovered
                              : mainController
                                  .musicMorphButtons[buttonType].image,
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
          duration: Duration(milliseconds: 111),
          padding: EdgeInsets.all(10),
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
              boxShadow: (((id == 0)
                      ? mainController.ytHover.value
                      : (id == 1)
                          ? mainController.twitchHover.value
                          : mainController.discordHover.value))
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
                  Functions.openLink('yt');
                  break;
                case 1:
                  Functions.openLink('twitch');
                  break;
                case 2:
                  Functions.openLink('discord');
                  break;
              }
            },
            label: Text('${label}',
                style: ((id == 0)
                        ? mainController.ytHover.value
                        : (id == 1)
                            ? mainController.twitchHover.value
                            : mainController.discordHover.value)
                    ? AppThemeData.appThemeData.textTheme.headlineMedium!
                        .copyWith(
                            color: (mainController.isDark.value)
                                ? Colors.white.withOpacity(0.9)
                                : Colors.white.withOpacity(0.9))
                    : AppThemeData.appThemeData.textTheme.headlineMedium!
                        .copyWith(
                            color: (mainController.isDark.value)
                                ? Colors.white.withOpacity(0.9)
                                : Colors.black.withOpacity(0.9))),
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: ((id == 0)
                      ? mainController.ytHover.value
                      : (id == 1)
                          ? mainController.twitchHover.value
                          : mainController.discordHover.value)
                  ? Colors.white.withOpacity(0.9)
                  : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  static Widget codingProgressRow(
      MainController mainController, String label, int id, double value,
      {bool isDesktop = true}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: (isDesktop) ? 10.0 : 5.0),
      child: Row(
        children: [
          Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${label} usage : ',
                  style: (isDesktop)
                      ? null
                      : AppThemeData.appThemeData.textTheme.bodySmall,
                )),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: FAProgressBar(
                direction: Axis.horizontal,
                verticalDirection: VerticalDirection.down,
                size: 24,
                backgroundColor:
                    AppThemeData.appThemeData.primaryColor.withOpacity(0.2),
                animatedDuration: Duration(milliseconds: 300),
                currentValue: value,
                formatValueFixed: 0,
                // displayText: '%',
                progressGradient:
                    LinearGradient(colors: mainController.ideGradientList[id]),
              ),
            ),
          ),
          Text(' (${value}%)')
        ],
      ),
    );
  }

  static Widget pieChart(MainController mainController, BuildContext context,
      var dataMap, String label, var gradientList,
      {bool isGradient = false, bool isDesktop = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: PieChart(
        dataMap: dataMap,
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 44,
        chartRadius: (isDesktop)
            ? MediaQuery.of(context).size.width / 7
            : MediaQuery.of(context).size.width / 3,
        initialAngleInDegree: 0,
        chartType: ChartType.disc,
        centerText: "${label}",
        legendOptions: LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.left,
            showLegends: true,
            legendShape: BoxShape.circle,
            legendTextStyle: AppThemeData.appThemeData.textTheme.bodySmall!),
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesOutside: false,
          decimalPlaces: 0,
        ),
        gradientList: (isGradient) ? gradientList : null,
      ),
    );
  }
}
