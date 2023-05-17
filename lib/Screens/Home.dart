import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../Controllers/MainController.dart';
import '../Utils/FloatingNavBar.dart';
import '../Utils/Utils.dart';

class HomeContainer extends StatelessWidget {
  HomeContainer({Key? key}) : super(key: key);
  final MainController mainController = MainController();

  double bg = 0.0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
      return SafeArea(
        child: Scaffold(
          body: NotificationListener<UserScrollNotification>(
            onNotification: (notif) {
              if (notif.direction == ScrollDirection.forward &&
                  sizingInformation.deviceScreenType !=
                      DeviceScreenType.desktop) {
                mainController.scrollBtn.value = 1.0;
              } else if (notif.direction == ScrollDirection.reverse &&
                  sizingInformation.deviceScreenType !=
                      DeviceScreenType.desktop) {
                mainController.scrollBtn.value = 0.0;
              }
              return false;
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  PageView(
                    onPageChanged: (value) {
                      if (mainController.codingIndex.value > 0) {
                        Functions.navigate(mainController.codingIndex.value + 1,
                            mainController.codingController, mainController);
                      }

                      if (mainController.gamingIndex.value > 0) {
                        Functions.navigate(mainController.gamingIndex.value + 1,
                            mainController.streamController, mainController);
                      }
                    },
                    physics: BouncingScrollPhysics(),
                    pageSnapping: sizingInformation.deviceScreenType ==
                            DeviceScreenType.mobile
                        ? false
                        : true,
                    allowImplicitScrolling:
                        sizingInformation.deviceScreenType ==
                                DeviceScreenType.desktop
                            ? true
                            : false,
                    scrollDirection: sizingInformation.deviceScreenType ==
                            DeviceScreenType.desktop
                        ? Axis.horizontal
                        : Axis.vertical,
                    children: [
                      Screens.HomeContainer(
                        context: context,
                        mainController: mainController,
                        isDesktop: sizingInformation.deviceScreenType ==
                            DeviceScreenType.desktop,
                      ),
                      Screens.CodingContainer(
                          context: context,
                          mainController: mainController,
                          isDesktop: sizingInformation.deviceScreenType ==
                              DeviceScreenType.desktop),
                      Screens.GamingContainer(
                          context: context,
                          mainController: mainController,
                          isDesktop: sizingInformation.deviceScreenType ==
                              DeviceScreenType.desktop),
                      Screens.MusicContainer(
                        context: context,
                        mainController: mainController,
                        isDesktop: sizingInformation.deviceScreenType ==
                            DeviceScreenType.desktop,
                      ),
                      Screens.SocialsContainer(
                        context: context,
                        mainController: mainController,
                        isDesktop: sizingInformation.deviceScreenType ==
                            DeviceScreenType.desktop,
                      ),
                    ],
                    controller: mainController.pageController,
                  ),
                  if (sizingInformation.deviceScreenType ==
                      DeviceScreenType.desktop)
                    FloatingNavBarDesktop(
                      mainController: mainController,
                    )
                ],
              ),
            ),
          ),
          floatingActionButton:
              (sizingInformation.deviceScreenType != DeviceScreenType.desktop)
                  ? Widgets.scrollButton(mainController)
                  : null,
        ),
      );
    });
  }
}
