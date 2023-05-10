import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        print('>> Device is a desktop.');
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
                child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage('images/whiteLinesBG.jpg'),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  PageView(
                    allowImplicitScrolling: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      HomeScreen(),
                      CodingScreen(
                        mainController: mainController,
                      ),
                      GamingScreen(
                        mainController: mainController,
                      ),
                      MusicScreen(
                        mainController: mainController,
                      ),
                      SocialsContainer(
                        mainController: mainController,
                      ),
                      ContactContainer()
                    ],
                    controller: mainController.pageController,
                  ),
                  FloatingNavBar(
                    mainController: mainController,
                    sizingInformation: sizingInformation,
                  )
                ],
              ),
            )),
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
                          CodingScreen(
                            mainController: mainController,
                          ),
                          GamingScreen(
                            mainController: mainController,
                          ),
                          MusicScreen(mainController: mainController,),
                          SocialsContainer(
                            mainController: mainController,
                          ),
                          ContactContainer()
                        ],
                        controller: mainController.pageController,
                      ),
                      FloatingNavBar(
                        mainController: mainController,
                        sizingInformation: sizingInformation,
                      )
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
                  child: Text("Sorry, probably won't work on you rdevice!"))),
        );
      } else
        return Text("hello world!");
    });
  }
}
