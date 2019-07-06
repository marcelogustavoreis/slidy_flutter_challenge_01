import 'package:flutter/material.dart';
import 'package:slidy_flutter_challenge_01/src/home/component/my_sliver_app_bar_widget.dart';

class CardSongMixin {
  double cardSongPositionedTopMin;
  double cardSongPositionedTopMax;
  double cardSongPaddingLeft = 20.0;
  double cardSongPaddingRight = 20.0;

  double cardSongHeight = 70.0;

  double cardSongPlayWidth = 34.0;
  double cardSongImageWidth = 70.0;
  double cardSongTextWidth;

  double cardSongPaddingLeftMin = 20.0;
  double cardSongPaddingLeftMax;

  double borderLeftRadiusLeft = 5.0;
  double borderLeftRadiusRight = 0.0;
  double borderRightRadiusRight = 5.0;

  double cardSongPlayIconPaddingRight = 10.0;

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

  double calculateCardSongPlayPositionedTop(animationMoveDown) {
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

  double calculateCardSongPlayWidth(animationTransformCircle) =>
      cardSongPlayWidth * (1 - animationTransformCircle.value);

  double calculateCardSongTextHeight(animationTransformCircle) =>
      cardSongTextWidth * (1 - animationTransformCircle.value);

  double calculateCardSongPaddingLeft(animationTransformCircle) {
    double padding =
        (cardSongPaddingLeftMax * animationTransformCircle.value) +
            cardSongPaddingLeftMin;

    if (padding < cardSongPaddingLeftMin)
      padding = cardSongPaddingLeftMin;
    else if (padding > cardSongPaddingLeftMax) padding = cardSongPaddingLeftMax;

    return padding;
  }
}
