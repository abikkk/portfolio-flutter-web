import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/MainController.dart';
import 'UiUtils.dart';

class FloatingNavBarHori extends StatelessWidget {
  const FloatingNavBarHori({Key? key, required this.mainController})
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
                        borderRadius:
                            BorderRadius.all(Radius.circular(24))),
                    margin: EdgeInsets.only(bottom: 30),
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width / 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingNavIcons(
                            hoverID: 1,
                            iconData: Icons.home_rounded,
                            mainController: mainController),
                        FloatingNavIcons(
                            hoverID: 2,
                            iconData: Icons.list_rounded,
                            mainController: mainController),
                        FloatingNavIcons(
                            hoverID: 3,
                            iconData: Icons.games_rounded,
                            mainController: mainController),
                        FloatingNavIcons(
                            hoverID: 4,
                            iconData: Icons.music_note_rounded,
                            mainController: mainController),
                        FloatingNavIcons(
                            hoverID: 5,
                            iconData: Icons.person_rounded,
                            mainController: mainController),
                        // FloatingNavIcons(
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

class FloatingNavBarVert extends StatelessWidget {
  const FloatingNavBarVert({Key? key, required this.mainController})
      : super(key: key);

  final MainController mainController;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    VerticalNavIcons(
                        iconID: 1,
                        iconData: Icons.home_rounded,
                        mainController: mainController),
                    VerticalNavIcons(
                        iconID: 2,
                        iconData: Icons.list_rounded,
                        mainController: mainController),
                    VerticalNavIcons(
                        iconID: 3,
                        iconData: Icons.games_rounded,
                        mainController: mainController),
                    VerticalNavIcons(
                        iconID: 4,
                        iconData: Icons.music_note_rounded,
                        mainController: mainController),
                    VerticalNavIcons(
                        iconID: 5,
                        iconData: Icons.person_rounded,
                        mainController: mainController),
                    VerticalNavIcons(
                        iconID: 6,
                        iconData: Icons.email_rounded,
                        mainController: mainController),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class VerticalNavIcons extends StatelessWidget {
  const VerticalNavIcons(
      {Key? key,
      required this.iconID,
      required this.iconData,
      required this.mainController})
      : super(key: key);

  final int iconID;
  final IconData iconData;
  final MainController mainController;
  @override
  Widget build(BuildContext context) {
    return (iconID != 0 && mainController.navIndex == iconID)
        ? Padding(
            padding: const EdgeInsets.all(0.0),
            child: IconButton(
                icon: Icon(
                  iconData,
                  color: Colors.black,
                ),
                iconSize: 24,
                onPressed: () {
                  UiUtils.navigate(iconID, mainController);
                }),
          )
        : IconButton(
            icon: WidgetUtils.bulletineIcon(),
            iconSize: 12,
            onPressed: () {
              UiUtils.navigate(iconID, mainController);
            });
  }
}

class FloatingNavIcons extends StatelessWidget {
  const FloatingNavIcons(
      {Key? key,
      required this.hoverID,
      required this.iconData,
      required this.mainController})
      : super(key: key);

  final int hoverID;
  final IconData iconData;
  final MainController mainController;

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
            child: iconWidget(mainController.navIconID.value)),
      ),
    );
  }

  Widget iconWidget(int navID) {
    return (navID != 0 && navID == hoverID)
        ? Padding(
            padding: const EdgeInsets.all(0.0),
            child: IconButton(
                icon: Icon(
                  iconData,
                  color: Colors.white70,
                ),
                iconSize: 24,
                onPressed: () {
                  UiUtils.navigate(navID, mainController);
                }),
          )
        : IconButton(
            icon: WidgetUtils.bulletineIcon(),
            iconSize: 12,
            onPressed: () {
              UiUtils.navigate(navID, mainController);
            });
  }
}
