import '../api/api.dart';
import '../globals/config.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../globals/dimensions.dart';
import '../globals/constants.dart';
import '../globals/styles.dart';
import '../pages/movieDetails.dart';
import '../pages/casts.dart';

class Func {
  Func();

  Future<List> getUpcoming() async {
    List upcoming = [];
    await Api.sendRequest(UPCOMING_URL).then((value) {
      upcoming = json.decode(value)['results'];
    }).catchError((onError) {
      upcoming = [];
    });
    return upcoming;
  }

  Future<List> getCredits(int id) async {
    List credits = [];
    await Api.sendRequest(CREDITS_URL.replaceAll('MOVIE_ID', id.toString()))
        .then((value) {
      credits = json.decode(value)['cast'];
    }).catchError((onError) {
      credits = [];
    });
    return credits;
  }

  Future<List> getTrending() async {
    List trending = [];
    await Api.sendRequest(TRENDING_URL).then((value) {
      trending = json.decode(value)['results'];
    }).catchError((onError) {
      trending = [];
    });
    return trending;
  }

  Future<List> getPopular() async {
    List popular = [];
    await Api.sendRequest(POPULAR_URL).then((value) {
      popular = json.decode(value)['results'];
    }).catchError((onError) {
      popular = [];
    });
    return popular;
  }

  Future<String> getGenre(int genreID) async {
    String genre = '';
    await Api.sendRequest(GENRE_URL).then((value) {
      List genres = json.decode(value)['genres'];
      for (final g in genres) {
        if (g['id'] == genreID) {
          genre = g['name'];
        }
      }
    }).catchError((onError) {
      genre = DEFAULT_GENRE;
    });
    return genre;
  }

  Future<Map<String, dynamic>> getCastInfor(int id) async {
    Map<String, dynamic> cast = {};
    await Api.sendRequest(CAST_URL.replaceAll('CAST_ID', id.toString()))
        .then((value) {
      cast = json.decode(value);
    }).catchError((onError) {
      cast = {};
    });
    return cast;
  }

  Future<List> getMovieCreditsByCast(int id) async {
    List movieCredits = [];
    await Api.sendRequest(MOVIE_CREDIT_URL.replaceAll('CAST_ID', id.toString()))
        .then((value) {
      movieCredits = json.decode(value)['cast'];
    }).catchError((onError) {
      movieCredits = [];
    });
    return movieCredits;
  }

  Future<List> getCastPhotos(int id) async {
    List photos = [];
    await Api.sendRequest(CAST_IMG_URL.replaceAll('CAST_ID', id.toString()))
        .then((value) {
      photos = json.decode(value)['profiles'];
    }).catchError((onError) {
      photos = [];
    });
    return photos;
  }

  Future<int> getNoOfReviews(int id) async {
    int noOfReviews = 0;
    await Api.sendRequest(REVIEWS_NO_URL.replaceAll('MOVIE_ID', id.toString()))
        .then((value) {
      List reviews = json.decode(value)['results'];
      noOfReviews = reviews.length;
    }).catchError((onError) {
      noOfReviews = 0;
    });
    return noOfReviews;
  }

  List<Widget> buildTrendingUpcoming(
      List res, bool isDark, BuildContext context) {
    List x = <Widget>[];
    for (var i = 0; i < res.length; i++) {
      x.add(
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetails(res[i]),
                  ));
            },
            child: Container(
                width: TRENDING_CONTAINER_WIDTH,
                margin: DIM_PADDING_4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    (res[i]['poster_path'] == null)
                        ? Container()
                        : ClipRRect(
                            borderRadius: imageRadius,
                            child: FadeInImage.assetNetwork(
                              placeholder: LOADING_IMG,
                              image: IMAGE_URL + res[i]['poster_path'],
                            )),
                  ],
                ))),
      );
    }
    return x;
  }

  List<Widget> buildMovieCredits(List res, bool isDark, BuildContext context) {
    List x = <Widget>[];
    for (var i = 0; i < res.length; i++) {
      x.add(
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetails(res[i]),
                  ));
            },
            child: Container(
                width: TRENDING_CONTAINER_WIDTH,
                margin: DIM_PADDING_4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    (res[i]['poster_path'] == null)
                        ? Container()
                        : ClipRRect(
                            borderRadius: imageRadius,
                            child: FadeInImage.assetNetwork(
                              placeholder: LOADING_IMG,
                              image: IMAGE_URL + res[i]['poster_path'],
                            )),
                    SizedBox(height: 5),
                    Text(res[i]['title'] == null ? '' : res[i]['title'],
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: WHITE_PALETTE))
                  ],
                ))),
      );
    }
    return x;
  }

  List<Widget> buildPopular(List res, bool isDark, BuildContext context) {
    List x = <Widget>[];

    for (var i = 0; i < res.length; i++) {
      x.add(Container(
        margin: DIM_MARGIN_1,
        padding: DIM_PADDING_3,
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetails(res[i]),
                  ));
            }, child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: 100,
                child: ClipRRect(
                    borderRadius: imageRadius,
                    child: FadeInImage.assetNetwork(
                      placeholder: LOADING_IMG,
                      image: IMAGE_URL + res[i]['poster_path'],
                    ))),
            Expanded(
                child: Container(
                    padding: DIM_PADDING_5,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            res[i]['original_title'] == null
                                ? ''
                                : res[i]['original_title'],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: isDark ? WHITE_PALETTE : DARK_PALETTE),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text.rich(TextSpan(
                            style: TextStyle(
                                color: isDark ? WHITE_PALETTE : DARK_PALETTE),
                            children: <InlineSpan>[
                              TextSpan(text: REL, style: STYLE_REL),
                              TextSpan(
                                  text: res[i]['release_date'],
                                  style: STYLE_REL_DATE),
                            ],
                          )),
                          FutureBuilder<String>(
                              future: getGenre(res[i]['genre_ids'][0]),
                              builder:
                                  (context, AsyncSnapshot<String> snapshot) {
                                String res = '';

                                if (snapshot.hasData) {
                                  res = snapshot.data;
                                }
                                return Text(
                                  res,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: isDark
                                          ? WHITE_PALETTE
                                          : DARK_PALETTE),
                                );
                              }),
                          ActionChip(
                              backgroundColor: Colors.transparent,
                              avatar: Icon(Icons.star,
                                  color: RED_PALETTE, size: 20),
                              label: Text.rich(TextSpan(
                                children: <InlineSpan>[
                                  TextSpan(
                                      text: res[i]['vote_average'].toString(),
                                      style: STYLE_RATE),
                                  TextSpan(text: TRATE, style: STYLE_TRATE),
                                ],
                              )),
                              onPressed: () {}),
                          FutureBuilder<int>(
                              future: getNoOfReviews(res[i]['id']),
                              builder: (context, AsyncSnapshot<int> snapshot) {
                                int res = 0;

                                if (snapshot.hasData) {
                                  res = snapshot.data;
                                }

                                return Text.rich(TextSpan(
                                  style: TextStyle(
                                      color: isDark
                                          ? WHITE_PALETTE
                                          : DARK_PALETTE),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: res.toString(), style: STYLE_RVW),
                                    TextSpan(text: RVW, style: STYLE_RVW),
                                  ],
                                ));
                              })
                        ])))
          ],
        )),
      ));
    }
    return x;
  }

  List<Widget> buildCredits(List res, BuildContext context) {
    List x = <Widget>[];

    for (var i = 0; i < res.length; i++) {
      x.add(
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Casts(res[i]),
                  ));
            },
            child: Container(
                width: TRENDING_CONTAINER_WIDTH,
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    (res[i]['profile_path'] == null)
                        ? Container()
                        : ClipRRect(
                            borderRadius: imageRadius,
                            child: FadeInImage.assetNetwork(
                              placeholder: LOADING_IMG,
                              image: IMAGE_URL + res[i]['profile_path'],
                            )),
                    Text(
                      res[i]['name'],
                      style: TextStyle(color: WHITE_PALETTE, fontSize: 12),
                    )
                  ],
                ))),
      );
    }
    return x;
  }

  List<Widget> buildSeats(int count, List c) {
    List x = <Widget>[];

    for (var i = 0; i < count; i++) {
      x.add(IconButton(
          icon: Icon(
            Icons.event_seat,
            color: c[i],
          ),
          onPressed: () {}));
    }

    return x;
  }
}
