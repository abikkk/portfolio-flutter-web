// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Screens/Home.dart';
import 'package:my_porfolio/Screens/Settings.dart';
import 'package:my_porfolio/Screens/Socials.dart';
import 'package:my_porfolio/Screens/UnknownPage.dart';
import 'package:my_porfolio/Utils/Consntants.dart';
import 'Utils/PageRoutes.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: CONSTANTS.appFont,
    ),
    home: BaseContainer(),
  ));
}

class BaseContainer extends StatefulWidget {
  const BaseContainer({Key? key}) : super(key: key);

  @override
  _BaseContainerState createState() => _BaseContainerState();
}

class _BaseContainerState extends State<BaseContainer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setTheme();
  }

  setTheme() {}
  @override
  Widget build(BuildContext context) {
    // INITIALIZING THE ROUTES
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      getPages: [
        GetPage(name: PAGEROUTES.HOMECONTAINER, page: () => HomeContainer()),
        GetPage(
            name: PAGEROUTES.NOTFOUND,
            page: () => UnknownPage()), // 404 not found
        // GetPage(name: "/loading", page: () => loading()),
      ],
      theme: ThemeData(
        // Define the default brightness and colors.
        // brightness: Brightness.dark,
        primaryColor: Colors.grey[100],

        // Define the default font family.
        fontFamily: 'Quicksand',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 80.0,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 48.0,
            fontStyle: FontStyle.italic,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 17.0,
          ),
        ),
      ),
      home: HomeContainer(),
    );
  }
}
