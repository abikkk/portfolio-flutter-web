import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image(
              image: AssetImage('images/profile_shot.png'),
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'hi there!',
                style: TextStyle(fontSize: 48),
              ),
              Text(
                'abik vaidhya',
                style: TextStyle(fontSize: 85),
              ),
              IntrinsicHeight(
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ' frontend developer ',
                        style: TextStyle(fontSize: 20),
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Text(
                        ' gamer ',
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
