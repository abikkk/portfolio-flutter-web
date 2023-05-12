import 'package:flutter/material.dart';
import 'package:my_porfolio/Controllers/MainController.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';

class DesktopSocialsScreen extends StatelessWidget {
  DesktopSocialsScreen({Key? key, required this.mainController})
      : super(key: key);

  final MainController mainController;

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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              WidgetUtils.socialMorphButtons(context, mainController, 0),
              WidgetUtils.socialMorphButtons(context, mainController, 1),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetUtils.socialMorphButtons(context, mainController, 2),
              WidgetUtils.socialMorphButtons(context, mainController, 3),
            ],
          ),
        ),
      ],
    );
  }
}

class SocialsScreen extends StatelessWidget {
  const SocialsScreen({Key? key, required this.mainController})
      : super(key: key);
  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
