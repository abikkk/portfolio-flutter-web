import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

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
