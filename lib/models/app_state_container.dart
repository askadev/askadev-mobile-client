import 'package:ask_a_dev_mobile/models/app_state.dart';
import 'package:flutter/foundation.dart';
/// This class is *basically* a Redux Store.
/// It's the apps central storage.

import 'package:flutter/material.dart';

import 'dart:async';

class AppStateContainer extends StatefulWidget {
  final AppState state;
  final Widget child;

  AppStateContainer({
    @required this.child,
    this.state,
  });

  /// The 'of' method is a Flutter convention used to access
  /// 'Global' state from anywhere in your app.
  /// In order to access this Apps state in your build methods...
  ///
  /// Widget build(BuildContext context) {
  ///   var appState = AppStateContainer.of(context);
  ///   // You could get a prop called current user:
  ///   var currentUser = appState.currentUser
  ///   // Or call a method (similar to Redux Action)
  ///   appState.logIn();
  ///
  static _AppStateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
    as _InheritedStateContainer)
        .data;
  }

  @override
  _AppStateContainerState createState() => new _AppStateContainerState();
}

class _AppStateContainerState extends State<AppStateContainer> {
  AppState state;

  @override
  void initState() {
    super.initState();
    state = new AppState.loading();
    startCountdown();
  }

  /// Fake loading some configuration to test
  /// App isLoading state
  Future<Null> startCountdown() async {
    const timeOut = const Duration(seconds: 4);
    new Timer(timeOut, () {
      setState(() => state.isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final _AppStateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
