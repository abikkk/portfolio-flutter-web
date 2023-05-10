import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';
import '../Controllers/MainController.dart';

class MusicScreen extends StatelessWidget {
   MusicScreen({Key? key,required this.mainController}) : super(key: key);

  final MainController mainController;
  // final MainController mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'listen to my music',
              // style: TextStyle(fontSize: 48),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetUtils.musicMorphButtons(context, mainController, 0),
            WidgetUtils.musicMorphButtons(context, mainController, 1)
          ],
        ),
      ],
    );
  }
}
