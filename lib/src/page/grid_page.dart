import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///
/// グリッド例
///

class GridPage extends StatefulWidget {
  GridPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _GridPageState();
  }
}

class _GridPageState extends State<GridPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return new Container(
        child: new Opacity(
      opacity: animation.value,
      child: new Column(
        children: <Widget>[
          new Container(
              constraints: const BoxConstraints(maxHeight: 80.0),
              child: new Image.network(
                  "https://flutter.co/site/img/flutter-logo.png"),
              padding: const EdgeInsets.all(10.0)),
          new Container(
            child: new Text(new DateTime.now().toIso8601String()),
          ),
          new Expanded(
            child: new Container(
              padding: const EdgeInsets.all(10.0),
              child: new CustomScrollView(
                slivers: <Widget>[
                  new SliverGrid(
                    gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: size.width / 7.0,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 0.0,
                      childAspectRatio: 1.0,
                    ),
                    delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return new Container(
                          alignment: Alignment.center,
                          color: Colors.teal[100 * (index % 9)],
                          child: new Text('grid item $index'),
                        );
                      },
                      childCount: 1000,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
