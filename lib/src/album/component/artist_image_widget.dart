import 'package:flutter/material.dart';
import 'package:slidy_flutter_challenge_01/src/album/album_page.dart';

const double artistImageSize = 50.0;

class ArtistImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20.0,
      top: appBarHeight - 10.0,
      width: artistImageSize,
      height: artistImageSize,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(artistImageSize)),
        child: Image.network(
          "https://i.scdn.co/image/69a0d8f5c79ca4158d1ae47ea498794fc7705a51",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
