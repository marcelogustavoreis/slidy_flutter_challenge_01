import 'package:flutter/material.dart';
import 'package:slidy_flutter_challenge_01/src/album/album_page.dart';

double cardSongPositionedTopMin;
double cardSongPositionedTopMax;
double cardSongPaddingLeft = 20.0;
double cardSongPaddingRight = 20.0;

const double cardSongHeight = 70.0;

const double cardSongPlayWidth = 34.0;
const double cardSongImageWidth = 70.0;
double cardSongTextWidth;

const double cardSongPaddingLeftMin = 20.0;
double cardSongPaddingLeftMax;

double borderLeftRadiusLeft = 5.0;
double borderLeftRadiusRight = 0.0;
double borderRightRadiusRight = 5.0;

const double cardSongPlayIconPaddingRight = 10.0;

class CardSong extends StatelessWidget {
  Animation animationTransformCircle;
  Animation animationMoveDown;

  CardSong({this.animationTransformCircle, this.animationMoveDown});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationMoveDown,
      builder: (context, child) {
        return AnimatedBuilder(
          animation: animationTransformCircle,
          builder: (context, child) {
            double cardSongPaddingLeft = calculateCardSongPaddingLeft();
            double cardSongTextWidth = calculateCardSongTextHeight();
            double cardSongPlayWidth = calculateCardSongPlayWidth();
            double cardSongPlayPositionedTop =
                calculateCardSongPlayPositionedTop();

            if (animationTransformCircle.status == AnimationStatus.completed) {
              setBordersToAnimated();
            } else if (animationTransformCircle.status ==
                AnimationStatus.dismissed) {
              setBordersToDefault();
            } else if (animationTransformCircle.status ==
                    AnimationStatus.forward ||
                animationTransformCircle.status == AnimationStatus.reverse) {
              setBordersToAnimating();
            }

            if (animationMoveDown.value > 0) {
              setBordersToAnimated();
            }

            return Positioned(
              top: cardSongPlayPositionedTop,
              left: cardSongPaddingLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Transform.rotate(
                    angle: animationMoveDown.value * -6.3,
                    child: CardSongImage(),
                  ),
                  Container(
                    height: cardSongHeight,
                    width: cardSongTextWidth + cardSongPlayWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(borderRightRadiusRight),
                        bottomRight: Radius.circular(borderRightRadiusRight),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          width: cardSongTextWidth,
                          height: cardSongHeight,
                          color: Colors.transparent,
                          child: CardSongText(),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              right: cardSongPlayIconPaddingRight),
                          width: cardSongPlayWidth,
                          height: cardSongHeight,
                          color: Colors.transparent,
                          child: CardSongPlay(cardSongPlayWidth),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  double calculateCardSongPlayWidth() =>
      cardSongPlayWidth * (1 - animationTransformCircle.value);

  double calculateCardSongTextHeight() =>
      cardSongTextWidth * (1 - animationTransformCircle.value);

  double calculateCardSongPaddingLeft() {
    double padding = (cardSongPaddingLeftMax * animationTransformCircle.value) +
        cardSongPaddingLeftMin;

    if (padding < cardSongPaddingLeftMin)
      padding = cardSongPaddingLeftMin;
    else if (padding > cardSongPaddingLeftMax) padding = cardSongPaddingLeftMax;

    return padding;
  }

  double calculateCardSongPlayPositionedTop() {
    double positioned;

    if (animationMoveDown.value == 0)
      positioned = cardSongPositionedTopMin;
    else {
      positioned = cardSongPositionedTopMin +
          (cardSongPositionedTopMax * animationMoveDown.value);
    }

    if (positioned >= cardSongPositionedTopMax)
      positioned = cardSongPositionedTopMax;

    return positioned;
  }

  void setBordersToDefault() {
    borderLeftRadiusLeft = 5.0;
    borderLeftRadiusRight = 0.0;
    borderRightRadiusRight = 5.0;
  }

  void setBordersToAnimating() {
    borderLeftRadiusLeft = 70.0;
    borderLeftRadiusRight = 0.0;
    borderRightRadiusRight = 70.0;
  }

  void setBordersToAnimated() {
    borderLeftRadiusLeft = 70.0;
    borderLeftRadiusRight = 70.0;
    borderRightRadiusRight = 5.0;
  }
}

class CardSongImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: AlbumPage.tag,
      child: Container(
        width: cardSongImageWidth,
        height: cardSongHeight,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderLeftRadiusLeft),
              bottomLeft: Radius.circular(borderLeftRadiusLeft),
              topRight: Radius.circular(borderLeftRadiusRight),
              bottomRight: Radius.circular(borderLeftRadiusRight),
            )),
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderLeftRadiusLeft),
              bottomLeft: Radius.circular(borderLeftRadiusLeft),
              topRight: Radius.circular(borderLeftRadiusRight),
              bottomRight: Radius.circular(borderLeftRadiusRight),
            ),
            child: Image.network(
              "https://i.scdn.co/image/c71f667b154766ad09030fb0b17eef6815e5e75c",
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}

class CardSongText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(2.0),
          child: const Text(
            "Ellie Goulding",
            style: TextStyle(fontSize: 10),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 2.0),
          child: const Text(
            "Love Me Like You Do (From \"Fifty Shades Of Grey\")",
            style: TextStyle(fontSize: 12),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

class CardSongPlay extends StatelessWidget {
  double widthCardPlay;

  CardSongPlay(this.widthCardPlay);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.play_circle_outline,
      size: widthCardPlay <= cardSongPlayIconPaddingRight
          ? 0
          : widthCardPlay - cardSongPlayIconPaddingRight,
    );
  }
}
