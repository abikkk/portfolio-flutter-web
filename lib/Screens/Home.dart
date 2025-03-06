import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Utils/ScreenUtils.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../Controllers/MainController.dart';
import '../Utils/FloatingNavBar.dart';
import '../Utils/FunctionUtils.dart';

class HomeContainer extends StatefulWidget {
  HomeContainer({Key? key}) : super(key: key);

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  final MainController mainController = Get.find<MainController>();

  double bg = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Functions.precacheImages(context); // pre-load images
  }

// fetches mouse pointer location
  void _updateLocation(PointerEvent details) {
    mainController.cursorX.value = details.position.dx;
    mainController.cursorY.value = details.position.dy;
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
      return SafeArea(
        child: Obx(
          () => Scaffold(
            backgroundColor:
                (mainController.isDark.value) ? Colors.black : Colors.white,
            body: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Row(
                    children: [
                      (sizingInformation.deviceScreenType ==
                              DeviceScreenType.desktop)
                          ? Expanded(
                              child: MouseRegion(
                                onHover: _updateLocation,
                                child: NotificationListener<
                                    UserScrollNotification>(
                                  onNotification: (notification) {
                                    if (notification.direction ==
                                            ScrollDirection.forward &&
                                        sizingInformation.deviceScreenType !=
                                            DeviceScreenType.desktop &&
                                        (mainController.pageController.page !=
                                                null &&
                                            mainController.pageController.page!
                                                    .round() >
                                                0)) {
                                      mainController.scrollBtn.value = 1.0;
                                    }
                                    return false;
                                  },
                                  child: Stack(
                                    children: [
                                      // site content
                                      PageView(
                                        onPageChanged: (value) {
                                          if (mainController.codingIndex.value >
                                                  0 &&
                                              sizingInformation
                                                      .deviceScreenType ==
                                                  DeviceScreenType.desktop) {
                                            Functions.navigate(
                                              mainController.codingIndex.value +
                                                  1,
                                              mainController.codingController,
                                            );
                                          }

                                          if (mainController.gamingIndex.value >
                                                  0 &&
                                              sizingInformation
                                                      .deviceScreenType ==
                                                  DeviceScreenType.desktop) {
                                            Functions.navigate(
                                              mainController.gamingIndex.value +
                                                  1,
                                              mainController.streamController,
                                            );
                                          }
                                        },
                                        physics: sizingInformation
                                                    .deviceScreenType ==
                                                DeviceScreenType.mobile
                                            ? ClampingScrollPhysics()
                                            : NeverScrollableScrollPhysics(),
                                        pageSnapping: sizingInformation
                                                    .deviceScreenType ==
                                                DeviceScreenType.mobile
                                            ? true
                                            : true,
                                        // pageSnapping: false,
                                        allowImplicitScrolling:
                                            sizingInformation
                                                        .deviceScreenType ==
                                                    DeviceScreenType.desktop
                                                ? true
                                                : false,
                                        scrollDirection: sizingInformation
                                                    .deviceScreenType ==
                                                DeviceScreenType.desktop
                                            ? Axis.horizontal
                                            : Axis.vertical,
                                        children: [
                                          // if (sizingInformation.deviceScreenType ==
                                          //     DeviceScreenType.desktop)
                                          Screens.HomeContainer(
                                            context: context,
                                            mainController: mainController,
                                            isDesktop: sizingInformation
                                                    .deviceScreenType ==
                                                DeviceScreenType.desktop,
                                          ),
                                          Screens.CodingContainer(
                                              context: context,
                                              isDesktop: sizingInformation
                                                      .deviceScreenType ==
                                                  DeviceScreenType.desktop),
                                          Screens.GamingContainer(
                                              context: context,
                                              isDesktop: sizingInformation
                                                      .deviceScreenType ==
                                                  DeviceScreenType.desktop),
                                          Screens.MusicContainer(
                                            context: context,
                                            mainController: mainController,
                                            isDesktop: sizingInformation
                                                    .deviceScreenType ==
                                                DeviceScreenType.desktop,
                                          ),
                                          Screens.SocialsContainer(
                                            context: context,
                                            mainController: mainController,
                                            isDesktop: sizingInformation
                                                    .deviceScreenType ==
                                                DeviceScreenType.desktop,
                                          ),
                                        ],
                                        controller:
                                            mainController.pageController,
                                      ),

                                      // floating nav bar
                                      if (sizingInformation.deviceScreenType ==
                                          DeviceScreenType.desktop)
                                        FloatingNavBarDesktop(),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Expanded(child: Screens.mobileLayout(context)),
                    ],
                  ),
                ),

                // dark-light theme toggle
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, right: 10),
                      child: IconButton(
                        onPressed: () =>
                            mainController.isDark(!mainController.isDark.value),
                        icon: mainController.isDark.value
                            ? Icon(Icons.light_mode)
                            : Icon(Icons.dark_mode),
                        color: mainController.isDark.value
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
            floatingActionButton:
                (sizingInformation.deviceScreenType != DeviceScreenType.desktop)
                    ? Widgets.scrollButton()
                    : null,
          ),
        ),
      );
    });
  }
}
