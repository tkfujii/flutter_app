import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///
/// ログイン例
///

class LoginPage extends StatefulWidget {
  LoginPage({Key key, @required this.onLogin}) : super(key: key);

  final VoidCallback onLogin;

  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtMail = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();

  void _onLogin() {
    widget.onLogin();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Column(
        children: <Widget>[
//          new Padding(
//              child: new Image.network(
//                  "https://flutter.co/site/img/flutter-logo.png"),
//              padding: const EdgeInsets.all(20.0)),
          new Container(
            decoration: new BoxDecoration(
              color: const Color(0xffffffff),
              border: new Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: new Column(
              children: <Widget>[
                new TextField(
                  decoration: new InputDecoration(
                      hintText: "メールアドレス",
                      contentPadding: new EdgeInsets.all(10.0)),
                ),
                new TextField(
                  decoration: new InputDecoration(
                      hintText: "パスワード",
                      contentPadding: new EdgeInsets.all(10.0)),
                ),
              ],
            ),
          ),
          new Container(
            padding: new EdgeInsets.all(20.0),
            child: new CupertinoButton(
              child: const Text("ログイン"),
              onPressed: _onLogin,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
