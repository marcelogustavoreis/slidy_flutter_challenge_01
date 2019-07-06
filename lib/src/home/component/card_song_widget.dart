import 'package:flutter/material.dart';
import 'package:slidy_flutter_challenge_01/src/album/album_page.dart';
import 'package:slidy_flutter_challenge_01/src/home/component/card_song_mixin.dart';
import 'package:slidy_flutter_challenge_01/src/home/home_page.dart';

class CardSong extends StatelessWidget with CardSongMixin {
  AnimationController animationFlipController;
  AnimationController animationListenProgressController;
  Animation animationTransformCircle;
  Animation animationMoveDown;
  Animation animationFlip;
  Animation animationListenProgress;

  CardSong({
    @required this.animationTransformCircle,
    @required this.animationMoveDown,
    @required this.animationFlip,
    @required this.animationFlipController,
    @required this.animationListenProgress,
    @required this.animationListenProgressController,
  });

  @override
  Widget build(BuildContext context) {
    setSize(context);
    return AnimatedBuilder(
        animation: animationListenProgress,
        builder: (context, child) {
          return AnimatedBuilder(
            animation: animationFlip,
            builder: (context, child) {
              return AnimatedBuilder(
                animation: animationMoveDown,
                builder: (context, child) {
                  return AnimatedBuilder(
                    animation: animationTransformCircle,
                    builder: (context, child) {
                      double cardSongPaddingLeft = calculateCardSongPaddingLeft(
                          animationTransformCircle);
                      double cardSongTextWidth =
                          calculateCardSongTextHeight(animationTransformCircle);
                      double cardSongPlayWidth =
                          calculateCardSongPlayWidth(animationTransformCircle);
                      double cardSongPlayPositionedTop =
                          calculateCardSongPlayPositionedTop(animationMoveDown);
                      double cardTextPlaySize =
                          cardSongTextWidth + cardSongPlayWidth;

                      if (animationTransformCircle.status ==
                          AnimationStatus.completed) {
                        setBordersToAnimated();
                      } else if (animationTransformCircle.status ==
                          AnimationStatus.dismissed) {
                        setBordersToDefault();
                      } else if (animationTransformCircle.status ==
                              AnimationStatus.forward ||
                          animationTransformCircle.status ==
                              AnimationStatus.reverse) {
                        setBordersToAnimating();
                      }

                      if (animationMoveDown.value > 0) {
                        setBordersToAnimated();
                      }

                      return Positioned(
                        top: cardSongPlayPositionedTop,
                        left: cardSongPaddingLeft,
                        child: Transform(
                          origin:
                              Offset(cardSongHeight / 2, cardSongHeight / 2),
                          transform:
                              Matrix4.rotationX(animationFlip.value * 6.3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Transform.rotate(
                                angle: animationMoveDown.value * -6.3,
                                child: CardSongImage(borderLeftRadiusLeft,
                                    borderLeftRadiusRight),
                              ),
                              Container(
                                height: cardSongHeight,
                                width: cardTextPlaySize,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(borderRightRadiusRight),
                                    bottomRight:
                                        Radius.circular(borderRightRadiusRight),
                                  ),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      color: Color(0xffe8f6fd),
                                      width: cardTextPlaySize *
                                          animationListenProgress.value,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.all(3.0),
                                          width: cardSongTextWidth,
                                          height: cardSongHeight,
                                          color: Colors.transparent,
                                          child: CardSongText(),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              right:
                                                  cardSongPlayIconPaddingRight),
                                          width: cardSongPlayWidth,
                                          height: cardSongHeight,
                                          color: Colors.transparent,
                                          child: CardSongPlay(
                                            cardSongPlayWidth,
                                            animationFlipController,
                                            animationListenProgressController,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        });
  }
}

class CardSongImage extends StatelessWidget with CardSongMixin {
  double borderLeftRadiusLeft;
  double borderLeftRadiusRight;

  CardSongImage(this.borderLeftRadiusLeft, this.borderLeftRadiusRight);

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

class CardSongPlay extends StatelessWidget with CardSongMixin {
  double widthCardPlay;
  AnimationController animationFlipController;
  AnimationController animationListenProgressController;

  CardSongPlay(
    this.widthCardPlay,
    this.animationFlipController,
    this.animationListenProgressController,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        animationListenProgressController.forward();
        animationListenProgressController.addListener(() {
          if (animationListenProgressController.status ==
              AnimationStatus.completed) {
            animationFlipController.forward();
            animationListenProgressController.reset();
            animationFlipController.addListener(() {
              if (animationFlipController.status == AnimationStatus.completed) {
                animationFlipController.reset();
              }
            });
          }
        });
      },
      child: Icon(
        Icons.play_circle_outline,
        size: widthCardPlay <= cardSongPlayIconPaddingRight
            ? 0
            : widthCardPlay - cardSongPlayIconPaddingRight,
      ),
    );
  }
}
