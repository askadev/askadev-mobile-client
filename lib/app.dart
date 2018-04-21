import 'package:ask_a_dev_mobile/screens/home.dart';
import 'package:flutter/material.dart';

class AppRoot extends StatefulWidget {
  @override
  _AppRootState createState() => new _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  ThemeData get appTheme {
    return new ThemeData(
      fontFamily: 'Vera',
      primaryColor: const Color.fromRGBO(0, 0, 255, 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: appTheme,
      home: new HomeScreen(),
    );
  }
}
