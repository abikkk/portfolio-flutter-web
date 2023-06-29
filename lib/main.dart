import 'package:flutter/material.dart';
import 'package:my_porfolio/Screens/Home.dart';
import 'package:my_porfolio/Utils/AppThemeData.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: AppThemeData.appThemeData,
    home: HomeContainer(),
  ));
}