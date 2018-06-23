import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:logger/logger.dart';

import 'package:flutter_app/src/page/app_info_1_page.dart';

class AppInfo2Page extends StatefulWidget {
  AppInfo2Page({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _AppInfo2PageState();
  }
}

class _AppInfo2PageState extends State<AppInfo2Page>
    with WidgetsBindingObserver {
  final Logger _log = new Logger(name: "AppInfo2", level: Level.all);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print("initState");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    print("dispose");
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("$state (${state.index})");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("アプリ情報２"),
      ),
      body: new Container(
        child: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Text("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: new ButtonBar(
        children: <Widget>[
          new MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("戻る"),
          ),
          new MaterialButton(
            onPressed: () {
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context) => AppInfo1Page()));
            },
            child: const Text("情報１"),
          ),
          new MaterialButton(
            onPressed: () {
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context) => AppInfo2Page()));
            },
            child: const Text("情報２"),
          )
        ],
      ),
    );
  }
}
