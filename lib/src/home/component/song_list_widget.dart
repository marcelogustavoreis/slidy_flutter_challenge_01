import 'package:flutter/material.dart';
import 'package:slidy_flutter_challenge_01/src/album/album_page.dart';

class SongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 45.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Song list",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "ALL",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 102.0,
            padding: const EdgeInsets.only(left: 10.0),
            margin: const EdgeInsets.only(bottom: 10.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, animation, animation2) =>
                                AlbumPage()));
                  },
                  child: SongListTile(
                    image:
                        "https://e-cdns-images.dzcdn.net/images/cover/60106af4d3ad335af1844b293fc97af4/264x264-000000-80-0-0.jpg",
                    title: "Close To Me",
                  ),
                ),
                SongListTile(
                  image:
                      "https://e-cdns-images.dzcdn.net/images/cover/609aa4550752394cd52bf2955e60597d/264x264-000000-80-0-0.jpg",
                  title: "Burn",
                ),
                SongListTile(
                    image:
                        "https://e-cdns-images.dzcdn.net/images/cover/f748135346d101a50add6ff3ffd2b9c5/264x264-000000-80-0-0.jpg",
                    title: "Sixteen"),
                SongListTile(
                    image:
                        "https://e-cdns-images.dzcdn.net/images/cover/3bec32484b93279e8c8991d6e9b0c190/264x264-000000-80-0-0.jpg",
                    title: "Lights"),
                SongListTile(
                    image:
                        "https://e-cdns-images.dzcdn.net/images/cover/6ddf28511ba3c8c1a8ad81ee43d60495/264x264-000000-80-0-0.jpg",
                    title: "Still Falling For You"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SongListTile extends StatelessWidget {
  String image;
  String title;

  SongListTile({@required this.image, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 85,
          height: 85,
          margin: const EdgeInsets.only(right: 10.0, bottom: 5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 10.0,
          ),
        ),
      ],
    );
  }
}
