import 'package:flutter/material.dart';
import 'package:my_porfolio/Controllers/MainController.dart';
import 'package:my_porfolio/Utils/AppThemeData.dart';
import 'package:my_porfolio/Utils/Utils.dart';

class SocialsScreen extends StatelessWidget {
  SocialsScreen(
      {Key? key, required this.mainController, required this.isDesktop})
      : super(key: key);

  final MainController mainController;
  final bool isDesktop;

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
                  WidgetUtils.socialMorphButtons(context, mainController, 0,
                      isDesktop: isDesktop),
                  WidgetUtils.socialMorphButtons(context, mainController, 1,
                      isDesktop: isDesktop),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetUtils.socialMorphButtons(context, mainController, 2,
                      isDesktop: isDesktop),
                  WidgetUtils.socialMorphButtons(context, mainController, 3,
                      isDesktop: isDesktop),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}