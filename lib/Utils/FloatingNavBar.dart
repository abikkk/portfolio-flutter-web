import 'dart:ui';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '../Controllers/MainController.dart';
import 'FunctionUtils.dart';

class FloatingNavBarDesktop extends StatelessWidget {
  const FloatingNavBarDesktop({Key? key, required this.mainController})
      : super(key: key);

  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        // margin: EdgeInsets.only(right: 30),
        height: MediaQuery.of(context).size.height,
        duration: Duration(milliseconds: 111),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 4, child: SizedBox()),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MouseRegion(
                  onEnter: (event) => mainController.navHovered.value = 1,
                  onExit: (event) => mainController.navHovered.value = 0,
                  child: Stack(
                    children: [
                      // frosted glass backdrop
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX:
                                mainController.navHovered.value == 1 ? 6 : 2,
                            sigmaY:
                                mainController.navHovered.value == 1 ? 6 : 2,
                          ),
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 111),
                              height:
                                  // mainController.navHovered.value == 1
                                  //     ?
                                  MediaQuery.of(context).size.height / 12
                              // :MediaQuery.of(context).size.height / 24
                              ,
                              width:
                                  // mainController.navHovered.value == 1
                                  //     ?
                                  MediaQuery.of(context).size.width / 5.5
                              // : MediaQuery.of(context).size.width / 6,
                              ),
                        ),
                      ),

                      // navbar content
                      AnimatedContainer(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300.withOpacity(
                                mainController.navHovered.value == 1
                                    ? 0.3
                                    : 0.1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        margin: EdgeInsets.only(bottom: 30),
                        height:
                            // mainController.navHovered.value == 1
                            //     ?
                            MediaQuery.of(context).size.height / 12
                        // :MediaQuery.of(context).size.height / 24
                        ,
                        width:
                            // mainController.navHovered.value == 1
                            //     ?
                            MediaQuery.of(context).size.width / 5.5
                        // : MediaQuery.of(context).size.width / 6
                        ,
                        duration: Duration(milliseconds: 111),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // FloatingNavBarIcons(
                            //   hoverID: 1,
                            //   iconData: Icons.home_rounded,
                            //   mainController: mainController,
                            //   // isDesktop: true,
                            // ),
                            FloatingNavBarIcons(
                              hoverID: 2,
                              iconData: Icons.format_list_bulleted_rounded,
                              mainController: mainController,
                              // isDesktop: true,
                            ),
                            FloatingNavBarIcons(
                              hoverID: 3,
                              iconData: Icons.games_rounded,
                              mainController: mainController,
                              // isDesktop: true,
                            ),
                            FloatingNavBarIcons(
                              hoverID: 4,
                              iconData: Icons.music_note_rounded,
                              mainController: mainController,
                              // isDesktop: true,
                            ),
                            FloatingNavBarIcons(
                              hoverID: 5,
                              iconData: Icons.person_rounded,
                              mainController: mainController,
                              // isDesktop: true,
                            ),
                            // FloatingNavBarIcons(
                            //     hoverID: 6,
                            //     iconData: Icons.email_rounded,
                            //     mainController: mainController),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        // ),
      ),
    );
  }
}

class FloatingNavBar extends StatelessWidget {
  const FloatingNavBar({Key? key, required this.mainController})
      : super(key: key);

  final MainController mainController;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FlashyTabBar(
        selectedIndex: mainController.navIndex.value,
        animationDuration: Duration(milliseconds: 111),
        showElevation: true,
        onItemSelected: (index) {
          mainController.navIndex.value = index;
          Functions.navigate(
              index + 1, mainController.pageController, mainController);
        },
        items: [
          Widgets.flashyTabBarItem('home', Icons.home),
          Widgets.flashyTabBarItem('code', Icons.format_list_bulleted),
          Widgets.flashyTabBarItem('game', Icons.gamepad),
          Widgets.flashyTabBarItem('music', Icons.music_note),
          Widgets.flashyTabBarItem('social', Icons.person),
        ],
      ),
    );
  }
}

class FloatingNavBarIcons extends StatelessWidget {
  const FloatingNavBarIcons({
    Key? key,
    required this.hoverID,
    required this.iconData,
    required this.mainController,
  }) : super(key: key);

  final int hoverID;
  final IconData iconData;
  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPadding(
        padding: EdgeInsets.symmetric(
            horizontal: (mainController.navHovered.value == 1) ? 15 : 0.0),
        duration: Duration(milliseconds: 111),
        child: MouseRegion(
          onEnter: (a) {
            mainController.navIconID.value = hoverID;
          },
          onExit: (a) {
            mainController.navIconID.value = 0;
          },
          child: AnimatedSwitcher(
              switchInCurve: Curves.bounceInOut,
              switchOutCurve: Curves.bounceInOut,
              duration: const Duration(milliseconds: 111),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: iconWidget(mainController.navIconID.value)),
        ),
      ),
    );
  }

  Widget iconWidget(int navID) {
    return (navID != 0 && navID == hoverID)
        ? SimpleShadow(
            child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    iconData,
                    color: mainController.isDark.value
                        ? Colors.white70
                        : Colors.black87,
                    size: 24,
                  ),
                ),
                onTap: () {
                  Functions.navigate(
                      navID, mainController.pageController, mainController);
                }),
          )
        // : Widgets.bulletineIcon(true,
        //     iconSize: (mainController.navHovered == 0) ? 5 : 7);
        : IconButton(
            icon: Widgets.bulletineIcon(true,
                iconColor: mainController.isDark.value
                    ? Colors.white54
                    : Colors.black45),
            iconSize: (mainController.navHovered == 0) ? 5 : 8,
            onPressed: () {
              Functions.navigate(
                  navID, mainController.pageController, mainController);
            });
  }
}
