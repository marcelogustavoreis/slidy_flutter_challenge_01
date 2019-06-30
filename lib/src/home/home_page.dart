import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:slidy_flutter_challenge_01/src/home/component/album_list_widget.dart';
import 'package:slidy_flutter_challenge_01/src/home/component/card_song_widget.dart';
import 'package:slidy_flutter_challenge_01/src/home/component/my_sliver_app_bar_widget.dart';
import 'package:slidy_flutter_challenge_01/src/home/component/song_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with TickerProviderStateMixin {
  ScrollController _controller;
  AnimationController _animationController;
  Animation _animationTransformCircle;
  Animation _animationMoveDown;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));

    _animationTransformCircle = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 0.5)));

    _animationMoveDown = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1.0)));

    _controller = ScrollController()
      ..addListener(() {
        double maxSize = sliverHeight - kToolbarHeight;
        double middleSize = maxSize / 2;

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
    setSize(context);

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
          ),
        ],
      ),
    );
  }

  void setSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double statusBarWidth = MediaQuery.of(context).padding.top;

    cardSongPositionedTopMin =
        (sliverHeight + statusBarWidth) - (cardSongHeight / 2);
    cardSongPositionedTopMax = screenHeight - cardSongHeight - 30.0;

    cardSongTextWidth = screenWidth -
        cardSongPaddingLeft -
        cardSongPaddingRight -
        cardSongPlayWidth -
        cardSongImageWidth;

    cardSongPaddingLeftMax =
        screenWidth - cardSongPaddingLeft - cardSongImageWidth;
  }
}
