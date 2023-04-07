import 'package:flutter/material.dart';
import 'package:my_porfolio/Screens/Gallery.dart';
import 'package:my_porfolio/Screens/Coding.dart';
import 'package:my_porfolio/Screens/Contact.dart';
import 'package:my_porfolio/Screens/Gaming.dart';
import 'package:my_porfolio/Screens/Head.dart';
import 'package:my_porfolio/Screens/Music.dart';
import 'package:my_porfolio/Screens/Socials.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  double bgTop = 0, headerTop = 0;
  int _navIndex = 0;
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
            bottomNavigationBar: NavigationBar(
              height: MediaQuery.of(context).size.height * 0.1,
              backgroundColor: Colors.white.withOpacity(0.05),
              animationDuration: Duration(milliseconds: 150),
              selectedIndex: _navIndex,
              onDestinationSelected: (int newIndex) {
                setState(() {
                  _navIndex = newIndex;
                });
              },
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              destinations: [
                NavigationDestination(
                    selectedIcon: Icon(Icons.home_rounded),
                    icon: Icon(Icons.home_outlined),
                    label: 'home'),
                NavigationDestination(
                    selectedIcon: Icon(Icons.list_rounded),
                    icon: Icon(Icons.list_outlined),
                    label: 'coding'),
                NavigationDestination(
                    selectedIcon: Icon(Icons.games_rounded),
                    icon: Icon(Icons.games_outlined),
                    label: 'gaming'),
                NavigationDestination(
                    selectedIcon: Icon(Icons.music_note_rounded),
                    icon: Icon(Icons.music_note_outlined),
                    label: 'music'),
                NavigationDestination(
                    selectedIcon: Icon(Icons.person_rounded),
                    icon: Icon(Icons.person_outline),
                    label: 'socials'),
                NavigationDestination(
                    selectedIcon: Icon(Icons.email_rounded),
                    icon: Icon(Icons.email_outlined),
                    label: 'contact me')
              ],
            ),
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
                  return Center(
                    child: _pages[_navIndex],
                  );
                },
              ),
            ),
          ),
        );
      } else if (sizingInformation.deviceScreenType ==
          DeviceScreenType.tablet) {
        print('>> Device is a tablet.');
        return SingleChildScrollView(
          child: Container(
              color: Colors.yellow, child: Center(child: Text('tablet'))),
        );
      } else if (sizingInformation.deviceScreenType ==
          DeviceScreenType.mobile) {
        print('>> Device is a phone.');
        return SingleChildScrollView(
          child:
              Container(color: Colors.red, child: Center(child: Text('phone'))),
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
}
