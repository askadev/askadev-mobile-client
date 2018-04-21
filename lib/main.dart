import 'package:ask_a_dev_mobile/app.dart';
import 'package:ask_a_dev_mobile/models/app_state_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new AppStateContainer(
    child: new AppRoot(),
  ));
}
