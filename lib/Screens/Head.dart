import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Controllers/MainController.dart';
import 'package:my_porfolio/Utils/AppThemeData.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';

class DesktopHomeScreen extends StatelessWidget {
  DesktopHomeScreen({Key? key, required this.mainController}) : super(key: key);

  final MainController mainController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image(
              image: AssetImage('images/profile_shot.png'),
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'hi there!',
                style: AppThemeData.appThemeData.textTheme.headlineSmall,
              ),
              Text(
                'abik vaidhya',
                style: AppThemeData.appThemeData.textTheme.headlineLarge,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width / 2.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: subtitleTexts(
                        mainController: mainController,
                        label: 'frontend developer',
                        id: 0,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: subtitleTexts(
                          mainController: mainController,
                          label: 'gamer',
                          id: 1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: subtitleTexts(
                          mainController: mainController,
                          label: 'musician',
                          id: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class subtitleTexts extends StatelessWidget {
  const subtitleTexts(
      {Key? key,
      required this.mainController,
      required this.label,
      required this.id})
      : super(key: key);

  final MainController mainController;
  final String label;
  final int id;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (v) {
        switch (id) {
          case 0:
            mainController.subtitle_1.value = true;
            break;
          case 1:
            mainController.subtitle_2.value = true;
            break;
          case 2:
            mainController.subtitle_3.value = true;
            break;
        }
      },
      onExit: (v) {
        switch (id) {
          case 0:
            mainController.subtitle_1.value = false;
            break;
          case 1:
            mainController.subtitle_2.value = false;
            break;
          case 2:
            mainController.subtitle_3.value = false;
            break;
        }
      },
      child: Obx(
        () => AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 200),
          style: !((id == 0)
                  ? mainController.subtitle_1.value
                  : (id == 1)
                      ? mainController.subtitle_2.value
                      : mainController.subtitle_3.value)
              ? AppThemeData.appThemeData.textTheme.displaySmall!
              : AppThemeData.appThemeData.textTheme.titleSmall!,
          child: InkWell(
            onTap: () {
              UiUtils.navigate(id + 2, mainController);
            },
            child: Text(
              '${label}',
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
