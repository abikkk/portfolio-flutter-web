// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Screens/Home.dart';
import 'Utils/PageRoutes.dart';

void main() {
  runApp(MaterialApp(
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
  Widget build(BuildContext context) {
    // INITIALIZING THE ROUTES
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      getPages: [
        GetPage(name: PageRoutes.HomeScreen, page: () => HomeContainer()),
        // GetPage(name: "/loading", page: () => loading()),
      ],
      home: HomeContainer(),
    );
  }
}
