import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:zoomable_image/zoomable_image.dart';

///
/// 写真例
///

class PhotoPage extends StatefulWidget {
  PhotoPage({Key key, @required this.onBack}) : super(key: key);

  final VoidCallback onBack;

  @override
  State<StatefulWidget> createState() {
    return new _PhotoPageState();
  }
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new ZoomableImage(
            new NetworkImage(
                "http://asiabizz.com/wp-content/uploads/2015/07/Mount-fuji.jpg"),
            placeholder: const Center(child: const CircularProgressIndicator()),
            backgroundColor: Colors.red),
      ),
    );
  }
}
