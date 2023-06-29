import 'package:flutter/material.dart';
import 'package:my_porfolio/Screens/Home.dart';
import 'package:my_porfolio/Utils/AppThemeData.dart';
import 'package:my_porfolio/Utils/Constants.dart';

main() {
  loadAssetImages();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: AppThemeData.appThemeData,
      home: HomeContainer(),
    // theme: ThemeData(
    //   fontFamily: CONSTANTS.appFont,
    // ),
    // home: BaseContainer(),
  ));
}

loadAssetImages(){

}

class BaseContainer extends StatelessWidget {
  BaseContainer({Key? key}) : super(key: key);

  // @override
  // void didChangeDependencies() {
  //   precacheImage(image1.image, context);
  //   precacheImage(image2.image, context);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeContainer(),
    );
  }
}
