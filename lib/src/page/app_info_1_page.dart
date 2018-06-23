import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:logger/logger.dart';

import 'package:flutter_app/src/page/app_info_2_page.dart';

class AppInfo1Page extends StatefulWidget {
  AppInfo1Page({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _AppInfo1PageState();
  }
}

class _AppInfo1PageState extends State<AppInfo1Page>
    with WidgetsBindingObserver {
  final Logger _log = new Logger(name: "AppInfo1", level: Level.all);

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
        title: const Text("アプリ情報１"),
      ),
      body: new Container(
        child: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Text("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"),
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
