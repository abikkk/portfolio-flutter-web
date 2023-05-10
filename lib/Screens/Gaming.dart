import 'package:flutter/material.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';
import '../Controllers/MainController.dart';

class GamingScreen extends StatelessWidget {
  GamingScreen({Key? key, required this.mainController}) : super(key: key);

  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      // games
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetUtils.gamingMorphButtons(context, mainController, 0),
            WidgetUtils.gamingMorphButtons(context, mainController, 1),
            WidgetUtils.gamingMorphButtons(context, mainController, 2),
          ],
        ),
      ),

      // twitch discord youtube
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetUtils.socialMorphButtons(context, mainController, 4),
            WidgetUtils.socialMorphButtons(context, mainController, 6),
            WidgetUtils.socialMorphButtons(context, mainController, 5),
          ],
        ),
      ),
    ]);
  }
}
