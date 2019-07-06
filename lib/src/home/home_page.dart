import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:slidy_flutter_challenge_01/src/home/component/album_list_widget.dart';
import 'package:slidy_flutter_challenge_01/src/home/component/card_song_mixin.dart';
import 'package:slidy_flutter_challenge_01/src/home/component/card_song_widget.dart';
import 'package:slidy_flutter_challenge_01/src/home/component/my_sliver_app_bar_widget.dart';
import 'package:slidy_flutter_challenge_01/src/home/component/song_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, CardSongMixin {
  ScrollController _controller;
  AnimationController _animationController;
  AnimationController _animationFlipController;
  AnimationController _animationListenProgressController;
  Animation _animationTransformCircle;
  Animation _animationMoveDown;
  Animation _animationListenProgress;

  Animation _animationFlip;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));

    _animationFlipController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));

    _animationListenProgressController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animationTransformCircle = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.0, 0.5)));

    _animationMoveDown = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.5, 1.0)));

    _animationFlip =
        Tween(begin: 0.0, end: 1.0).animate(_animationFlipController);

    _animationListenProgress =
        Tween(begin: 0.0, end: 1.0).animate(_animationListenProgressController);

    _controller = ScrollController()
      ..addListener(() {
        double maxSize = sliverHeight - kToolbarHeight;

        if (_controller.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (_controller.offset >= 5.0 && _controller.offset <= maxSize) {
            _animationController.forward();
          }
        } else {
          if (_controller.offset >= 5.0 && _controller.offset <= maxSize) {
            _animationController.reverse();
          }
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f3f5),
      body: Stack(
        children: <Widget>[
          MySliverAppBar(
            controller: _controller,
            children: <Widget>[
              SongList(),
              AlbumList(),
            ],
          ),
          CardSong(
            animationTransformCircle: _animationTransformCircle,
            animationMoveDown: _animationMoveDown,
            animationFlip: _animationFlip,
            animationFlipController: _animationFlipController,
            animationListenProgress: _animationListenProgress,
            animationListenProgressController:
                _animationListenProgressController,
          ),
        ],
      ),
    );
  }
}
