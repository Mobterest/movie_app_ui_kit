import 'package:flutter/material.dart';
import './globals/constants.dart';
import './globals/colors.dart';
import './globals/dimensions.dart';
import './globals/styles.dart';
import './util/func.dart';

class App extends StatefulWidget {
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  Func f = new Func();

  bool isDark = false;

  @override
  void initState() {
    super.initState();
  }

  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: FONT_FAMILY),
      home: Scaffold(
        backgroundColor: isDark ? DARK_PALETTE : WHITE_PALETTE,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                padding: DIM_PADDING_1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          APP_TITLE,
                          style: STYLE_APP_TITLE,
                        ),
                        Spacer(),
                        IconButton(
                            icon: Icon(
                              Icons.wb_sunny,
                              color: isDark ? GRAY_PALETTE_1 : RED_PALETTE,
                              size: MODE_SIZE,
                            ),
                            onPressed: () {
                              setState(() {
                                isDark = false;
                              });
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.brightness_3,
                              color: isDark ? RED_PALETTE : DARK_PALETTE,
                              size: MODE_SIZE,
                            ),
                            onPressed: () {
                              setState(() {
                                isDark = true;
                              });
                            }),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: searchBorder,
                          ),
                          hintText: SEARCH_TEXT,
                          hintStyle: STYLE_SEARCH_TEXT),
                    ),
                    Container(
                        padding: DIM_PADDING_2,
                        child: Row(
                          children: <Widget>[
                            Text(
                              SUB_HEADER_3,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: isDark ? WHITE_PALETTE : DARK_PALETTE),
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
                        future: f.getUpcoming(),
                        builder: (context, AsyncSnapshot<List> snapshot) {
                          List res = [];

                          if (snapshot.hasData) {
                            res = snapshot.data;
                          }
                          return Container(
                              padding: DIM_PADDING_3,
                              height: 180,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: f.buildTrendingUpcoming(
                                    res, isDark, context),
                              ));
                        }),
                    Container(
                        padding: DIM_PADDING_2,
                        child: Row(
                          children: <Widget>[
                            Text(
                              SUB_HEADER_1,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: isDark ? WHITE_PALETTE : DARK_PALETTE),
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
                        future: f.getTrending(),
                        builder: (context, AsyncSnapshot<List> snapshot) {
                          List res = [];

                          if (snapshot.hasData) {
                            res = snapshot.data;
                          }
                          return Container(
                              padding: DIM_PADDING_3,
                              height: 180,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: f.buildTrendingUpcoming(
                                    res, isDark, context),
                              ));
                        }),
                    Container(
                        padding: DIM_PADDING_2,
                        child: Row(
                          children: <Widget>[
                            Text(
                              SUB_HEADER_2,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: isDark ? WHITE_PALETTE : DARK_PALETTE),
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
                        future: f.getPopular(),
                        builder: (context, AsyncSnapshot<List> snapshot) {
                          List res = [];

                          if (snapshot.hasData) {
                            res = snapshot.data;
                          }
                          return Column(
                            children: f.buildPopular(res, isDark, context),
                          );
                        }),
                  ],
                )),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
