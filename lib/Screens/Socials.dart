import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialsContainer extends StatefulWidget {
  const SocialsContainer({Key? key}) : super(key: key);

  @override
  _SocialsContainerState createState() => _SocialsContainerState();
}

class _SocialsContainerState extends State<SocialsContainer> {
  bool fbClicked = false,
      igClicked = false,
      twitchClicked = false,
      ytClicked = false,
      twitterClicked = false,
      linkdClicked = false;

  openLink(type) async {
    switch (type) {
      case 'fb':
        {
          if (!await launchUrl(
              Uri.parse("https://www.facebook.com/abik.vaidhya")))
            throw 'Could not launch Facebook Link!';
          break;
        }
      case 'ig':
        {
          if (!await launchUrl(
              Uri.parse('https://www.instagram.com/_abik.vaidhya_/')))
            throw 'Could not launch Instagram Link!';
        }
        break;
      case 'twitch':
        {
          if (!await launchUrl(Uri.parse('https://www.twitch.tv/oogiebuugie')))
            throw 'Could not launch Twitch Link!';
        }
        break;
      case 'yt':
        {
          if (!await launchUrl(Uri.parse(
              'https://www.youtube.com/channel/UCaPj2jBIWUN7nZQWfyRr1pg')))
            throw 'Could not launch YouTube Link!';
        }
        break;
      case 'twitter':
        {
          if (!await launchUrl(
              Uri.parse('https://www.facebook.com/abik.vaidhya')))
            throw 'Could not launch Twitter Link!';
        }
        break;
      case 'linkd':
        {
          if (!await launchUrl(
              Uri.parse('https://www.linkedin.com/in/abik-vaidhya-b9550520b')))
            throw 'Could not launch LinkedIn Link!';
        }
        break;
      case 'email':
        {
          if (!await launchUrl(
              Uri.parse('https://www.facebook.com/abik.vaidhya')))
            throw 'Could not launch facebook Link!';
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      fbClicked = !fbClicked;
                      openLink('fb');
                    });

                    // delay
                    Future.delayed(const Duration(milliseconds: 150), () {
                      setState(() {
                        fbClicked = !fbClicked;
                      });
                      openLink('fb');
                    });
                  },
                  child: Wrap(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: !fbClicked
                                ? [
                                    BoxShadow(
                                        color: Colors.grey[500]!,
                                        offset: Offset(4, 4),
                                        blurRadius: 15,
                                        spreadRadius: 1),
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4, -4),
                                        blurRadius: 15,
                                        spreadRadius: 1)
                                  ]
                                : null),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Image.asset(
                            'assets/images/fb.png',
                            scale: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      igClicked = !igClicked;
                    });
                    Future.delayed(const Duration(milliseconds: 150), () {
                      setState(() {
                        igClicked = !igClicked;
                      });
                      openLink('ig');
                    });
                  },
                  child: Wrap(
                    children: [
                      AnimatedContainer(
                        // height: 100,
                        // width: 100,
                        duration: Duration(milliseconds: 100),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: !igClicked
                                ? [
                                    BoxShadow(
                                        color: Colors.grey[500]!,
                                        offset: Offset(4, 4),
                                        blurRadius: 15,
                                        spreadRadius: 1),
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4, -4),
                                        blurRadius: 15,
                                        spreadRadius: 1)
                                  ]
                                : null),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Image.asset(
                            'assets/images/ig.png',
                            scale: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      twitchClicked = !twitchClicked;
                    });
                    Future.delayed(const Duration(milliseconds: 150), () {
                      setState(() {
                        twitchClicked = !twitchClicked;
                      });
                      openLink('twitch');
                    });
                  },
                  child: Wrap(
                    children: [
                      AnimatedContainer(
                        // height: 100,
                        // width: 100,
                        duration: Duration(milliseconds: 100),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: !twitchClicked
                                ? [
                                    BoxShadow(
                                        color: Colors.grey[500]!,
                                        offset: Offset(4, 4),
                                        blurRadius: 15,
                                        spreadRadius: 1),
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4, -4),
                                        blurRadius: 15,
                                        spreadRadius: 1)
                                  ]
                                : null),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Image.asset(
                            'assets/images/twitch.png',
                            scale: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      ytClicked = !ytClicked;
                    });
                    Future.delayed(const Duration(milliseconds: 150), () {
                      setState(() {
                        ytClicked = !ytClicked;
                      });
                      openLink('yt');
                    });
                  },
                  child: Wrap(
                    children: [
                      AnimatedContainer(
                        // height: 100,
                        // width: 100,
                        duration: Duration(milliseconds: 100),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: !ytClicked
                                ? [
                                    BoxShadow(
                                        color: Colors.grey[500]!,
                                        offset: Offset(4, 4),
                                        blurRadius: 15,
                                        spreadRadius: 1),
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4, -4),
                                        blurRadius: 15,
                                        spreadRadius: 1)
                                  ]
                                : null),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Image.asset(
                            'assets/images/yt.png',
                            scale: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      twitterClicked = !twitterClicked;
                    });
                    Future.delayed(const Duration(milliseconds: 150), () {
                      setState(() {
                        twitterClicked = !twitterClicked;
                      });
                      openLink('twitter');
                    });
                  },
                  child: AnimatedContainer(
                    // height: 100,
                    // width: 100,
                    duration: Duration(milliseconds: 100),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: !twitterClicked
                            ? [
                                BoxShadow(
                                    color: Colors.grey[500]!,
                                    offset: Offset(4, 4),
                                    blurRadius: 15,
                                    spreadRadius: 1),
                                BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4, -4),
                                    blurRadius: 15,
                                    spreadRadius: 1)
                              ]
                            : null),
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Image.asset(
                        'assets/images/twitter.png',
                        scale: 5,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      linkdClicked = !linkdClicked;
                    });
                    Future.delayed(const Duration(milliseconds: 150), () {
                      setState(() {
                        linkdClicked = !linkdClicked;
                      });
                      openLink('linkd');
                    });
                  },
                  child: AnimatedContainer(
                    // height: 100,
                    // width: 100,
                    duration: Duration(milliseconds: 100),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: !linkdClicked
                            ? [
                                BoxShadow(
                                    color: Colors.grey[500]!,
                                    offset: Offset(4, 4),
                                    blurRadius: 15,
                                    spreadRadius: 1),
                                BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4, -4),
                                    blurRadius: 15,
                                    spreadRadius: 1)
                              ]
                            : null),
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Image.asset(
                        'assets/images/linkd.png',
                        scale: 5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
