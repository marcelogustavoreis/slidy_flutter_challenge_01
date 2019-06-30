import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:slidy_flutter_challenge_01/src/album/album_page.dart';

class HeaderAlbumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return             Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          elevation: 0.0,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(MdiIcons.heartOutline),
                Icon(MdiIcons.starOutline)
              ],
            ),
          ),
          flexibleSpace: Image.network(
            "https://e-cdns-images.dzcdn.net/images/cover/60106af4d3ad335af1844b293fc97af4/264x264-000000-80-0-0.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
