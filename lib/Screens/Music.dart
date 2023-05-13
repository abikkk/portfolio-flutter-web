import 'package:flutter/material.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';
import '../Controllers/MainController.dart';
import '../Utils/AppThemeData.dart';

class DesktopMusicScreen extends StatelessWidget {
  DesktopMusicScreen({Key? key, required this.mainController})
      : super(key: key);

  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'listen to my music',
                style: AppThemeData.appThemeData.textTheme.headlineMedium,
              ),
              SizedBox(
                height: 24,
              ),
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
                  WidgetUtils.musicMorphButtons(context, mainController, 0),
                  WidgetUtils.musicMorphButtons(context, mainController, 1)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MusicScreen extends StatelessWidget {
  const MusicScreen({Key? key, required this.mainController}) : super(key: key);
  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
