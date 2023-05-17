import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Utils/AppThemeData.dart';
import '../Controllers/MainController.dart';
import 'Utils.dart';

class FloatingNavBarDesktop extends StatelessWidget {
  const FloatingNavBarDesktop({Key? key, required this.mainController})
      : super(key: key);

  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: MouseRegion(
                onEnter: (event) => mainController.navHovered.value = 1,
                onExit: (event) => mainController.navHovered.value = 0,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 222),
                  opacity: mainController.navHovered.value,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400]!.withOpacity(0.6),
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    margin: EdgeInsets.only(bottom: 30),
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width / 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingNavBarIcons(
                          hoverID: 1,
                          iconData: Icons.home_rounded,
                          mainController: mainController,
                          isDesktop: true,
                        ),
                        FloatingNavBarIcons(
                          hoverID: 2,
                          iconData: Icons.format_list_bulleted_rounded,
                          mainController: mainController,
                          isDesktop: true,
                        ),
                        FloatingNavBarIcons(
                          hoverID: 3,
                          iconData: Icons.games_rounded,
                          mainController: mainController,
                          isDesktop: true,
                        ),
                        FloatingNavBarIcons(
                          hoverID: 4,
                          iconData: Icons.music_note_rounded,
                          mainController: mainController,
                          isDesktop: true,
                        ),
                        FloatingNavBarIcons(
                          hoverID: 5,
                          iconData: Icons.person_rounded,
                          mainController: mainController,
                          isDesktop: true,
                        ),
                        // FloatingNavBarIcons(
                        //     hoverID: 6,
                        //     iconData: Icons.email_rounded,
                        //     mainController: mainController),
                      ],
                    ),
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
        animationDuration: Duration(milliseconds: 200),
        showElevation: true,
        onItemSelected: (index) {
          mainController.navIndex.value = index;
          FunctionUtils.navigate(index + 1, mainController);
        },
        items: [
          WidgetUtils.flashyTabBarItem('home', Icons.home),
          WidgetUtils.flashyTabBarItem('code', Icons.format_list_bulleted),
          WidgetUtils.flashyTabBarItem('game', Icons.gamepad),
          WidgetUtils.flashyTabBarItem('music', Icons.music_note),
          WidgetUtils.flashyTabBarItem('social', Icons.person),
        ],
      ),
    );
  }
}

class FloatingNavBarIcons extends StatelessWidget {
  const FloatingNavBarIcons(
      {Key? key,
      required this.hoverID,
      required this.iconData,
      required this.mainController,
      required this.isDesktop})
      : super(key: key);

  final int hoverID;
  final IconData iconData;
  final MainController mainController;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MouseRegion(
        onEnter: (a) {
          mainController.navIconID.value = hoverID;
        },
        onExit: (a) {
          mainController.navIconID.value = 0;
        },
        child: AnimatedSwitcher(
            switchInCurve: Curves.bounceInOut,
            switchOutCurve: Curves.bounceInOut,
            duration: const Duration(milliseconds: 222),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: iconWidget(mainController.navIconID.value, isDesktop)),
      ),
    );
  }

  Widget iconWidget(int navID, bool isDesktop) {
    return (navID != 0 && navID == hoverID)
        ? Padding(
            padding: const EdgeInsets.all(0.0),
            child: IconButton(
                icon: Icon(
                  iconData,
                  color: (isDesktop)
                      ? Colors.white70
                      : AppThemeData.appThemeData.primaryColor,
                ),
                iconSize: 24,
                onPressed: () {
                  FunctionUtils.navigate(navID, mainController);
                }),
          )
        : IconButton(
            icon: WidgetUtils.bulletineIcon(isDesktop),
            iconSize: 12,
            onPressed: () {
              FunctionUtils.navigate(navID, mainController);
            });
  }
}
