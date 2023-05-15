import 'package:flutter/material.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';
import '../Controllers/MainController.dart';

class DesktopGamingScreen extends StatelessWidget {
  DesktopGamingScreen({Key? key, required this.mainController})
      : super(key: key);

  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return PageView(
        pageSnapping: true,
        allowImplicitScrolling: true,
        scrollDirection: Axis.vertical,
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
                    scrollDirection: Axis.vertical,
                    children: [
                      YoutubeDetails(
                        mainController: mainController,
                      ),
                      TwitchDetails(
                        mainController: mainController,
                      ),
                      DiscordDetails(
                        mainController: mainController,
                      ),
                    ],
                    controller: mainController.streamController,
                  ),
                ),
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

          // games
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetUtils.gamingMorphButtons(context, mainController, 0),
                WidgetUtils.gamingMorphButtons(context, mainController, 1),
                WidgetUtils.gamingMorphButtons(context, mainController, 2),
              ],
            ),
          ),
        ]);
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
  const YoutubeDetails({Key? key, required this.mainController})
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
        ],
      ),
    );
  }
}

class TwitchDetails extends StatelessWidget {
  const TwitchDetails({Key? key, required this.mainController})
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
              WidgetUtils.StreamLinkButtons(
                mainController,
                1,
                'twitch',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
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
        ],
      ),
    );
  }
}

class DiscordDetails extends StatelessWidget {
  const DiscordDetails({Key? key, required this.mainController})
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
              WidgetUtils.StreamLinkButtons(
                mainController,
                2,
                'discord',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
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
        ],
      ),
    );
  }
}

class GamingScreen extends StatelessWidget {
  const GamingScreen({Key? key, required this.mainController})
      : super(key: key);
  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      allowImplicitScrolling: true,
      scrollDirection: Axis.horizontal,
      children: [
        YoutubeDetails(
          mainController: mainController,
        ),
        TwitchDetails(
          mainController: mainController,
        ),
        DiscordDetails(
          mainController: mainController,
        ),
      ],
      controller: mainController.streamController,
    );
  }
}
