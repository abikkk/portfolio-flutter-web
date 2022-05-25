import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset(
        //   'assets/images/bg.jpg',
        // ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'hi there!',
                  style: TextStyle(fontFamily: 'Quicksand', fontSize: 48),
                ),
                Text(
                  'abik vaidhya',
                  // textAlign:
                  //     TextAlign.end,
                  style: TextStyle(fontFamily: 'Quicksand', fontSize: 85),
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' flutter developer ',
                        style: TextStyle(fontFamily: 'Quicksand', fontSize: 20),
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Text(
                        ' part-time gamer ',
                        style: TextStyle(fontFamily: 'Quicksand', fontSize: 20),
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Text(
                        ' musician ',
                        style: TextStyle(fontFamily: 'Quicksand', fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
