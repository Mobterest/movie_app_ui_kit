import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../globals/config.dart';
import '../globals/styles.dart';
import '../util/func.dart';
import '../globals/dimensions.dart';

class Booking extends StatefulWidget {
  final Map<String, dynamic> movie;
  Booking(this.movie);
  State<StatefulWidget> createState() => BookingState();
}

class BookingState extends State<Booking> {
  Color selectScreenTime = DARK_PALETTE;
  Func f = new Func();
  Widget build(context) {
    return Scaffold(
        backgroundColor: DARK_PALETTE,
        appBar: AppBar(
          backgroundColor: DARK_PALETTE,
          title: Text(
            'Booking',
            style: TextStyle(fontSize: 14),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
          Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        NetworkImage(IMAGE_URL + widget.movie['poster_path']),
                    fit: BoxFit.fitWidth),
              )),
          Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(widget.movie['title'],
                  style: TextStyle(fontSize: 14, color: WHITE_PALETTE))),
          Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text('Select screen time:',
                  style: TextStyle(fontSize: 12, color: GREEN_PALETTE))),
          Container(
              height: 180,
              child: GridView.count(
                  padding: const EdgeInsets.all(20),
                  childAspectRatio: (200 / 100),
                  crossAxisCount: 2,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            (selectScreenTime == DARK_PALETTE)
                                ? selectScreenTime = DARK_L_PALETTE
                                : selectScreenTime = DARK_PALETTE;
                          });
                        },
                        child: Container(
                            margin: EdgeInsets.only(right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: selectScreenTime,
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                    color: GRAY_PALETTE_1, width: 1.0)),
                            child: Flex(
                              mainAxisAlignment: MainAxisAlignment.center,
                              direction: Axis.vertical,
                              children: <Widget>[
                                Text(
                                  'October 01',
                                  style: TextStyle(
                                      color: WHITE_PALETTE, fontSize: 14),
                                ),
                                Text('10:00 AM',
                                    style: TextStyle(
                                        color: GRAY_PALETTE, fontSize: 13)),
                                Text(CURRENCY + '15.99',
                                    style: TextStyle(
                                        color: GRAY_PALETTE_1, fontSize: 11))
                              ],
                            ))),
                    Container(
                        margin: EdgeInsets.only(right: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border:
                                Border.all(color: GRAY_PALETTE_1, width: 1.0)),
                        child: Flex(
                          mainAxisAlignment: MainAxisAlignment.center,
                          direction: Axis.vertical,
                          children: <Widget>[
                            Text(
                              'October 01',
                              style:
                                  TextStyle(color: WHITE_PALETTE, fontSize: 14),
                            ),
                            Text('1:00 PM',
                                style: TextStyle(
                                    color: GRAY_PALETTE, fontSize: 13)),
                            Text(CURRENCY + '15.99',
                                style: TextStyle(
                                    color: GRAY_PALETTE_1, fontSize: 11))
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(right: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border:
                                Border.all(color: GRAY_PALETTE_1, width: 1.0)),
                        child: Flex(
                          mainAxisAlignment: MainAxisAlignment.center,
                          direction: Axis.vertical,
                          children: <Widget>[
                            Text(
                              'October 02',
                              style:
                                  TextStyle(color: WHITE_PALETTE, fontSize: 14),
                            ),
                            Text('10:00 AM',
                                style: TextStyle(
                                    color: GRAY_PALETTE, fontSize: 13)),
                            Text(CURRENCY + '15.99',
                                style: TextStyle(
                                    color: GRAY_PALETTE_1, fontSize: 11))
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(right: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border:
                                Border.all(color: GRAY_PALETTE_1, width: 1.0)),
                        child: Flex(
                          mainAxisAlignment: MainAxisAlignment.center,
                          direction: Axis.vertical,
                          children: <Widget>[
                            Text(
                              'October 02',
                              style:
                                  TextStyle(color: WHITE_PALETTE, fontSize: 14),
                            ),
                            Text('1:00 PM',
                                style: TextStyle(
                                    color: GRAY_PALETTE, fontSize: 13)),
                            Text(CURRENCY + '15.99',
                                style: TextStyle(
                                    color: GRAY_PALETTE_1, fontSize: 11))
                          ],
                        )),
                  ])),
          Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text('Choose seat:',
                  style: TextStyle(fontSize: 12, color: GREEN_PALETTE))),
          Container(
              padding: MOVIE_PADDING_4,
              child: Divider(
                height: DIVIDER_HEIGHT,
                color: GRAY_PALETTE_1,
              )),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Icon(Icons.event_seat, color: GRAY_PALETTE_1),
                  Text(
                    'Available',
                    style: TextStyle(color: WHITE_PALETTE, fontSize: 11),
                  )
                ],
              ),
              Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Icon(Icons.event_seat, color: DARK_L_PALETTE),
                  Text(
                    'Taken',
                    style: TextStyle(color: WHITE_PALETTE, fontSize: 11),
                  )
                ],
              ),
              Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Icon(Icons.event_seat, color: RED_PALETTE),
                  Text(
                    'Selected',
                    style: TextStyle(color: WHITE_PALETTE, fontSize: 11),
                  )
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
          Container(
              child: Flex(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: Axis.horizontal,
                  children: <Widget>[
                Flex(
                    direction: Axis.vertical,
                    children: f.buildSeats(
                        3, [DARK_L_PALETTE, DARK_L_PALETTE, DARK_L_PALETTE])),
                Flex(
                    direction: Axis.vertical,
                    children: f.buildSeats(4, [
                      GRAY_PALETTE_1,
                      DARK_L_PALETTE,
                      GRAY_PALETTE_1,
                      GRAY_PALETTE_1
                    ])),
                Flex(
                    direction: Axis.vertical,
                    children: f.buildSeats(5, [
                      DARK_L_PALETTE,
                      GRAY_PALETTE_1,
                      DARK_L_PALETTE,
                      GRAY_PALETTE_1,
                      RED_PALETTE
                    ])),
                Flex(
                    direction: Axis.vertical,
                    children: f.buildSeats(5, [
                      DARK_L_PALETTE,
                      RED_PALETTE,
                      DARK_L_PALETTE,
                      DARK_L_PALETTE,
                      GRAY_PALETTE_1
                    ])),
                Flex(
                    direction: Axis.vertical,
                    children: f.buildSeats(4, [
                      DARK_L_PALETTE,
                      GRAY_PALETTE_1,
                      DARK_L_PALETTE,
                      RED_PALETTE
                    ])),
                Flex(
                    direction: Axis.vertical,
                    children: f.buildSeats(
                        3, [DARK_L_PALETTE, DARK_L_PALETTE, DARK_L_PALETTE])),
              ])),
          SizedBox(
            height: 20,
          ),
          Container(
              child: Flex(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: Axis.horizontal,
                  children: <Widget>[
                Flex(
                    direction: Axis.vertical,
                    children: f.buildSeats(
                        3, [DARK_L_PALETTE, DARK_L_PALETTE, DARK_L_PALETTE])),
                Flex(
                    direction: Axis.vertical,
                    children: f.buildSeats(4, [
                      DARK_L_PALETTE,
                      GRAY_PALETTE_1,
                      DARK_L_PALETTE,
                      GRAY_PALETTE_1
                    ])),
                Flex(
                    direction: Axis.vertical,
                    children: f.buildSeats(5, [
                      GRAY_PALETTE_1,
                      GRAY_PALETTE_1,
                      GRAY_PALETTE_1,
                      GRAY_PALETTE_1,
                      GRAY_PALETTE_1
                    ])),
                Flex(
                    direction: Axis.vertical,
                    children: f.buildSeats(5, [
                      DARK_L_PALETTE,
                      RED_PALETTE,
                      RED_PALETTE,
                      DARK_L_PALETTE,
                      DARK_L_PALETTE
                    ])),
                Flex(
                    direction: Axis.vertical,
                    children: f.buildSeats(4, [
                      DARK_L_PALETTE,
                      GRAY_PALETTE_1,
                      GRAY_PALETTE_1,
                      GRAY_PALETTE_1
                    ])),
                Flex(
                    direction: Axis.vertical,
                    children: f.buildSeats(
                        3, [GRAY_PALETTE_1, GRAY_PALETTE_1, GRAY_PALETTE_1])),
              ])),
        ])),
        bottomNavigationBar: Builder(
            builder: (context) => Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                child: FlatButton(
                  onPressed: () {},
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'CHECKOUT  ' + CURRENCY + '15',
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
