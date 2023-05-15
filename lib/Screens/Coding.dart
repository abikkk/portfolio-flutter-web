import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_porfolio/Utils/AppThemeData.dart';
import 'package:my_porfolio/Utils/Constants.dart';
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
                  isDesktop: true,
                ),
                FlutterDetails(
                  mainController: mainController,
                  isDesktop: true,
                ),
                ReactDetails(
                  mainController: mainController,
                  isDesktop: true,
                ),
                VueDetails(
                  mainController: mainController,
                  isDesktop: true,
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

class IntroDetails extends StatelessWidget {
  const IntroDetails(
      {Key? key, required this.mainController, required this.isDesktop})
      : super(key: key);
  final MainController mainController;
  final isDesktop;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all((isDesktop) ? 44.0 : 20.0),
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
                Expanded(
                  child: Text(
                    'i can work for projects using the following frameworks.',
                    softWrap: true,
                    maxLines: 4,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'my knowledge base on these languages and development environments (IDE) i use can be divided as follows:',
                    softWrap: true,
                    maxLines: 4,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Flex(
              direction: isDesktop ? Axis.horizontal : Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: isDesktop ? 2 : 3,
                  child: WidgetUtils.pieChart(
                      mainController,
                      context,
                      mainController.projectMap,
                      'projects',
                      mainController.skillsGradientList,
                      isGradient: true,
                      isDesktop: false),
                ),
                Expanded(
                  flex: isDesktop ? 3 : 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      WidgetUtils.codingProgressRow(mainController, 'vs code',
                          0, mainController.vsValue.value,
                          isDesktop: false),
                      WidgetUtils.codingProgressRow(mainController,
                          'android studio', 1, mainController.asValue.value,
                          isDesktop: false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlutterDetails extends StatelessWidget {
  const FlutterDetails(
      {Key? key, required this.mainController, required this.isDesktop})
      : super(key: key);

  final MainController mainController;
  final bool isDesktop;
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
                Expanded(
                  child: Text(
                    'i have been working as a senior flutter developer for the past 2 years in a private software solution company in Pokhara, involved in 15+ projects for our clients in Dubai and local projects as well.\n * notable example of local project would be "Pokhara Food Delivery", which is available on Google Play Store.',
                    maxLines: 8,
                    softWrap: true,
                    textAlign: TextAlign.justify,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: (isDesktop) ? 40.0 : 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetUtils.codingProgressRow(mainController, 'vs code', 0,
                    mainController.usageFlutter[CONSTANTS.vsCode]!,
                    isDesktop: false),
                WidgetUtils.codingProgressRow(mainController, 'android studio',
                    1, mainController.usageFlutter[CONSTANTS.androidStudio]!,
                    isDesktop: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReactDetails extends StatelessWidget {
  const ReactDetails(
      {Key? key, required this.mainController, required this.isDesktop})
      : super(key: key);
  final MainController mainController;
  final bool isDesktop;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all((isDesktop) ? 44.0 : 20),
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
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'i worked as a freelancer for 8 months. my projects ranges as follows:',
                        textAlign: TextAlign.justify,
                        softWrap: true,
                        maxLines: 4,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      ' - portfolio websites\n - cafe website\n - ecommerce\n - warehouse/inventory management',
                      softWrap: true,
                      maxLines: 8,
                    )),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: (isDesktop) ? 40.0 : 10),
            child: WidgetUtils.codingProgressRow(mainController, 'vs code', 0,
                mainController.usageReact[CONSTANTS.vsCode]!),
          ),
        ],
      ),
    );
  }
}

class VueDetails extends StatelessWidget {
  const VueDetails(
      {Key? key, required this.mainController, required this.isDesktop})
      : super(key: key);

  final MainController mainController;
  final bool isDesktop;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all((isDesktop) ? 44.0 : 20),
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
                Expanded(
                  child: Text(
                    'i worked as an intern for a private company in Pokhara as their junior frontend developer for 6 months. i was involved in development of employee record management system and attendance management system. i have my own portfolio website under development as well.',
                    maxLines: 8,
                    softWrap: true,
                    textAlign: TextAlign.justify,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: (isDesktop) ? 40.0 : 10),
            child: WidgetUtils.codingProgressRow(mainController, 'vs code', 0,
                mainController.usageVue[CONSTANTS.vsCode]!),
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
    return PageView(
      scrollDirection: Axis.horizontal,
      children: [
        IntroDetails(
          mainController: mainController,
          isDesktop: false,
        ),
        FlutterDetails(
          mainController: mainController,
          isDesktop: false,
        ),
        ReactDetails(
          mainController: mainController,
          isDesktop: false,
        ),
        VueDetails(
          mainController: mainController,
          isDesktop: false,
        )
      ],
    );
  }
}
