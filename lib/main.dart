import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_app/splash_screen.dart';
import 'package:flutter_app/src/page/login_page.dart';
import 'package:flutter_app/src/page/grid_page.dart';
import 'package:flutter_app/src/page/photo_page.dart';
import 'package:flutter_app/src/page/movie_page.dart';

///
/// アプリケーションクラス、Widgetのコントローラを内包します。
///

void main() => runApp(new MyApp());

enum PageItem {
  splash,
  login,
  grid,
  photo,
  movie,
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new PageController(),
    );
  }
}

class PageController extends StatefulWidget {
  PageController({Key key}) : super(key: key);

  final String title;

  @override
  _PageControllerState createState() => new _PageControllerState();
}

class _PageControllerState extends State<PageController> {
  PageItem pageItem = PageItem.splash;

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar = null;
    Widget content = null;
    Widget bottomBar = null;

    switch (pageItem) {
      case PageItem.splash:
        {
          content = new SplashScreen(
            onNext: () {
              setState(() {
                pageItem = PageItem.login;
              });
            },
          );
          break;
        }
      case PageItem.login:
        {
          appBar = new AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          );
          content = new LoginPage(
            onLogin: () {
              setState(() {
                pageItem = PageItem.grid;
              });
            },
          );
          break;
        }
      case PageItem.grid:
        {
          appBar = new AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          );
          content = new GridPage();
          bottomBar = new CupertinoNavigationBar(
            leading: new CupertinoButton(
                child: const Text("PHOTO"),
                onPressed: () {
                  setState(() {
                    pageItem = PageItem.photo;
                  });
                }),
            trailing: new CupertinoButton(
                child: const Text("MOVIE"),
                onPressed: () {
                  setState(() {
                    pageItem = PageItem.movie;
                  });
                }),
          );
          break;
        }
      case PageItem.photo:
        {
          appBar = new AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          );
          content = new PhotoPage(onBack: () {});
          bottomBar = new CupertinoNavigationBar(
            leading: new CupertinoButton(
                child: const Text("GRID"),
                onPressed: () {
                  setState(() {
                    pageItem = PageItem.grid;
                  });
                }),
            trailing: new CupertinoButton(
                child: const Text("MOVIE"),
                onPressed: () {
                  setState(() {
                    pageItem = PageItem.movie;
                  });
                }),
          );
          break;
        }
      case PageItem.movie:
        {
          appBar = new AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          );
          content = new MoviePage(onBack: () {});
          bottomBar = new CupertinoNavigationBar(
            leading: new CupertinoButton(
                child: const Text("GRID"),
                onPressed: () {
                  setState(() {
                    pageItem = PageItem.grid;
                  });
                }),
            trailing: new CupertinoButton(
                child: const Text("PHOTO"),
                onPressed: () {
                  setState(() {
                    pageItem = PageItem.photo;
                  });
                }),
          );
          break;
        }
    }

    return new Scaffold(
      appBar: appBar,
      body: content,
      bottomNavigationBar: bottomBar,
    );
  }
}
