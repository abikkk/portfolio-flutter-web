import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../Controllers/MainController.dart';
import '../Utils/FloatingNavBar.dart';
import '../Utils/UiUtils.dart';
import 'Coding.dart';
import 'Gaming.dart';
import 'Head.dart';
import 'Music.dart';
import 'Socials.dart';

class HomeContainer extends StatelessWidget {
  HomeContainer({Key? key}) : super(key: key);
  final MainController mainController = MainController();

  double bg = 0.0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        print('>> Device is a desktop.');
        return SafeArea(
          child: Scaffold(
            body: NotificationListener<UserScrollNotification>(
              onNotification: (notif) {
                if (notif.direction != ScrollDirection.idle) {
                  // mainController.navHovered.value = 1;
                } else {
                  // mainController.navHovered.value = 0;
                }
                return false;
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    // Positioned(
                    //   left: bg,
                    //   child: Image(
                    //     image: AssetImage('images/whiteLinesBG.jpg'),
                    //     height: MediaQuery.of(context).size.height,
                    //     width: MediaQuery.of(context).size.width,
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                    PageView(
                      allowImplicitScrolling: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        DesktopHomeScreen(
                          mainController: mainController,
                        ),
                        DesktopCodingScreen(
                          mainController: mainController,
                        ),
                        DesktopGamingScreen(
                          mainController: mainController,
                        ),
                        DesktopMusicScreen(
                          mainController: mainController,
                        ),
                        DesktopSocialsScreen(
                          mainController: mainController,
                        ),
                        // ContactContainer()
                      ],
                      controller: mainController.pageController,
                    ),
                    FloatingNavBarDesktop(
                      mainController: mainController,
                    )
                  ],
                ),
              ),
            ),
            // floatingActionButton:(mainController.pageController.page == 1 ||
            //         mainController.pageController.page == 2)
            //     ? IconButton(
            //         onPressed: () {}, icon: Icon(Icons.keyboard_arrow_down))
            //     : null,
          ),
        );
      } else if (sizingInformation.deviceScreenType ==
              DeviceScreenType.tablet ||
          sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        print('>> Device is a tablet/mobile');
        return SafeArea(
          child: Scaffold(
            body: NotificationListener(
              onNotification: (UserScrollNotification e) {
                if (e.direction == ScrollDirection.forward) {
                  mainController.navHovered.value = 1.0;
                } else if (e.direction == ScrollDirection.reverse) {
                  mainController.navHovered.value = 0.0;
                }
                return false;
              },
              child: ResponsiveBuilder(
                builder: (context, sizingInformation) => SizedBox(
                  height: sizingInformation.screenSize.height,
                  child: Stack(
                    children: [
                      PageView(
                        allowImplicitScrolling: false,
                        pageSnapping: sizingInformation.deviceScreenType ==
                                DeviceScreenType.tablet
                            ? true
                            : false,
                        scrollDirection: Axis.vertical,
                        children: [
                          HomeScreen(
                            mainController: mainController,
                          ),
                          CodingScreen(
                            mainController: mainController,
                          ),
                          GamingScreen(
                            mainController: mainController,
                          ),
                          MusicScreen(
                            mainController: mainController,
                          ),
                          SocialsScreen(
                            mainController: mainController,
                          ),
                          // ContactContainer()
                        ],
                        controller: mainController.pageController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // bottomNavigationBar: FloatingNavBar(
            //   mainController: mainController,
            // ),
            floatingActionButton: WidgetUtils.scrollButton(mainController),
          ),
        );
      } else if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
        print('>> Device is a watch.');
        return SingleChildScrollView(
          child: Container(
              color: Colors.pink,
              child: Center(
                  child: Text("Sorry, probably won't work on your device!"))),
        );
      } else
        return Text("hello world!");
    });
  }
}
