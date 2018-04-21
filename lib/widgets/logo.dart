import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class StaticLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Image.asset('assets/images/Curly.png'),
    );
  }
}

// Use for loading screens
class AnimatedLogoWidget extends StatefulWidget {
  @override
  _AnimatedLogoWidget createState() => new _AnimatedLogoWidget();
}

class _AnimatedLogoWidget extends State<AnimatedLogoWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addListener(() {
        setState(() {
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedLogo(animation: animation);
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  static final _opacityTween = new Tween<double>(begin: 0.01, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 80.0, end: 129.0);

  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: new Container(
          height: _sizeTween.evaluate(animation),
          child: new Image.asset('assets/images/Curly.png'),
        ),
      ),
    );
  }
}
