import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_porfolio/Screens/Contact.dart';
import 'package:my_porfolio/Screens/Socials.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  double bgTop = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {
            setState(() {
              // bgTop = bgTop - v.scrollDelta! / 7;
            });
          }
          return true;
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                  top: bgTop,
                  left: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'images/bg-012.jpg',
                      fit: BoxFit.cover,
                      // fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                  top: bgTop + MediaQuery.of(context).size.height,
                  left: 0,
                  child: Image.asset('images/bg-022.jpg', fit: BoxFit.cover)),
              // child: Container(
              //   color: Colors.greenAccent,
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height,
              // )),
              Wrap(
                children: [
                  Column(
                    children: [
                      Center(
                        child: Container(
                          // height: MediaQuery.of(context).size.height / 1,
                          // width: MediaQuery.of(context).size.width / 1,
                          // padding: EdgeInsets.all(50),
                          margin:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                          decoration: new BoxDecoration(
                            // color: Colors.white10,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.1,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  'Hi there!',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Quicksand',
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                                Text(
                                                                  'Abik Vaidhya',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Quicksand',
                                                                      fontSize:
                                                                          80),
                                                                ),
                                                                Text(
                                                                  'Flutter Developer',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Quicksand',
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                                Expanded(
                                                  flex: 3,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                // vertical: 5,
                                                                horizontal: 10),
                                                        child: Text(
                                                          'About',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Quicksand',
                                                              fontSize: 80),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 20,
                                                                horizontal:
                                                                    10.0),
                                                        child: Text(
                                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Elit eget gravida cum sociis. A diam maecenas sed enim. Mattis ullamcorper velit sed ullamcorper. Elementum integer enim neque volutpat ac. Id semper risus in hendrerit gravida rutrum quisque non tellus. Ac felis donec et odio pellentesque diam volutpat commodo. Dis parturient montes nascetur ridiculus mus mauris vitae ultricies leo. Mus mauris vitae ultricies leo integer malesuada nunc. Maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum.',
                                                          textAlign:
                                                              TextAlign.right,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Quicksand',
                                                              fontSize: 20,
                                                              // color: Colors.grey[700],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                              child: Container(
                                            color: Colors.white12,
                                            // child: Image.asset(
                                            //   'images/profile.jpg',
                                            //   fit: BoxFit.contain,
                                            // ),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // NAV BAR
                      Container(
                        decoration: new BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8)),
                        ),
                        height: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).size.height / 1.1,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Expanded(
                                child: InkWell(
                                    onTap: () {},
                                    child: Center(
                                        child: Text(
                                      'Home',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.grey[800]),
                                    )))),
                            Expanded(
                                child: InkWell(
                                    child: Center(
                                        child: Text(
                              'Social',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w100),
                            )))),
                            Expanded(
                                child: InkWell(
                                    child: Center(
                                        child: Text(
                              'Skills',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w100),
                            )))),
                            Expanded(
                                child: InkWell(
                                    child: Center(
                                        child: Text(
                              'Offering',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w100),
                            )))),
                            Expanded(
                                child: InkWell(
                                    child: Center(
                                        child: Text(
                              'Video',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w100),
                            )))),
                            Expanded(
                                child: InkWell(
                                    child: Center(
                                        child: Text(
                              'Recent Works',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w100),
                            )))),
                            Expanded(
                                child: InkWell(
                                    child: Center(
                                        child: Text(
                              'Contact Me',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w100),
                            )))),
                          ],
                        ),
                      ),

                      // SOCIALS CONTAINER
                      SocialsContainer(),

                      // CONTACT CONTAINER
                      ContactContainer(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
