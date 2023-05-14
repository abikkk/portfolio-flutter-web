import 'package:flutter/material.dart';
import 'package:my_porfolio/Utils/AppThemeData.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';
import '../Controllers/MainController.dart';

class DesktopCodingScreen extends StatelessWidget {
  DesktopCodingScreen({Key? key, required this.mainController})
      : super(key: key);

  final MainController mainController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: MouseRegion(
            onHover: (e) {
              mainController.showScrollDownBtn.value = true;
            },
            child: PageView(
              allowImplicitScrolling: true,
              scrollDirection: Axis.vertical,
              children: [
                IntroDetails(
                  mainController: mainController,
                ),
                FlutterDetails(
                  mainController: mainController,
                ),
                ReactDetails(
                  mainController: mainController,
                ),
                VueDetails(
                  mainController: mainController,
                )
              ],
              controller: mainController.codingController,
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetUtils.codingMorphButtons(context, mainController, 0),
              WidgetUtils.codingMorphButtons(context, mainController, 1),
              WidgetUtils.codingMorphButtons(context, mainController, 2),
            ],
          ),
        ),
      ],
    );
  }
}

class FlutterDetails extends StatelessWidget {
  const FlutterDetails({Key? key, required this.mainController})
      : super(key: key);

  final MainController mainController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(44.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'flutter',
                style: AppThemeData.appThemeData.textTheme.headlineMedium,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Text(
                  'i have been working as a senior flutter developer for the past 2 years in a private software solution company in Pokhara.\ni was involved in 15+ projects for our clients in dubai and some local projects as well.\n * notable example of local project would be "Pokhara Food Delivery", which is available on Google Play Store.',
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: WidgetUtils.pieChart(
                    mainController,
                    context,
                    mainController.usageFlutter,
                    'IDE',
                    mainController.ideGradientList,
                    isGradient: true),
              ),
              Expanded(child: Container())
            ],
          ),
        ],
      ),
    );
  }
}

class ReactDetails extends StatelessWidget {
  const ReactDetails({Key? key, required this.mainController})
      : super(key: key);
  final MainController mainController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(44.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'react.js',
                style: AppThemeData.appThemeData.textTheme.headlineMedium,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Text(
                  'i worked as a freelancer for 8 months.\nmy projects ranges as follows:\n - portfolio websites\n - cafe website\n - ecomerce\n - warehouse/inventory management.',
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: WidgetUtils.pieChart(
                    mainController,
                    context,
                    mainController.usageReact,
                    'IDE',
                    mainController.ideGradientList,
                    isGradient: true),
              ),
              Expanded(child: Container())
            ],
          ),
        ],
      ),
    );
  }
}

class VueDetails extends StatelessWidget {
  const VueDetails({Key? key, required this.mainController}) : super(key: key);

  final MainController mainController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(44.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'vue.js',
                style: AppThemeData.appThemeData.textTheme.headlineMedium,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Text(
                  'i worked as an intern for a private company in Pokhara as their junior frontend developer for 6 months.\ni was involved in development of employee record management system and attendance management system.\ni have my own portfolio website under development as well.',
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: WidgetUtils.pieChart(
                    mainController,
                    context,
                    mainController.usageVue,
                    'IDE',
                    mainController.ideGradientList,
                    isGradient: true),
              ),
              Expanded(child: Container())
            ],
          ),
        ],
      ),
    );
  }
}

class IntroDetails extends StatelessWidget {
  const IntroDetails({Key? key, required this.mainController})
      : super(key: key);
  final MainController mainController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(44.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'my skills',
                style: AppThemeData.appThemeData.textTheme.headlineMedium,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Text(
                  'i can work for projects using the following frameworks.',
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Text(
                      'my knowledge base on these languages and development environments (IDE) i use can be divided as follows:',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: WidgetUtils.pieChart(
                        mainController,
                        context,
                        mainController.projectMap,
                        'projects',
                        mainController.skillsGradientList,
                        isGradient: true),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        WidgetUtils.codingProgressRow(
                            mainController, 'vs code', 0),
                        WidgetUtils.codingProgressRow(
                            mainController, 'android studio', 1),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CodingScreen extends StatelessWidget {
  const CodingScreen({Key? key, required this.mainController})
      : super(key: key);
  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
