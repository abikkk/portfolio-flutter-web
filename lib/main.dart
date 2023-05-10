import 'package:flutter/material.dart';
import 'package:my_porfolio/Screens/Home.dart';
import 'package:my_porfolio/Utils/Constants.dart';
import 'Controllers/MainController.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  // initController();
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: CONSTANTS.appFont,
    ),
    home: BaseContainer(),
  ));
}

// Future<void> initController() async {
//   Get.put(MainController());
// }

class BaseContainer extends StatelessWidget {
  BaseContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey[100],
        fontFamily: 'Quicksand',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 80.0,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 48.0,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 17.0,
          ),
        ),
      ),
      home: HomeContainer(),
    );
  }
}
