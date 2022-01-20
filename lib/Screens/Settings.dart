import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text('Font: '),
              InkWell(
                  onTap: () {
                    print('## APP FONT: Quicksand');
                  },
                  child: Text('Quicksand')),
            ],
          ),
          Row(
            children: [
              Text('Theme: '),
              InkWell(
                  onTap: () {
                    print('## APP THEME: LITE');
                  },
                  child: Text('Lite')),
            ],
          ),
          Row(
            children: [
              Text('App Color: '),
              InkWell(
                  onTap: () {
                    print('## APP COLOR: RED');
                  },
                  child: Text('Red')),
            ],
          ),
        ],
      ),
    );
  }
}
