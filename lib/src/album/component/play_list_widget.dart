import 'package:flutter/material.dart';
import 'package:slidy_flutter_challenge_01/src/album/album_page.dart';
import 'package:slidy_flutter_challenge_01/src/album/component/card_song_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PlayList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: appBarHeight + MediaQuery.of(context).padding.top + cardSongHeight,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height -
              (appBarHeight +
                  MediaQuery.of(context).padding.top +
                  cardSongHeight),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 3.0, top: 15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.play_circle_outline,
                      size: 20,
                      color: Color(0xff3355db),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Play all (7)",
                        style: TextStyle(color: Color(0xff40496c)),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  children: <Widget>[
                    PlayListItem(
                      number: 1,
                      title: "Delirium (Deluxe)",
                      artistName: "Ellie Goulding",
                      image:
                          "https://e-cdns-images.dzcdn.net/images/cover/a4f27af1979fea932093403aa14e549c/264x264-000000-80-0-0.jpg",
                    ),
                    PlayListItem(
                      number: 2,
                      title: "Halcyon Days",
                      artistName: "Ellie Goulding",
                      image:
                          "https://e-cdns-images.dzcdn.net/images/cover/1f299d53833bb0d80d2446ca180bab99/264x264-000000-80-0-0.jpg",
                    ),
                    PlayListItem(
                      number: 3,
                      title: "Beating Heart",
                      artistName: "Ellie Goulding",
                      image:
                          "https://e-cdns-images.dzcdn.net/images/cover/29bd81f215735f6c6b04cb1a2e60ec8a/264x264-000000-80-0-0.jpg",
                    ),
                    PlayListItem(
                      number: 4,
                      title: "Burn (Remix EP)",
                      artistName: "Ellie Goulding",
                      image:
                          "https://e-cdns-images.dzcdn.net/images/cover/609aa4550752394cd52bf2955e60597d/264x264-000000-80-0-0.jpg",
                    ),
                    PlayListItem(
                      number: 5,
                      title: "Anything Could Happen",
                      artistName: "Ellie Goulding",
                      image:
                          "https://e-cdns-images.dzcdn.net/images/cover/7150f5ae6d6aa6ddf10d8ab39107bd49/264x264-000000-80-0-0.jpg",
                    ),
                    PlayListItem(
                      number: 6,
                      title: "Bright Lights (Lights Re-pack / Bonus Version)",
                      artistName: "Ellie Goulding",
                      image:
                          "https://e-cdns-images.dzcdn.net/images/cover/3bec32484b93279e8c8991d6e9b0c190/264x264-000000-80-0-0.jpg",
                    ),
                    PlayListItem(
                      number: 7,
                      title: "Lights",
                      artistName: "Ellie Goulding",
                      image:
                          "https://e-cdns-images.dzcdn.net/images/cover/fad278dc0eb97914a6e7e3de07126b99/264x264-000000-80-0-0.jpg",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class PlayListItem extends StatelessWidget {
  int number;
  String image;
  String title;
  String artistName;

  PlayListItem(
      {@required this.number,
      @required this.image,
      @required this.title,
      @required this.artistName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Text("$number", style: TextStyle(color: Color(0xffa2a8c1))),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            width: 25.0,
            height: 25.0,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
              child: Image.network(image),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: const Color(0xff525d88),
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0),
                          ),
                          Text(
                            artistName,
                            style: const TextStyle(
                              color: const Color(0xff525d88),
                              fontSize: 8.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: Color(0xffd8d8d8),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
