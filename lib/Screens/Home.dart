import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        // onNotification: ((v) {
        //   if (v is ScrollUpdateNotification) {}
        // }),
        child: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Image.asset('images/bg.jpg'),
                Center(
                  child: Column(
                    children: [
                      Text('ID'),
                      Text('PW'),
                      ElevatedButton(onPressed: () {}, child: Text('Login'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
