import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class appLogin extends StatefulWidget {
  const appLogin({Key? key}) : super(key: key);

  @override
  _appLoginState createState() => _appLoginState();
}

class _appLoginState extends State<appLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text('ID'),
            Text('PW'),
            ElevatedButton(onPressed: () {}, child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
