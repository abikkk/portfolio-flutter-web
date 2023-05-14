import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_porfolio/main.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../Controllers/MainController.dart';
import '../Utils/FloatingNavBar.dart';
import 'Coding.dart';
import 'Contact.dart';
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
                    FloatingNavBarHori(
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
            body: SingleChildScrollView(
              child: ResponsiveBuilder(
                builder: (context, sizingInformation) => SizedBox(
                  height: sizingInformation.screenSize.height,
                  child: Stack(
                    children: [
                      PageView(
                        allowImplicitScrolling: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          HomeScreen(),
                          // CodingScreen(
                          //   mainController: mainController,
                          // ),
                          // GamingScreen(
                          //   mainController: mainController,
                          // ),
                          // MusicScreen(
                          //   mainController: mainController,
                          // ),
                          // SocialsScreen(
                          //   mainController: mainController,
                          // ),
                          // ContactContainer()
                        ],
                        controller: mainController.pageController,
                      ),
                      // FloatingNavBarVert(
                      //   mainController: mainController,
                      // )
                    ],
                  ),
                ),
              ),
            ),
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
