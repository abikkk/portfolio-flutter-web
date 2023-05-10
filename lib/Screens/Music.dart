import 'package:flutter/material.dart';
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
    return Column(
      children: [
        Center(
          child: Text(
            'listen to my music',
            style: TextStyle(fontSize: 48),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
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
      ],
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
