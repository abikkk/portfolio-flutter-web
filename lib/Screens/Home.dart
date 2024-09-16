import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../Controllers/MainController.dart';
import '../Models/Images.dart';
import '../Utils/FloatingNavBar.dart';
import '../Utils/Utils.dart';

class HomeContainer extends StatefulWidget {
  HomeContainer({Key? key}) : super(key: key);

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  final MainController mainController = MainController();
  double bg = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Functions.precacheImages(mainController, context); // pre-load images
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
                            child: Column(
                              children: [
                                Container(
                                  height: 300,
                                  // width: 300,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(AppImages.own),
                                        fit: BoxFit.cover,
                                      ),
                                      color: mainController.isDark.value
                                          ? Colors.grey.withOpacity(0.1)
                                          : Colors.grey.shade300
                                              .withOpacity(0.1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                // Text(
                                //   'abik vaidhya',
                                //   style: TextStyle(
                                //     fontSize: 48,
                                //     color: Colors.white,
                                //   ),
                                // ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 40,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.grey.shade300.withOpacity(0.3),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Center(
                                    child: Text(
                                      'flutter developer',
                                      style: TextStyle(
                                        color: mainController.isDark.value
                                            ? Colors.white
                                            : null,
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
                                      backgroundColor:
                                          Colors.grey.shade300.withOpacity(0.3),
                                      child: Icon(
                                        Icons.mail_outline,
                                        color: mainController.isDark.value
                                            ? Colors.white
                                            : null,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'abikvaidhya@gmail.com',
                                      style: TextStyle(
                                        color: mainController.isDark.value
                                            ? Colors.white
                                            : null,
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
                                      backgroundColor:
                                          Colors.grey.shade300.withOpacity(0.3),
                                      child: Icon(
                                        Icons.phone_iphone_rounded,
                                        color: mainController.isDark.value
                                            ? Colors.white
                                            : null,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '+977-986-908-0265',
                                      style: TextStyle(
                                        color: mainController.isDark.value
                                            ? Colors.white
                                            : null,
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
                                      backgroundColor:
                                          Colors.grey.shade300.withOpacity(0.3),
                                      child: Icon(
                                        Icons.pin_drop,
                                        color: mainController.isDark.value
                                            ? Colors.white
                                            : null,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Kathmandu, Nepal',
                                      style: TextStyle(
                                        color: mainController.isDark.value
                                            ? Colors.white
                                            : null,
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
                                      backgroundColor:
                                          Colors.grey.shade300.withOpacity(0.3),
                                      child: Icon(
                                        Icons.book,
                                        color: mainController.isDark.value
                                            ? Colors.white
                                            : null,
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
                                          color: mainController.isDark.value
                                              ? Colors.white
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
                          // } else if (mainController.isDark.value) {
                          //   mainController.scrollBtn.value = 0.8;
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
                                      mainController);
                                }

                                if (mainController.gamingIndex.value > 0 &&
                                    sizingInformation.deviceScreenType ==
                                        DeviceScreenType.desktop) {
                                  Functions.navigate(
                                      mainController.gamingIndex.value + 1,
                                      mainController.streamController,
                                      mainController);
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
                                    mainController: mainController,
                                    isDesktop:
                                        sizingInformation.deviceScreenType ==
                                            DeviceScreenType.desktop),
                                Screens.GamingContainer(
                                    context: context,
                                    mainController: mainController,
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
                              FloatingNavBarDesktop(
                                mainController: mainController,
                              ),

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
                    ? Widgets.scrollButton(mainController)
                    : null,
          ),
        ),
      );
    });
  }
}
