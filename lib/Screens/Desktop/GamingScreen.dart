import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Controllers/GamingController.dart';
import 'package:my_porfolio/Controllers/MainController.dart';
import 'package:my_porfolio/Utils/AppThemeData.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';

class GamingScreen extends StatefulWidget {
  const GamingScreen({Key? key, required this.isDesktop}) : super(key: key);

  final bool isDesktop;

  @override
  State<GamingScreen> createState() => _GamingScreenState();
}

class _GamingScreenState extends State<GamingScreen> {
  MainController mainController = Get.find<MainController>();
  GamingController gamingController = Get.find<GamingController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(44),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Column(
            spacing: 20,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Widgets.customShadowBox(
                    Text(
                      mainController.infos[2].label.value,
                      style: AppThemeData.appThemeData.textTheme.headlineMedium!
                          .copyWith(
                              color: mainController.isDark.value
                                  ? Colors.white
                                  : Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Widgets.customShadowBox(
                      Text(
                        mainController.infos[2].description.value,
                        softWrap: true,
                        style: AppThemeData.appThemeData.textTheme.bodyMedium!
                            .copyWith(
                                color: mainController.isDark.value
                                    ? Colors.white
                                    : Colors.black),
                        maxLines: 4,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Widgets.customShadowBox(
                      Text(
                        mainController.infos[2].subTitle1.value,
                        softWrap: true,
                        style: AppThemeData.appThemeData.textTheme.bodyMedium!
                            .copyWith(
                                color: mainController.isDark.value
                                    ? Colors.white
                                    : Colors.black),
                        maxLines: 4,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Widgets.customShadowBox(
                      Text(
                        mainController.infos[2].subTitle2.value,
                        softWrap: true,
                        style: AppThemeData.appThemeData.textTheme.bodyMedium!
                            .copyWith(
                                color: mainController.isDark.value
                                    ? Colors.white
                                    : Colors.black),
                        maxLines: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (widget.isDesktop)
            SizedBox(
                height: MediaQuery.of(context).size.height * .20,
                child: Widgets.gamingSocialsMorphButtons(context)),
        ],
      ),
    );
  }
}
