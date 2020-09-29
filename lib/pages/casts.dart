import 'package:flutter/material.dart';
import 'package:movie_app/util/func.dart';
import '../globals/colors.dart';
import '../globals/dimensions.dart';
import '../globals/config.dart';
import '../globals/styles.dart';
import '../util/func.dart';
import '../globals/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Casts extends StatefulWidget {
  final Map<String, dynamic> cast;
  Casts(this.cast);
  State<StatefulWidget> createState() => CastsState();
}

class CastsState extends State<Casts> {
  @override
  void initState() {
    super.initState();
  }

  Func f = new Func();

  Widget build(context) {
    return Scaffold(
        backgroundColor: DARK_PALETTE,
        appBar: AppBar(
            bottomOpacity: 0.0,
            elevation: 0.0,
            backgroundColor: DARK_PALETTE,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.file_upload,
                  size: 18,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  size: 18,
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            ]),
        body: SingleChildScrollView(
            child: Padding(
          padding: MOVIE_PADDING_1,
          child: FutureBuilder<Map<String, dynamic>>(
              future: f.getCastInfor(widget.cast['id']),
              builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                Map<String, dynamic> res = {};

                if (snapshot.hasData) {
                  res = snapshot.data;
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    (res['profile_path'] == null)
                        ? Container()
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height *
                                MOVIE_IMG_HEIGHT,
                            child: FadeInImage.assetNetwork(
                              placeholder: LOADING_IMG,
                              image: IMAGE_URL +
                                  widget.cast['profile_path'].toString(),
                            )),
                    Text(res['name'].toString(),
                        style: TextStyle(fontSize: 16, color: WHITE_PALETTE)),
                    Text(
                        'Born ' +
                            res['birthday'].toString() +
                            ' in ' +
                            res['place_of_birth'].toString(),
                        style: TextStyle(fontSize: 12, color: GRAY_PALETTE_1)),
                    Container(
                        width: MD_CWIDTH,
                        height: MD_HEIGHT,
                        margin: MOVIE_PADDING_3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: GRAY_PALETTE_1, width: 1.0)),
                        child: Center(
                          child: Text(
                            res['known_for_department']
                                .toString()
                                .toUpperCase(),
                            style: STYLE_MD_GENRE,
                          ),
                        )),
                    Container(
                        padding: DIM_PADDING_2,
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Filmography',
                              style:
                                  TextStyle(fontSize: 14, color: WHITE_PALETTE),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Text.rich(TextSpan(children: <InlineSpan>[
                                WidgetSpan(
                                    child: SizedBox(
                                  width: SBOX_WIDTH,
                                  height: SBOX_HEIGHT,
                                  child: Card(
                                      child: Center(
                                          child: Text(ALL, style: STYLE_ALL))),
                                ))
                              ])),
                            )
                          ],
                        )),
                    FutureBuilder<List>(
                        future: f.getMovieCreditsByCast(widget.cast['id']),
                        builder: (context, AsyncSnapshot<List> snapshot) {
                          List res = [];

                          if (snapshot.hasData) {
                            res = snapshot.data;
                          }
                          return Container(
                              padding: DIM_PADDING_3,
                              height: 225,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children:
                                    f.buildMovieCredits(res, false, context),
                              ));
                        }),
                    Padding(
                        padding: MOVIE_PADDING_5,
                        child: Text(
                          'Biography',
                          style: TextStyle(color: WHITE_PALETTE, fontSize: 14),
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          res['biography'].toString(),
                          style: TextStyle(color: GRAY_PALETTE, fontSize: 12),
                        )),
                    Padding(
                        padding: MOVIE_PADDING_5,
                        child: Text(
                          'Gallery',
                          style: TextStyle(color: WHITE_PALETTE, fontSize: 14),
                        )),
                    FutureBuilder<List>(
                        future: f.getCastPhotos(widget.cast['id']),
                        builder: (context, AsyncSnapshot<List> snapshot) {
                          List res = [];

                          if (snapshot.hasData) {
                            res = snapshot.data;
                          }
                          return Container(
                              height: 200,
                              child: StaggeredGridView.count(
                                crossAxisCount: 4,
                                staggeredTiles: [
                                  StaggeredTile.count(2, 2),
                                  StaggeredTile.count(1, 2),
                                  StaggeredTile.count(1, 2),
                                ],
                                children: _buildList(res),
                                crossAxisSpacing: 10.0,
                              ));
                        })
                  ],
                );
              }),
        )));
  }

  List<Widget> _buildList(List res) {
    List<Widget> _tiles = [];
    for (var i = 0; i < res.length; i++) {
      _tiles.add((res[i]['file_path'] == null)
          ? Container()
          : Container(
              child: FadeInImage.assetNetwork(
              placeholder: LOADING_IMG,
              image: IMAGE_URL + res[i]['file_path'].toString(),
            )));
    }
    return _tiles;
  }
}
