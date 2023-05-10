import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:my_porfolio/Controllers/MainController.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';

class SocialsContainer extends StatelessWidget {
  SocialsContainer({Key? key, required this.mainController}) : super(key: key);

  final MainController mainController;
  // final MainController mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'connect with me',
            // style: TextStyle(fontSize: 48),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            WidgetUtils.socialMorphButtons(context, mainController, 0),
            WidgetUtils.socialMorphButtons(context, mainController, 1),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetUtils.socialMorphButtons(context, mainController, 2),
            WidgetUtils.socialMorphButtons(context, mainController, 3),
          ],
        ),
      ],
    );
  }
}
