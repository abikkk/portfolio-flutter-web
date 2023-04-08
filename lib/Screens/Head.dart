import 'package:flutter/material.dart';

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
        Container(
          height: (MediaQuery.of(context).size.height / 1.11) - 10,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'hi there!',
                  style: TextStyle(fontSize: 48),
                ),
                Text(
                  'abik vaidhya',
                  // textAlign:
                  //     TextAlign.end,
                  style: TextStyle(fontSize: 85),
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' flutter developer ',
                        style: TextStyle(fontSize: 20),
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Text(
                        ' part-time gamer ',
                        style: TextStyle(fontSize: 20),
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Text(
                        ' musician ',
                        style: TextStyle(fontSize: 20),
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
