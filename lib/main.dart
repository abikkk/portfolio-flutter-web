import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
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

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 2))
      .whenComplete(() => FlutterNativeSplash.remove());
}
