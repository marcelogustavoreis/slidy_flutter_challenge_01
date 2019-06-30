import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:slidy_flutter_challenge_01/src/album/component/artist_image_widget.dart';
import 'package:slidy_flutter_challenge_01/src/album/component/card_song_widget.dart';
import 'package:slidy_flutter_challenge_01/src/album/component/header_album_page_widget.dart';
import 'package:slidy_flutter_challenge_01/src/album/component/play_list_widget.dart';
import 'package:slidy_flutter_challenge_01/src/album/component/song_playing_widget.dart';

class AlbumPage extends StatefulWidget {
  static String tag = "album_page";

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

const double appBarHeight = 200.0;

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: AlbumPage.tag,
      child: Scaffold(
        backgroundColor: const Color(0xfff2f3f5),
        body: Stack(
          children: <Widget>[
            HeaderAlbumPage(),
            CardSong(),
            ArtistImage(),
            PlayList(),
            SongPlaying(),
          ],
        ),
      ),
    );
  }
}
