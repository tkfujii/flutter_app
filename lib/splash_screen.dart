import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///
/// スプラッシュスクリーン
///

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, @required this.onNext}) : super(key: key);

  final VoidCallback onNext;

  @override
  State<StatefulWidget> createState() {
    return new _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = new Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();

    new Future.delayed(const Duration(seconds: 4)).whenComplete(() {
      _onNext();
    });
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onNext() {
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Opacity(
            opacity: animation.value,
            child: new Container(
              padding: const EdgeInsets.all(20.0),
              child: new Image.network(
                  "https://flutter.co/site/img/flutter-logo.png"),
            )));
  }
}
