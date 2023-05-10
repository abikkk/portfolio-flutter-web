import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';
import '../Controllers/MainController.dart';

class GamingScreen extends StatelessWidget {
  GamingScreen({Key? key,required this.mainController}) : super(key: key);

  final MainController mainController ;
  // final MainController mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      // games
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WidgetUtils.gamingMorphButtons(context, mainController, 0),
          WidgetUtils.gamingMorphButtons(context, mainController, 1),
          WidgetUtils.gamingMorphButtons(context, mainController, 2),
        ],
      ),

      // twitch discord youtube
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WidgetUtils.socialMorphButtons(context, mainController, 3),
          WidgetUtils.socialMorphButtons(context, mainController, 4),
          WidgetUtils.socialMorphButtons(context, mainController, 5),
        ],
      ),
    ]);
  }
}
