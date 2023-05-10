import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Controllers/main_controller.dart';
import 'package:my_porfolio/Screens/Coding.dart';
import 'package:my_porfolio/Screens/Contact.dart';
import 'package:my_porfolio/Screens/Gaming.dart';
import 'package:my_porfolio/Screens/Head.dart';
import 'package:my_porfolio/Screens/Music.dart';
import 'package:my_porfolio/Screens/Socials.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../Utils/FloatingNavBar.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({Key? key, required this.navIndex}) : super(key: key);
  final int navIndex;
  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  final MainController _mainController = MainController();

  List<Widget> _pages = [
    HomeScreen(),
    CodingScreen(),
    GamingScreen(),
    MusicScreen(),
    // GalleryScreen(),
    SocialsContainer(),
    ContactContainer()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        print('>> Device is a desktop.');
        return SafeArea(
          child: Scaffold(
            // bottomNavigationBar: NavigationBar(
            //   height: MediaQuery.of(context).size.height * 0.1,
            //   // backgroundColor: Colors.black,
            //   animationDuration: Duration(milliseconds: 150),
            //   selectedIndex: _navIndex,
            //   onDestinationSelected: (int newIndex) {
            //     setState(() {
            //       _navIndex = newIndex;
            //     });
            //   },
            //   labelBehavior:
            //       NavigationDestinationLabelBehavior.onlyShowSelected,
            //   destinations: [
            //     NavigationDestination(
            //         selectedIcon: Icon(Icons.home_rounded),
            //         icon: Icon(Icons.home_outlined),
            //         label: 'home'),
            //     NavigationDestination(
            //         selectedIcon: Icon(Icons.list_rounded),
            //         icon: Icon(Icons.list_outlined),
            //         label: 'coding'),
            //     NavigationDestination(
            //         selectedIcon: Icon(Icons.games_rounded),
            //         icon: Icon(Icons.games_outlined),
            //         label: 'gaming'),
            //     NavigationDestination(
            //         selectedIcon: Icon(Icons.music_note_rounded),
            //         icon: Icon(Icons.music_note_outlined),
            //         label: 'music'),
            //     NavigationDestination(
            //         selectedIcon: Icon(Icons.person_rounded),
            //         icon: Icon(Icons.person_outline),
            //         label: 'socials'),
            //     NavigationDestination(
            //         selectedIcon: Icon(Icons.email_rounded),
            //         icon: Icon(Icons.email_outlined),
            //         label: 'contact me')
            //   ],
            // ),
            body: SingleChildScrollView(
              child: ResponsiveBuilder(
                builder: (BuildContext context,
                    SizingInformation sizingInformation) {
                  if (sizingInformation.deviceScreenType ==
                      DeviceScreenType.desktop) {
                    print('>> Device is a desktop.');
                  } else if (sizingInformation.deviceScreenType ==
                      DeviceScreenType.tablet) {
                    print('>> Device is a tablet.');
                  } else if (sizingInformation.deviceScreenType ==
                      DeviceScreenType.watch) {
                    print('>> Device is a watch.');
                  } else if (sizingInformation.deviceScreenType ==
                      DeviceScreenType.mobile) {
                    print('>> Device is a watch.');
                  }

                  return Stack(
                    children: [
                      Stack(
                        children: [
                          Image(
                            image: AssetImage('images/whiteLinesBG.jpg'),
                            height: MediaQuery.of(context).size.height,
                            fit: BoxFit.cover,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image(
                                image: AssetImage('images/profile_shot.png'),
                                height: MediaQuery.of(context).size.height,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Obx(() => _pages[_mainController.navIndex.value]),
                      FloatingNavBar(
                        mainController: _mainController,
                      )
                    ],
                  );
                },
              ),
            ),
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
                builder: (context, sizingInformation) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _pages[0],
                    _pages[1],
                    _pages[2],
                    _pages[3],
                    _pages[4],
                    _pages[5],
                  ],
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
                  child: Text("Sorry, probably won't work on you rdevice!"))),
        );
      } else
        return Text("hello world!");
    });
  }

  changeIndex(int newIndex) {
    setState(() {
      _mainController.navIndex.value = newIndex;
    });
  }
}
