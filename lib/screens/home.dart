import 'package:ask_a_dev_mobile/widgets/logo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Ask A Dev'),
      ),
      body: new Center(
        child: new AnimatedLogoWidget(),
      ),
    );
  }
}
