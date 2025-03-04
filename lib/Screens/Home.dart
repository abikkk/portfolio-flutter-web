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
            body: Row(
              children: [
                if (sizingInformation.deviceScreenType ==
                    DeviceScreenType.desktop)
                  Column(
                    children: [
                      Expanded(
                        child: Obx(
                          () => Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              decoration: BoxDecoration(
                                  color: mainController.isDark.value
                                      ? Colors.grey.shade300.withOpacity(0.3)
                                      : Colors.grey.shade300.withOpacity(0.1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              width: 330,
                              margin: EdgeInsets.all(10),
                              child: Widgets.sideBar()),
                        ),
                      ),
                    ],
                  ),
                Expanded(
                  child: MouseRegion(
                    onHover: _updateLocation,
                    child: NotificationListener<UserScrollNotification>(
                      onNotification: (notif) {
                        if (notif.direction == ScrollDirection.forward &&
                            sizingInformation.deviceScreenType !=
                                DeviceScreenType.desktop &&
                            (mainController.pageController.page != null &&
                                mainController.pageController.page!.round() >
                                    0)) {
                          mainController.scrollBtn.value = 1.0;
                        }
                        return false;
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Stack(
                          children: [
                            // site content
                            PageView(
                              onPageChanged: (value) {
                                if (mainController.codingIndex.value > 0 &&
                                    sizingInformation.deviceScreenType ==
                                        DeviceScreenType.desktop) {
                                  Functions.navigate(
                                    mainController.codingIndex.value + 1,
                                    mainController.codingController,
                                  );
                                }

                                if (mainController.gamingIndex.value > 0 &&
                                    sizingInformation.deviceScreenType ==
                                        DeviceScreenType.desktop) {
                                  Functions.navigate(
                                    mainController.gamingIndex.value + 1,
                                    mainController.streamController,
                                  );
                                }
                              },
                              physics: sizingInformation.deviceScreenType ==
                                      DeviceScreenType.mobile
                                  ? ClampingScrollPhysics()
                                  : NeverScrollableScrollPhysics(),
                              pageSnapping:
                                  sizingInformation.deviceScreenType ==
                                          DeviceScreenType.mobile
                                      ? true
                                      : true,
                              // pageSnapping: false,
                              allowImplicitScrolling:
                                  sizingInformation.deviceScreenType ==
                                          DeviceScreenType.desktop
                                      ? true
                                      : false,
                              scrollDirection:
                                  sizingInformation.deviceScreenType ==
                                          DeviceScreenType.desktop
                                      ? Axis.horizontal
                                      : Axis.vertical,
                              children: [
                                if (sizingInformation.deviceScreenType ==
                                    DeviceScreenType.desktop)
                                  Screens.HomeContainer(
                                    context: context,
                                    mainController: mainController,
                                    isDesktop:
                                        sizingInformation.deviceScreenType ==
                                            DeviceScreenType.desktop,
                                  ),
                                Screens.CodingContainer(
                                    context: context,
                                    isDesktop:
                                        sizingInformation.deviceScreenType ==
                                            DeviceScreenType.desktop),
                                Screens.GamingContainer(
                                    context: context,
                                    isDesktop:
                                        sizingInformation.deviceScreenType ==
                                            DeviceScreenType.desktop),
                                Screens.MusicContainer(
                                  context: context,
                                  mainController: mainController,
                                  isDesktop:
                                      sizingInformation.deviceScreenType ==
                                          DeviceScreenType.desktop,
                                ),
                                Screens.SocialsContainer(
                                  context: context,
                                  mainController: mainController,
                                  isDesktop:
                                      sizingInformation.deviceScreenType ==
                                          DeviceScreenType.desktop,
                                ),
                              ],
                              controller: mainController.pageController,
                            ),

                            // floating nav bar
                            if (sizingInformation.deviceScreenType ==
                                DeviceScreenType.desktop)
                              FloatingNavBarDesktop(),

                            // dark-light theme toggle
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () => mainController
                                      .isDark(!mainController.isDark.value),
                                  icon: mainController.isDark.value
                                      ? Icon(Icons.light_mode)
                                      : Icon(Icons.dark_mode),
                                  color: mainController.isDark.value
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
