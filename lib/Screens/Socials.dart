import 'package:flutter/material.dart';
import 'package:my_porfolio/Controllers/MainController.dart';
import 'package:my_porfolio/Utils/AppThemeData.dart';
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
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'connect with me',
                style: AppThemeData.appThemeData.textTheme.headlineMedium,
              ),
              SizedBox(
                height: 24,
              )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetUtils.socialMorphButtons(context, mainController, 0),
                  WidgetUtils.socialMorphButtons(context, mainController, 1),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetUtils.socialMorphButtons(context, mainController, 2),
                  WidgetUtils.socialMorphButtons(context, mainController, 3),
                ],
              ),
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
