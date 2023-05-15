import 'package:flutter/material.dart';
import 'package:my_porfolio/Screens/Home.dart';
import 'package:my_porfolio/Utils/AppThemeData.dart';
import 'package:my_porfolio/Utils/Constants.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: CONSTANTS.appFont,
    ),
    home: BaseContainer(),
  ));
}

class BaseContainer extends StatelessWidget {
  BaseContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.appThemeData,
      home: HomeContainer(),
    );
  }
}
