import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:slidy_flutter_challenge_01/src/album/album_page.dart';

const double cardSongHeight = 55.0;

class CardSong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: appBarHeight + MediaQuery.of(context).padding.top,
      child: Container(
        height: cardSongHeight,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, 8.0),
              color: Colors.grey[200],
              blurRadius: 4.5,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Close To Me (Remixes)",
              style: const TextStyle(
                color: const Color(0xff525d88),
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Ellie Goulding",
                  style: const TextStyle(
                    color: const Color(0xff525d88),
                    fontSize: 12.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      MdiIcons.headphones,
                      color: const Color(0xffd2d4df),
                      size: 14,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5.0, right: 20.0),
                      child: const Text(
                        "2.4w",
                        style: const TextStyle(
                          color: const Color(0xffd2d4df),
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
