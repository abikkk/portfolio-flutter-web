import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Utils/Utils.dart';
import '../Controllers/MainController.dart';

class GamingScreen extends StatelessWidget {
  GamingScreen(
      {Key? key, required this.mainController, required this.isDesktop})
      : super(key: key);

  final MainController mainController;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
            pageSnapping: true,
            allowImplicitScrolling: true,
            scrollDirection: (isDesktop) ? Axis.vertical : Axis.horizontal,
            controller: mainController.gamingController,
            onPageChanged: (value) {
              if (mainController.gamingController.page!.round() == 1) {
                mainController.isGameScrollDown.value = false;
              } else {
                mainController.isGameScrollDown.value = true;
              }
            },
            children: [
              // youtube twitch discord
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: PageView(
                        allowImplicitScrolling: true,
                        scrollDirection:
                            (isDesktop) ? Axis.vertical : Axis.horizontal,
                        onPageChanged: (event) {
                          // focus for morph buttons
                          // if(isDesktop)
                          for (int i = 0; i < 3; i++) {
                            if (mainController.streamController.page!.round() !=
                                i)
                              mainController.streamMorphButtons[i].isFocused
                                  .value = false;
                            else
                              mainController
                                  .streamMorphButtons[i].isFocused.value = true;
                          }
                        },
                        children: [
                          YoutubeDetails(
                            mainController: mainController,
                            isDesktop: isDesktop,
                          ),
                          TwitchDetails(
                            mainController: mainController,
                            isDesktop: isDesktop,
                          ),
                          DiscordDetails(
                            mainController: mainController,
                            isDesktop: isDesktop,
                          ),
                        ],
                        controller: mainController.streamController,
                      ),
                    ),
                    if (isDesktop)
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WidgetUtils.streamMorphButtons(
                                context, mainController, 0),
                            WidgetUtils.streamMorphButtons(
                                context, mainController, 1),
                            WidgetUtils.streamMorphButtons(
                                context, mainController, 2),
                          ],
                        ),
                      ),
                  ],
                ),
              ),

              if (isDesktop)
                // games
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WidgetUtils.gamingMorphButtons(
                          context, mainController, 0),
                      WidgetUtils.gamingMorphButtons(
                          context, mainController, 1),
                      WidgetUtils.gamingMorphButtons(
                          context, mainController, 2),
                    ],
                  ),
                ),
            ]),
        if (isDesktop)
          Positioned(
            left: 30,
            bottom: 30,
            child: Obx(
              () => WidgetUtils.ScrollButton(
                  mainController,
                  mainController.gamingController,
                  mainController.isGameScrollDown),
            ),
          ),
      ],
    );
  }
}

class ValorantDetails extends StatelessWidget {
  const ValorantDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ApexDetails extends StatelessWidget {
  const ApexDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class GTADetails extends StatelessWidget {
  const GTADetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class YoutubeDetails extends StatelessWidget {
  const YoutubeDetails(
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
              WidgetUtils.StreamLinkButtons(
                mainController,
                0,
                'youtube',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'i upload clips from my gameplays and live streams to my youtube channel. drop by and show some love if you can. thanks!',
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          (isDesktop)
              ? SizedBox()
              : WidgetUtils.streamMorphButtons(context, mainController, 0,
                  isDesktop: false)
        ],
      ),
    );
  }
}

class TwitchDetails extends StatelessWidget {
  const TwitchDetails(
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
              WidgetUtils.StreamLinkButtons(
                mainController,
                1,
                'twitch',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'i try to stream regularly, as much as i can. i normally just stream for myself. my live streams include games like valorant, apex legends, gta v online, singing sessions, podcasts and coding streams.\nyou can check out my twitch.',
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          (isDesktop)
              ? SizedBox()
              : WidgetUtils.streamMorphButtons(context, mainController, 1,
                  isDesktop: false)
        ],
      ),
    );
  }
}

class DiscordDetails extends StatelessWidget {
  const DiscordDetails(
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
              WidgetUtils.StreamLinkButtons(
                mainController,
                2,
                'discord',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'you can join my discord server. we can have fun together with my friends.',
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          (isDesktop)
              ? SizedBox()
              : WidgetUtils.streamMorphButtons(context, mainController, 2,
                  isDesktop: false)
        ],
      ),
    );
  }
}
