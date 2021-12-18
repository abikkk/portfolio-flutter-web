import 'package:flutter/cupertino.dart';

class SocialsContainer extends StatefulWidget {
  const SocialsContainer({Key? key}) : super(key: key);

  @override
  _SocialsContainerState createState() => _SocialsContainerState();
}

class _SocialsContainerState extends State<SocialsContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('images/bg-022.jpg', fit: BoxFit.cover),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Text('FB'),
            ),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Text('Instagram'),
            ),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Text('Twitch'),
            ),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Text('YT'),
            ),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Text('Twitter'),
            ),
          ],
        ),
      ],
    );
  }
}
