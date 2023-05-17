import 'package:flutter/material.dart';
import 'package:my_porfolio/Utils/Utils.dart';
import '../Controllers/MainController.dart';
import '../Utils/AppThemeData.dart';

class MusicScreen extends StatelessWidget {
  MusicScreen({Key? key, required this.mainController, required this.isDesktop})
      : super(key: key);

  final MainController mainController;
  final bool isDesktop;

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
          child: Flex(
            direction:
                MediaQuery.of(context).orientation == Orientation.landscape ||
                        !isDesktop
                    ? Axis.horizontal
                    : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetUtils.musicMorphButtons(context, mainController, 0,
                  isDesktop: isDesktop),
              WidgetUtils.musicMorphButtons(context, mainController, 1,
                  isDesktop: isDesktop),
            ],
          ),
        ),
      ],
    );
  }
}
