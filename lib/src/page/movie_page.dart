import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:video_player/video_player.dart';

///
/// 動画例
///

class MoviePage extends StatefulWidget {
  MoviePage({Key key, @required this.onBack}) : super(key: key);

  final VoidCallback onBack;

  @override
  State<StatefulWidget> createState() {
    return new _MoviePageState();
  }
}

class _MoviePageState extends State<MoviePage> {
  VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = new VideoPlayerController.network(
      'https://www.sample-videos.com/video/mp4/240/big_buck_bunny_240p_10mb.mp4',
    )
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(
      children: <Widget>[
        new Expanded(
          child: new Center(
            child: new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new AspectRatio(
                aspectRatio: 320 / 240,
                child: new VideoPlayer(_controller),
              ),
            ),
          ),
        ),
        new CupertinoButton(
          child: new Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: _controller.value.isPlaying
              ? _controller.pause
              : _controller.play,
        )
      ],
    ));
  }
}
