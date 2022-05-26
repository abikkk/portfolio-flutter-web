import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Utils/UiUtils.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen>
    with TickerProviderStateMixin {
  bool scClicked = false,
      blClicked = false,
      playClicked = false,
      isPlaying = false;
  double scScale = 0, bdScale = 0;
  // late AnimationController _playPause;
  // Duration position = new Duration(), duration = new Duration();
  // AudioPlayer musicPlayer = new AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _playPause =
    //     AnimationController(vsync: this, duration: Duration(microseconds: 150));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _playPause.dispose();
  }

  openLinkDialog() {
    return Get.defaultDialog(
        title: 'links:',
        titleStyle: TextStyle(fontStyle: FontStyle.normal),
        content: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: InkWell(
                  onTap: () async {
                    openLink('soundcloud');
                  },
                  child: MouseRegion(
                    onEnter: (a) {
                      setState(() {
                        scScale = MediaQuery.of(context).size.height * .2;
                      });
                    },
                    onExit: (a) {
                      setState(() {
                        scScale = MediaQuery.of(context).size.height * .18;
                      });
                    },
                    child: Card(
                      child: Wrap(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: !scClicked
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
                              padding: const EdgeInsets.all(5.0),
                              child: AnimatedContainer(
                                height: scScale != 0.0
                                    ? scScale
                                    : MediaQuery.of(context).size.height * .18,
                                duration: Duration(milliseconds: 150),
                                child: Image.asset(
                                  'images/soundcloud.png',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () async {
                    openLink('bandlabs');
                  },
                  child: MouseRegion(
                    onEnter: (a) {
                      setState(() {
                        bdScale = MediaQuery.of(context).size.height * .2;
                      });
                    },
                    onExit: (a) {
                      setState(() {
                        bdScale = MediaQuery.of(context).size.height * .18;
                      });
                    },
                    child: Card(
                      child: Wrap(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: !blClicked
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
                              padding: const EdgeInsets.all(5.0),
                              child: AnimatedContainer(
                                height: bdScale != 0.0
                                    ? bdScale
                                    : MediaQuery.of(context).size.height * .18,
                                duration: Duration(milliseconds: 150),
                                child: Image.asset(
                                  'images/bandlab.png',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height / 1.11) - 10,
      child: Column(
        children: [
          Expanded(
            // flex: 2,
            child: Center(
              child: Text(
                'listen to my music',
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                ' ',
                                textAlign: TextAlign.center,
                              )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    'title',
                                    textAlign: TextAlign.center,
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    'album',
                                    textAlign: TextAlign.center,
                                  )),
                              // Expanded(child: Text('links')),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              openLinkDialog();
                            },
                            child: Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AnimatedOpacity(
                                        duration: Duration(milliseconds: 100),
                                        opacity: 0,
                                        child: Icon(Icons.play_arrow_rounded)),
                                    Text(
                                      '1',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      'tmi aayenau',
                                      textAlign: TextAlign.center,
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      'single',
                                      textAlign: TextAlign.center,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              openLinkDialog();
                            },
                            child: Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AnimatedOpacity(
                                        duration: Duration(milliseconds: 100),
                                        opacity: 0,
                                        child: Icon(Icons.play_arrow_rounded)),
                                    Text(
                                      '2',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      'midnight salvation',
                                      textAlign: TextAlign.center,
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      'midnight salvation',
                                      textAlign: TextAlign.center,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              openLinkDialog();
                            },
                            child: Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AnimatedOpacity(
                                        duration: Duration(milliseconds: 100),
                                        opacity: 0,
                                        child: Icon(Icons.play_arrow_rounded)),
                                    Text(
                                      '3',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      'goodmorning sunshine',
                                      textAlign: TextAlign.center,
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      'midnight salvation',
                                      textAlign: TextAlign.center,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //         VerticalDivider(
                  //           thickness: 1,
                  //         ),
                  // Expanded(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Icon(
                  //         Icons.music_note_rounded,
                  //         size: MediaQuery.of(context).size.width / 8,
                  //       ),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           Container(
                  //               child: InkWell(
                  //                   onTap: () {
                  //                     playClicked = !playClicked;
                  //                     if (playClicked)
                  //                       setState(() {
                  //                         _playPause.forward();
                  //                       });
                  //                     else
                  //                       setState(() {
                  //                         _playPause.reverse();
                  //                       });
                  //                   },
                  //                   child: Icon(
                  //                       Icons.arrow_back_ios_new_rounded))),
                  //           Container(
                  //               child: InkWell(
                  //             onTap: () {
                  //               playClicked = !playClicked;
                  //               if (playClicked)
                  //                 setState(() {
                  //                   _playPause.forward();
                  //                 });
                  //               else
                  //                 setState(() {
                  //                   _playPause.reverse();
                  //                 });
                  //             },
                  //             child: AnimatedIcon(
                  //               icon: AnimatedIcons.play_pause,
                  //               progress: _playPause,
                  //               size: MediaQuery.of(context).size.width / 20,
                  //             ),
                  //           )),
                  //           Container(
                  //               child: InkWell(
                  //                   onTap: () {
                  //                     playClicked = !playClicked;
                  //                     if (playClicked)
                  //                       setState(() {
                  //                         _playPause.forward();
                  //                       });
                  //                     else
                  //                       setState(() {
                  //                         _playPause.reverse();
                  //                       });
                  //                   },
                  //                   child:
                  //                       Icon(Icons.arrow_forward_ios_rounded))),
                  //         ],
                  //       ),
                  //       _seekBar(),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           Center(
                  //             child: InkWell(
                  //               onTap: () async {
                  //                 openLink('soundcloud');
                  //               },
                  //               child: MouseRegion(
                  //                 onEnter: (a) {
                  //                   setState(() {
                  //                     scScale =
                  //                         MediaQuery.of(context).size.height *
                  //                             .06;
                  //                   });
                  //                 },
                  //                 onExit: (a) {
                  //                   setState(() {
                  //                     scScale =
                  //                         MediaQuery.of(context).size.height *
                  //                             .05;
                  //                   });
                  //                 },
                  //                 child: Card(
                  //                   child: Wrap(
                  //                     children: [
                  //                       AnimatedContainer(
                  //                         duration: Duration(milliseconds: 100),
                  //                         decoration: BoxDecoration(
                  //                             color: Colors.white,
                  //                             borderRadius:
                  //                                 BorderRadius.circular(15),
                  //                             boxShadow: !scClicked
                  //                                 ? [
                  //                                     BoxShadow(
                  //                                         color:
                  //                                             Colors.grey[500]!,
                  //                                         offset: Offset(4, 4),
                  //                                         blurRadius: 15,
                  //                                         spreadRadius: 1),
                  //                                     BoxShadow(
                  //                                         color: Colors.white,
                  //                                         offset:
                  //                                             Offset(-4, -4),
                  //                                         blurRadius: 15,
                  //                                         spreadRadius: 1)
                  //                                   ]
                  //                                 : null),
                  //                         child: Padding(
                  //                           padding: const EdgeInsets.all(5.0),
                  //                           child: AnimatedContainer(
                  //                             height: scScale != 0.0
                  //                                 ? scScale
                  //                                 : MediaQuery.of(context)
                  //                                         .size
                  //                                         .height *
                  //                                     .05,
                  //                             duration:
                  //                                 Duration(milliseconds: 150),
                  //                             child: Image.asset(
                  //                               'images/soundcloud.png',
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           Center(
                  //             child: InkWell(
                  //               onTap: () async {
                  //                 openLink('bandlabs');
                  //               },
                  //               child: MouseRegion(
                  //                 onEnter: (a) {
                  //                   setState(() {
                  //                     bdScale =
                  //                         MediaQuery.of(context).size.height *
                  //                             .06;
                  //                   });
                  //                 },
                  //                 onExit: (a) {
                  //                   setState(() {
                  //                     bdScale =
                  //                         MediaQuery.of(context).size.height *
                  //                             .05;
                  //                   });
                  //                 },
                  //                 child: Card(
                  //                   child: Wrap(
                  //                     children: [
                  //                       AnimatedContainer(
                  //                         duration: Duration(milliseconds: 100),
                  //                         decoration: BoxDecoration(
                  //                             color: Colors.white,
                  //                             borderRadius:
                  //                                 BorderRadius.circular(15),
                  //                             boxShadow: !blClicked
                  //                                 ? [
                  //                                     BoxShadow(
                  //                                         color:
                  //                                             Colors.grey[500]!,
                  //                                         offset: Offset(4, 4),
                  //                                         blurRadius: 15,
                  //                                         spreadRadius: 1),
                  //                                     BoxShadow(
                  //                                         color: Colors.white,
                  //                                         offset:
                  //                                             Offset(-4, -4),
                  //                                         blurRadius: 15,
                  //                                         spreadRadius: 1)
                  //                                   ]
                  //                                 : null),
                  //                         child: Padding(
                  //                           padding: const EdgeInsets.all(5.0),
                  //                           child: AnimatedContainer(
                  //                             height: bdScale != 0.0
                  //                                 ? bdScale
                  //                                 : MediaQuery.of(context)
                  //                                         .size
                  //                                         .height *
                  //                                     .05,
                  //                             duration:
                  //                                 Duration(milliseconds: 150),
                  //                             child: Image.asset(
                  //                               'images/bandlab.png',
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _seekBar() {
  //   return Slider.adaptive(
  //       inactiveColor: Colors.grey[100],
  //       activeColor: Colors.grey,
  //       thumbColor: Colors.black87,
  //       min: 0.0,
  //       max: position.inSeconds.toDouble(),
  //       value: duration.inSeconds.toDouble(),
  //       onChanged: (seekVal) {});
  // }
}
