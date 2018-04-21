import 'package:ask_a_dev_mobile/models/app_state.dart';
import 'package:ask_a_dev_mobile/models/app_state_container.dart';
import 'package:ask_a_dev_mobile/widgets/logo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  AppState appState;

  Widget get _pageToDisplay {
    if (appState.isLoading) {
      return _loadingView;
    } else {
      return _homeView;
    }
  }

  Widget get _loadingView {
    return new Center(
      child: new AnimatedLogoWidget(),
    );
  }

  Widget get _homeView {
    return new Center(
      child: new Text('Hey Hey what can I do?'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var container = AppStateContainer.of(context);
    appState = container.state;
    Widget body = _pageToDisplay;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Ask A Dev'),
      ),
      body: body,
    );
  }
}
