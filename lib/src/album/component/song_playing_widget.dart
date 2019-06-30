import 'package:flutter/material.dart';

class SongPlaying extends StatefulWidget {
  @override
  _SongPlayingState createState() => _SongPlayingState();
}

class _SongPlayingState extends State<SongPlaying>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animationTransformCircle;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    _animationTransformCircle =
        Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 56,
        right: 20,
        width: 45.0,
        height: 45.0,
        child: AnimatedBuilder(
          animation: _animationTransformCircle,
          builder: (context, widget) {
            return Transform.rotate(
              angle: _animationTransformCircle.value * 6.3,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(45.0)),
                child: Image.network(
                  "https://e-cdns-images.dzcdn.net/images/cover/a4f27af1979fea932093403aa14e549c/264x264-000000-80-0-0.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ));
  }
}
