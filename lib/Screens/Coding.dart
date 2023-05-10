import 'package:flutter/material.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';
import '../Controllers/MainController.dart';

class CodingScreen extends StatelessWidget {
  CodingScreen({Key? key,required this.mainController}) : super(key: key);

  final MainController mainController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'my skills',
                  // style: TextStyle(fontSize: 48),
                ),
                Text(
                  'i can work for projects using the following frameworks',
                  // style: TextStyle(fontSize: 32),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WidgetUtils.codingMorphButtons(context, mainController, 0),
                WidgetUtils.codingMorphButtons(context, mainController, 1),
                WidgetUtils.codingMorphButtons(context, mainController, 2),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
