import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Screens/Home.dart';

import '../Controllers/main_controller.dart';
import '../helpers/page_router.dart';

class FloatingNavBar extends StatefulWidget {
  const FloatingNavBar({Key? key, required this.mainController})
      : super(key: key);

  final MainController mainController;
  @override
  State<FloatingNavBar> createState() => _FloatingNavBarState();
}

class _FloatingNavBarState extends State<FloatingNavBar> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MouseRegion(
              onEnter: (event) =>
                  //  setState(() {
                  widget.mainController.hoverID.value = 1,
              // }),
              onExit: (event) =>
                  // setState(() {
                  widget.mainController.hoverID.value = 0,
              // }),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 222),
                opacity: widget.mainController.navHovered.value,
                child: Container(
                  height: MediaQuery.of(context).size.height / 7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NavIcons(hoverID: 1, iconData: Icons.home_rounded),
                      NavIcons(hoverID: 2, iconData: Icons.list_rounded),
                      NavIcons(hoverID: 3, iconData: Icons.games_rounded),
                      NavIcons(hoverID: 4, iconData: Icons.music_note_rounded),
                      NavIcons(hoverID: 5, iconData: Icons.person_rounded),
                      NavIcons(hoverID: 6, iconData: Icons.email_rounded),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NavIcons extends StatefulWidget {
  const NavIcons({Key? key, required this.hoverID, required this.iconData})
      : super(key: key);

  final int hoverID;
  final IconData iconData;

  @override
  State<NavIcons> createState() => _NavIconsState();
}

class _NavIconsState extends State<NavIcons> {
  double id = 0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (a) {
          setState(() {
            id = 1;
          });
        },
        onExit: (a) {
          setState(() {
            id = 0;
          });
        },
        child: AnimatedSwitcher(
          switchInCurve: Curves.bounceInOut,
          switchOutCurve: Curves.bounceInOut,
          duration: const Duration(milliseconds: 222),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          // child: iconWidget(int.parse(widget.hoverID.toString()) - 1)),
          child: iconWidget(),
        ));
  }

  Widget iconWidget() {
    return id != 0
        ? Padding(
            padding: const EdgeInsets.all(0.0),
            child: IconButton(
              icon: Icon(widget.iconData),
              iconSize: 24,
              color: Colors.white,
              onPressed: navigate(0),
            ),
          )
        : IconButton(
            icon: Icon(Icons.circle),
            iconSize: 12,
            color: Colors.white,
            onPressed: navigate(2),
          );
  }

  navigate(int navIndex) {
    PageRouter.instance.openActivity(
        context,
        HomeContainer(
          navIndex: navIndex,
        ));
  }
}
