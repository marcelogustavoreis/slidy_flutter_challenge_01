import 'package:flutter/material.dart';

class AlbumList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Album",
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
          AlbumListGrid(),
        ],
      ),
    );
  }
}

class AlbumListGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: GridView.count(
        padding: const EdgeInsets.all(0.0),
        shrinkWrap: true,
        childAspectRatio: 0.85,
        crossAxisSpacing: 10.0,
        crossAxisCount: 2,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          AlbumListTile(
              image:
                  "https://e-cdns-images.dzcdn.net/images/cover/64c997b70a1759e2419203c5f9c6c17d/264x264-000000-80-0-0.jpg",
              title: "Close To Me (Remixes)"),
          AlbumListTile(
              image:
                  "https://e-cdns-images.dzcdn.net/images/cover/a4f27af1979fea932093403aa14e549c/264x264-000000-80-0-0.jpg",
              title: "Delirium (Deluxe)"),
          AlbumListTile(
              image:
                  "https://e-cdns-images.dzcdn.net/images/cover/1f299d53833bb0d80d2446ca180bab99/264x264-000000-80-0-0.jpg",
              title: "Halcyon Days"),
          AlbumListTile(
              image:
                  "https://e-cdns-images.dzcdn.net/images/cover/29bd81f215735f6c6b04cb1a2e60ec8a/264x264-000000-80-0-0.jpg",
              title: "Beating Heart"),
          AlbumListTile(
              image:
                  "https://e-cdns-images.dzcdn.net/images/cover/609aa4550752394cd52bf2955e60597d/264x264-000000-80-0-0.jpg",
              title: "Burn (Remix EP)"),
          AlbumListTile(
              image:
                  "https://e-cdns-images.dzcdn.net/images/cover/7150f5ae6d6aa6ddf10d8ab39107bd49/264x264-000000-80-0-0.jpg",
              title: "Anything Could Happen"),
          AlbumListTile(
              image:
                  "https://e-cdns-images.dzcdn.net/images/cover/3bec32484b93279e8c8991d6e9b0c190/264x264-000000-80-0-0.jpg",
              title: "Bright Lights (Lights Re-pack / Bonus Version)"),
          AlbumListTile(
              image:
                  "https://e-cdns-images.dzcdn.net/images/cover/fad278dc0eb97914a6e7e3de07126b99/264x264-000000-80-0-0.jpg",
              title: "Lights"),
        ],
      ),
    );
  }
}

class AlbumListTile extends StatelessWidget {
  String image;
  String title;

  AlbumListTile({@required this.image, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            title,
            maxLines: 2,
            style: TextStyle(
              fontSize: 10.0,
            ),
          ),
        ),
      ],
    );
  }
}
