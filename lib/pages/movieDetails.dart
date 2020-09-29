import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../globals/config.dart';
import '../util/func.dart';
import '../globals/styles.dart';
import '../globals/constants.dart';
import 'booking.dart';
import '../globals/dimensions.dart';

class MovieDetails extends StatefulWidget {
  final Map<String, dynamic> movie;
  MovieDetails(this.movie);
  State<StatefulWidget> createState() => MovieDetailsState();
}

class MovieDetailsState extends State<MovieDetails> {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height *
                            MOVIE_IMG_HEIGHT,
                        child: FadeInImage.assetNetwork(
                          placeholder: LOADING_IMG,
                          image: IMAGE_URL + widget.movie['poster_path'],
                        )),
                    Container(
                        padding: MOVIE_PADDING_2,
                        child: Text.rich(TextSpan(
                          style: TextStyle(color: WHITE_PALETTE),
                          children: <InlineSpan>[
                            TextSpan(
                                text: widget.movie['title'],
                                style: STYLE_MD_TITLE),
                            TextSpan(
                                text: widget.movie['release_date'] == null
                                    ? ''
                                    : ' (' +
                                        widget.movie['release_date']
                                            .split('-')[0] +
                                        ')',
                                style: STYLE_MD_DATE),
                          ],
                        ))),
                    FutureBuilder<String>(
                        future: f.getGenre(widget.movie['genre_ids'][0]),
                        builder: (context, AsyncSnapshot<String> snapshot) {
                          String res = '';

                          if (snapshot.hasData) {
                            res = snapshot.data;
                          }

                          return Container(
                              width: MD_CWIDTH,
                              height: MD_HEIGHT,
                              margin: MOVIE_PADDING_3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: GRAY_PALETTE_1, width: 1.0)),
                              child: Center(
                                child: Text(
                                  res.toUpperCase(),
                                  style: STYLE_MD_GENRE,
                                ),
                              ));
                        }),
                    Container(
                        padding: MOVIE_PADDING_4,
                        child: Divider(
                          height: DIVIDER_HEIGHT,
                          color: GRAY_PALETTE_1,
                        )),
                    Flex(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Flex(
                          direction: Axis.vertical,
                          children: <Widget>[
                            FutureBuilder<int>(
                                future: f.getNoOfReviews(widget.movie['id']),
                                builder:
                                    (context, AsyncSnapshot<int> snapshot) {
                                  int res = 0;

                                  if (snapshot.hasData) {
                                    res = snapshot.data;
                                  }

                                  return Text(
                                    res.toString(),
                                    style: STYLE_MD_REVIEWS,
                                  );
                                }),
                            Text(MOVIE_TAB_1, style: STYLE_MD_TABS),
                          ],
                        ),
                        Flex(
                          direction: Axis.vertical,
                          children: <Widget>[
                            Text(widget.movie['vote_average'].toString(),
                                style: STYLE_MD_RATES),
                            Text(MOVIE_TAB_2, style: STYLE_MD_TABS)
                          ],
                        ),
                        Flex(
                          direction: Axis.vertical,
                          children: <Widget>[
                            Icon(
                              Icons.star_border,
                              color: GRAY_PALETTE_1,
                            ),
                            Text(MOVIE_TAB_3, style: STYLE_MD_TABS),
                          ],
                        )
                      ],
                    ),
                    Container(
                        padding: MOVIE_PADDING_4,
                        child: Divider(
                          height: DIVIDER_HEIGHT,
                          color: GRAY_PALETTE_1,
                        )),
                    Flex(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: LOADING_IMG,
                                    image:
                                        IMAGE_URL + widget.movie['poster_path'],
                                  ))),
                          Flex(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            direction: Axis.vertical,
                            children: <Widget>[
                              Container(
                                  child: Text.rich(TextSpan(
                                style: TextStyle(color: WHITE_PALETTE),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: 'Title: ',
                                    style: TextStyle(
                                        fontSize: 11, color: GRAY_PALETTE),
                                  ),
                                  TextSpan(
                                      text: widget.movie['title'],
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ))),
                              Text.rich(TextSpan(
                                style: TextStyle(color: WHITE_PALETTE),
                                children: <InlineSpan>[
                                  TextSpan(
                                      text: 'Release date: ',
                                      style: TextStyle(
                                          fontSize: 11, color: GRAY_PALETTE)),
                                  TextSpan(
                                      text: widget.movie['release_date'],
                                      style: TextStyle(fontSize: 12)),
                                ],
                              )),
                              Text.rich(TextSpan(
                                style: TextStyle(color: WHITE_PALETTE),
                                children: <InlineSpan>[
                                  TextSpan(
                                      text: 'Votes: ',
                                      style: TextStyle(
                                          fontSize: 11, color: GRAY_PALETTE)),
                                  TextSpan(
                                      text:
                                          widget.movie['vote_count'].toString(),
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ))
                            ],
                          )
                        ]),
                    Container(
                        padding: MOVIE_PADDING_4,
                        child: Divider(
                          height: DIVIDER_HEIGHT,
                          color: GRAY_PALETTE_1,
                        )),
                    Padding(
                        padding: MOVIE_PADDING_5,
                        child: Text(
                          'Storyline',
                          style: TextStyle(color: WHITE_PALETTE, fontSize: 14),
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          widget.movie['overview'],
                          style: TextStyle(color: GRAY_PALETTE, fontSize: 12),
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 20, bottom: 20),
                        child: Divider(
                          height: 2.0,
                          color: GRAY_PALETTE_1,
                        )),
                    Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Full Cast & Crew',
                              style:
                                  TextStyle(fontSize: 14, color: WHITE_PALETTE),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(ALL,
                                  style: TextStyle(
                                      color: GRAY_PALETTE, fontSize: 12)),
                            )
                          ],
                        )),
                    FutureBuilder<List>(
                        future: f.getCredits(widget.movie['id']),
                        builder: (context, AsyncSnapshot<List> snapshot) {
                          List res = [];

                          if (snapshot.hasData) {
                            res = snapshot.data;
                          }
                          return Container(
                              padding: EdgeInsets.only(top: 10),
                              height: 210,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: f.buildCredits(res, context),
                              ));
                        }),
                  ],
                ))),
        bottomNavigationBar: Builder(
            builder: (context) => Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Booking(widget.movie),
                        ));
                  },
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'BUY TICKET ',
                        style: TextStyle(color: WHITE_PALETTE),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                  color: RED_PALETTE,
                ))));
  }
}
