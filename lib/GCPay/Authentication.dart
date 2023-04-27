import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Authentication extends StatelessWidget {
  Authentication({
    required Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 26.0, end: 26.0),
            Pin(size: 27.0, middle: 0.3084),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff4486d5),
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 305.0, start: 56.0),
            Pin(size: 17.0, middle: 0.3106),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 144.0,
                    height: 17.0,
                    child: Text(
                      'Easy Wallet Address',
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 15,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 144.0,
                    height: 17.0,
                    child: Text(
                      '3730748dab20061c',
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 15,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 271.0, start: -11.0),
            child: Container(
              color: const Color(0xff4486d5),
            ),
          ),
          Pinned.fromPins(
            Pin(start: -3.0, end: 0.0),
            Pin(size: 260.0, start: 0.0),
            child: SvgPicture.string(
              _svg_l75u9y,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 56.0, start: 39.0),
            Pin(size: 56.0, start: 42.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 83.0, start: 26.0),
            Pin(size: 17.0, start: 101.0),
            child: Text(
              'User Center',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 78.0, start: 46.0),
            Pin(size: 23.0, start: 145.0),
            child: Text(
              'balance'.tr+':',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 20,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(startFraction: 0.1024, endFraction: 0.8954),
            Pin(startFraction: 0.0353, endFraction: 0.9636),
            child: SvgPicture.string(
              _svg_fwt3e4,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 30.0, middle: 0.2656),
            child: Container(
              color: const Color(0xff1d4f8b),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 144.0, start: 40.0),
            Pin(size: 17.0, middle: 0.2696),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 17.0, middle: 0.5),
                  child: Text(
                    'Welcome'.tr,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 15,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 70.0, end: 0.0),
            child: SvgPicture.string(
              _svg_x5yl0h,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 70.0, middle: 0.5),
            Pin(size: 70.0, end: 35.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff1d4f8b),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 42.0, middle: 0.5),
            Pin(size: 42.0, end: 49.0),
            child: Stack(
              children: <Widget>[
                Container(),
                Padding(
                  padding: EdgeInsets.all(5.3),
                  child: SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_lbs806,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 39.0, middle: 0.5477),
            Pin(size: 39.0, start: 104.5),
            child: Container(),
          ),
          Pinned.fromPins(
            Pin(size: 19.0, end: 63.0),
            Pin(size: 19.0, middle: 0.268),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: SvgPicture.string(
                  _svg_p1rmj,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 46.0, middle: 0.3159),
            Pin(size: 46.0, start: 47.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfff2f2f2),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 29.0,
                    height: 22.0,
                    child: Stack(
                      children: <Widget>[
                        SizedBox.expand(
                            child: SvgPicture.string(
                          _svg_ns3zl4,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 173.0, start: 40.0),
            Pin(size: 51.0, middle: 0.4686),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffe2b443),
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 173.0, end: 40.0),
            Pin(size: 51.0, middle: 0.4686),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff4486d5),
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 151.0, start: 62.0),
            Pin(size: 38.0, middle: 0.197),
            child: Text(
              '1,000 okg',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 32,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.438, -0.461),
            child: SizedBox(
              width: 103.0,
              height: 17.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 17.0, middle: 0.5),
                    child: Text(
                      'User 17016273',
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 15,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 16.0, end: 55.0),
            Pin(size: 20.4, middle: 0.204),
            child: SvgPicture.string(
              _svg_ixcwbu,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 9.0, end: 56.0),
            Pin(size: 9.0, middle: 0.1995),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffe2b443),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.567, -0.061),
            child: SizedBox(
              width: 106.0,
              height: 23.0,
              child: Text(
                'Buy Coins',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 20,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.573, -0.061),
            child: SizedBox(
              width: 106.0,
              height: 23.0,
              child: Text(
                'sellcoins'.tr,
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 20,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 27.0, end: 60.0),
            Pin(size: 27.0, middle: 0.3084),
            child: Stack(
              children: <Widget>[
                Container(),
                Padding(
                  padding: EdgeInsets.all(3.4),
                  child: SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_siap1o,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(1.0, -0.255),
            child: Container(
              width: 148.0,
              height: 67.0,
              color: const Color(0xffe5e5e5),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.255),
            child: Container(
              width: 148.0,
              height: 67.0,
              color: const Color(0xffe5e5e5),
            ),
          ),
          Align(
            alignment: Alignment(-1.0, -0.255),
            child: Container(
              width: 148.0,
              height: 67.0,
              color: const Color(0xffe5e5e5),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 41.0, start: 30.0),
            Pin(size: 33.0, middle: 0.3627),
            child: Text(
              '8.8',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 28,
                color: const Color(0xe05d5d5d),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 89.0, start: 30.0),
            Pin(size: 12.0, middle: 0.3971),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 12.0, middle: 0.5),
                  child: Text(
                    'Available Quantity',
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 11,
                      color: const Color(0xff6e6e6e),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(-0.597, -0.268),
            child: SizedBox(
              width: 26.0,
              height: 14.0,
              child: Text(
                'GC',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 12,
                  color: const Color(0xff5d5d5d),
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.115, -0.275),
            child: SizedBox(
              width: 41.0,
              height: 33.0,
              child: Text(
                '8.8',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 28,
                  color: const Color(0xe05d5d5d),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.003, -0.206),
            child: SizedBox(
              width: 89.0,
              height: 12.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 12.0, middle: 0.5),
                    child: Text(
                      'Sell order balance',
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 11,
                        color: const Color(0xff6e6e6e),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.114, -0.268),
            child: SizedBox(
              width: 26.0,
              height: 14.0,
              child: Text(
                'GC',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 12,
                  color: const Color(0xff5d5d5d),
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.622, -0.275),
            child: SizedBox(
              width: 41.0,
              height: 33.0,
              child: Text(
                '8.8',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 28,
                  color: const Color(0xe05d5d5d),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 68.0, end: 50.0),
            Pin(size: 12.0, middle: 0.3971),
            child: Text(
              'In transaction',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 11,
                color: const Color(0xff6e6e6e),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 26.0, end: 37.0),
            Pin(size: 14.0, middle: 0.3662),
            child: Text(
              'GC',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 12,
                color: const Color(0xff5d5d5d),
              ),
              softWrap: false,
            ),
          ),
          Align(
            alignment: Alignment(0.003, 0.046),
            child: SizedBox(
              width: 89.0,
              height: 13.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 13.0, middle: 0.5),
                    child: Text(
                      'My peding order',
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 11,
                        color: const Color(0xff6e6e6e),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 40.0, end: 40.0),
            Pin(size: 133.0, middle: 0.6278),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd3e0f0),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 1.0, color: const Color(0xffd4d4d4)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.251),
            child: Container(
              width: 84.0,
              height: 84.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.003, 0.416),
            child: SizedBox(
              width: 95.0,
              height: 13.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 13.0, middle: 0.5),
                    child: Text(
                      'Transaction record',
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 11,
                        color: const Color(0xff6e6e6e),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 40.0, end: 40.0),
            Pin(size: 133.0, end: 121.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd3e0f0),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 1.0, color: const Color(0xffd4d4d4)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 40.0, start: 40.0),
            Pin(size: 40.0, end: 21.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.643),
            child: Container(
              width: 84.0,
              height: 84.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 28.0, start: 30.0),
            Pin(size: 28.0, end: 21.0),
            child: Container(
              decoration: BoxDecoration(),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 24.0, start: 48.0),
            Pin(size: 22.8, end: 29.2),
            child: SvgPicture.string(
              _svg_mhzw9h,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 40.0, middle: 0.2819),
            Pin(size: 40.0, end: 21.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff1d4f8b),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 40.0, middle: 0.7279),
            Pin(size: 40.0, end: 21.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff1d4f8b),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 28.0, middle: 0.6952),
            Pin(size: 28.0, end: 21.0),
            child: Container(
              decoration: BoxDecoration(),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 40.0, end: 40.0),
            Pin(size: 40.0, end: 21.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff1d4f8b),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 22.8, middle: 0.2916),
            Pin(size: 22.8, end: 29.3),
            child: Stack(
              children: <Widget>[
                Container(),
                Padding(
                  padding: EdgeInsets.fromLTRB(1.4, 2.8, 1.6, 2.1),
                  child: SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_gio5vx,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 22.8, middle: 0.7196),
            Pin(size: 22.8, end: 29.3),
            child: Stack(
              children: <Widget>[
                Container(),
                Padding(
                  padding: EdgeInsets.fromLTRB(2.8, 2.9, 1.6, 3.6),
                  child: SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_n4iggw,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 22.8, end: 48.3),
            Pin(size: 22.8, end: 29.3),
            child: Stack(
              children: <Widget>[
                Container(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.4, vertical: 4.3),
                  child: SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_dqqdvu,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 25.0, start: 48.0),
            Pin(size: 11.0, end: 9.0),
            child: Text(
              'Home',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 9,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 59.0, middle: 0.2725),
            Pin(size: 11.0, end: 9.0),
            child: Text(
              'Pending order',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 9,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 24.0, middle: 0.7193),
            Pin(size: 11.0, end: 9.0),
            child: Text(
              'Order',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 9,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 34.0, end: 43.0),
            Pin(size: 11.0, end: 9.0),
            child: Text(
              'Manage',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 9,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 46.0, middle: 0.4701),
            Pin(size: 46.0, start: 47.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfff2f2f2),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 29.0,
                    height: 22.0,
                    child: Stack(
                      children: <Widget>[
                        SizedBox.expand(
                            child: SvgPicture.string(
                          _svg_ns3zl4,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 46.0, middle: 0.6244),
            Pin(size: 46.0, start: 47.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfff2f2f2),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 29.0,
                    height: 22.0,
                    child: Stack(
                      children: <Widget>[
                        SizedBox.expand(
                            child: SvgPicture.string(
                          _svg_ns3zl4,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xbf1f2022),
            margin: EdgeInsets.fromLTRB(-19.0, -15.0, -10.0, -16.0),
          ),
          Pinned.fromPins(
            Pin(start: 34.0, end: 29.0),
            Pin(size: 345.0, end: 98.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd3e0f0),
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.003, 0.119),
            child: SizedBox(
              width: 127.0,
              height: 22.0,
              child: Text(
                'Authentication',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 18,
                  color: const Color(0xff1d4f8b),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 108.0, end: 108.0),
            Pin(size: 36.0, middle: 0.7547),
            child: Text(
              'Please \ndo real-nameauthentication first ',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff1d4f8b),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 93.0, end: 92.0),
            Pin(size: 50.0, middle: 0.8286),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(9.0),
                border: Border.all(width: 2.0, color: const Color(0xff1d4f8b)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.004, 0.632),
            child: SizedBox(
              width: 193.0,
              height: 27.0,
              child: Text(
                'Authenticate now',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 23,
                  color: const Color(0xff1d4f8b),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.004, 0.327),
            child: Container(
              width: 179.0,
              height: 103.0,
              decoration: BoxDecoration(
                color: const Color(0xff1d4f8b),
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.218, 0.302),
            child: Container(
              width: 62.0,
              height: 62.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(61.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.21, 0.295),
            child: SizedBox(
              width: 70.0,
              height: 44.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 1.0, start: 0.0),
                    child: SvgPicture.string(
                      _svg_zdel1,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment(-1.0, -0.538),
                    child: SizedBox(
                      width: 25.0,
                      height: 1.0,
                      child: SvgPicture.string(
                        _svg_qt6lpn,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 53.0,
                      height: 1.0,
                      child: SvgPicture.string(
                        _svg_f4mgmk,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 6.6),
                    Pin(size: 1.0, middle: 0.792),
                    child: SvgPicture.string(
                      _svg_lc3naw,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 47.6, end: 5.5),
                    Pin(size: 1.0, end: -1.0),
                    child: SvgPicture.string(
                      _svg_nry3q0,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_l75u9y =
    '<svg viewBox="-3.0 0.0 451.0 260.0" ><path transform="translate(-3.0, 0.0)" d="M 451 0 L 451 260 L 0 260 L 451 0 Z" fill="#5390d5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fwt3e4 =
    '<svg viewBox="45.9 31.6 1.0 1.0" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 0 2.644927740097046 L 0 2.644927740097046 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_x5yl0h =
    '<svg viewBox="0.0 826.0 448.0 70.0" ><path transform="translate(1137.0, -209.0)" d="M -689.0004272460938 1105.001220703125 L -689.0004272460938 1105.000244140625 L -1136.999755859375 1105.000244140625 L -1136.999755859375 1035 L -953.0001220703125 1035 C -953.0001220703125 1040.3994140625 -951.94287109375 1045.637573242188 -949.8566284179688 1050.56982421875 C -947.8419799804688 1055.3330078125 -944.957763671875 1059.610595703125 -941.2841186523438 1063.284057617188 C -937.6106567382812 1066.95751953125 -933.3328247070312 1069.841552734375 -928.5695190429688 1071.856201171875 C -923.6380615234375 1073.942016601562 -918.3995971679688 1074.999633789062 -912.9996337890625 1074.999633789062 C -907.5996704101562 1074.999633789062 -902.3612060546875 1073.942016601562 -897.4298706054688 1071.856201171875 C -892.6666259765625 1069.841552734375 -888.388916015625 1066.95751953125 -884.715576171875 1063.284057617188 C -881.0420532226562 1059.610717773438 -878.157958984375 1055.3330078125 -876.1433715820312 1050.56982421875 C -874.0575561523438 1045.638305664062 -873 1040.39990234375 -873 1035 L -871.2549438476562 1035 L -689.0004272460938 1035 L -689.0004272460938 1105.000244140625 L -689.0004272460938 1105.001220703125 Z" fill="#4486d5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lbs806 =
    '<svg viewBox="5.3 5.3 31.5 31.5" ><path transform="translate(5.25, 5.25)" d="M 30.18802452087402 31.49921417236328 L 22.31144905090332 31.49921417236328 C 21.58844566345215 31.49921417236328 21.0002613067627 30.9110279083252 21.0002613067627 30.18802452087402 L 21.0002613067627 22.31144905090332 C 21.0002613067627 21.58844757080078 21.58844566345215 21.0002613067627 22.31144905090332 21.0002613067627 L 30.18802452087402 21.0002613067627 C 30.91102981567383 21.0002613067627 31.49921417236328 21.58844757080078 31.49921417236328 22.31144905090332 L 31.49921417236328 30.18802452087402 C 31.49921417236328 30.9110279083252 30.91102981567383 31.49921417236328 30.18802452087402 31.49921417236328 Z M 23.62499809265137 23.625 L 23.62499809265137 28.87447738647461 L 28.87447738647461 28.87447738647461 L 28.87447738647461 23.625 L 23.62499809265137 23.625 Z M 17.06197357177734 31.49921417236328 L 17.05934715270996 31.49921417236328 L 14.43723678588867 31.49921417236328 L 14.43723678588867 23.625 L 17.06197357177734 23.625 L 17.06197357177734 31.49658584594727 L 17.06197357177734 31.49921417236328 Z M 9.187761306762695 31.49921417236328 L 1.313549995422363 31.49921417236328 C 0.5892599821090698 31.49921417236328 0 30.9110279083252 0 30.18802452087402 L 0 22.31144905090332 C 0 21.58844757080078 0.5892599821090698 21.0002613067627 1.313549995422363 21.0002613067627 L 9.187761306762695 21.0002613067627 C 9.9107666015625 21.0002613067627 10.49894905090332 21.58844757080078 10.49894905090332 22.31144905090332 L 10.49894905090332 30.18802452087402 C 10.49894905090332 30.9110279083252 9.9107666015625 31.49921417236328 9.187761306762695 31.49921417236328 Z M 2.62473726272583 23.625 L 2.62473726272583 28.87447738647461 L 7.874212265014648 28.87447738647461 L 7.874212265014648 23.625 L 2.62473726272583 23.625 Z M 17.06197357177734 21.0002613067627 L 17.05934715270996 21.0002613067627 L 14.43723678588867 21.0002613067627 L 14.43723678588867 18.37552452087402 L 17.06197357177734 18.37552452087402 L 17.06197357177734 20.99763679504395 L 17.06197357177734 21.0002613067627 Z M 31.49921417236328 17.06197547912598 L 31.49658584594727 17.06197547912598 L 21.0002613067627 17.06197547912598 L 21.0002613067627 14.4372386932373 L 31.49921417236328 14.4372386932373 L 31.49921417236328 17.05934906005859 L 31.49921417236328 17.06197547912598 Z M 14.43723678588867 15.75078773498535 L 1.313549995422363 15.75078773498535 C 0.5892599821090698 15.75078773498535 0 15.16152763366699 0 14.4372386932373 L 0 1.313549995422363 C 0 0.5892601013183594 0.5892599821090698 1.001358000962682e-07 1.313549995422363 1.001358000962682e-07 L 14.43723678588867 1.001358000962682e-07 C 15.16152667999268 1.001358000962682e-07 15.75078582763672 0.5892601013183594 15.75078582763672 1.313549995422363 L 15.75078582763672 14.4372386932373 C 15.75078582763672 15.16152763366699 15.16152667999268 15.75078773498535 14.43723678588867 15.75078773498535 Z M 2.62473726272583 2.62473726272583 L 2.62473726272583 13.12604904174805 L 13.12604904174805 13.12604904174805 L 13.12604904174805 2.62473726272583 L 2.62473726272583 2.62473726272583 Z M 30.18802452087402 10.49894905090332 L 22.31144905090332 10.49894905090332 C 21.58844566345215 10.49894905090332 21.0002613067627 9.9107666015625 21.0002613067627 9.187762260437012 L 21.0002613067627 1.313549995422363 C 21.0002613067627 0.5892601013183594 21.58844566345215 1.001358000962682e-07 22.31144905090332 1.001358000962682e-07 L 30.18802452087402 1.001358000962682e-07 C 30.91102981567383 1.001358000962682e-07 31.49921417236328 0.5892601013183594 31.49921417236328 1.313549995422363 L 31.49921417236328 9.187762260437012 C 31.49921417236328 9.9107666015625 30.91102981567383 10.49894905090332 30.18802452087402 10.49894905090332 Z M 23.62499809265137 2.62473726272583 L 23.62499809265137 7.874212265014648 L 28.87447738647461 7.874212265014648 L 28.87447738647461 2.62473726272583 L 23.62499809265137 2.62473726272583 Z M 10.49894905090332 10.49894905090332 L 10.49632453918457 10.49894905090332 L 5.24947452545166 10.49894905090332 L 5.24947452545166 5.24947452545166 L 10.49894905090332 5.24947452545166 L 10.49894905090332 10.49632453918457 L 10.49894905090332 10.49894905090332 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_p1rmj =
    '<svg viewBox="2187.8 -813.2 19.0 19.0" ><path transform="translate(2187.82, -813.18)" d="M 17.5385627746582 19 L 1.461437344551086 19 C 0.6555932760238647 19 0 18.34440803527832 0 17.5385627746582 L 0 1.461437344551086 C 0 0.6555932760238647 0.6555932760238647 0 1.461437344551086 0 L 17.5385627746582 0 C 18.34440803527832 0 19 0.6555932760238647 19 1.461437344551086 L 19 17.5385627746582 C 19 18.34440803527832 18.34440803527832 19 17.5385627746582 19 Z M 1.461437344551086 1.461437344551086 L 1.461437344551086 17.5385627746582 L 17.5385627746582 17.5385627746582 L 17.5385627746582 1.461437344551086 L 1.461437344551086 1.461437344551086 Z M 4.384312152862549 16.07858848571777 L 4.382850170135498 16.07858848571777 L 2.922874689102173 16.07712554931641 L 2.922874689102173 14.40916633605957 C 2.922874689102173 13.88763046264648 3.195050477981567 13.41835880279541 3.633204460144043 13.18450736999512 C 5.486214160919189 12.19469165802002 7.4600830078125 11.69281387329102 9.5 11.69281387329102 C 11.53940582275391 11.69281387329102 13.51372718811035 12.19469165802002 15.36811256408691 13.18450736999512 C 15.80544662475586 13.41792011260986 16.07712554931641 13.88719177246094 16.07712554931641 14.40916633605957 L 16.07712554931641 16.07566452026367 L 14.61568832397461 16.07712554931641 L 14.61568832397461 14.43942165374756 C 12.99488067626953 13.58708667755127 11.27345657348633 13.15425109863281 9.5 13.15425109863281 C 7.727114200592041 13.15425109863281 6.005952835083008 13.58664703369141 4.384312152862549 14.43942165374756 L 4.384312152862549 16.07712554931641 L 4.384312152862549 16.07858848571777 Z M 9.5 10.23137664794922 C 7.48504638671875 10.23137664794922 5.845748901367188 8.59207820892334 5.845748901367188 6.577125072479248 C 5.845748901367188 4.562171936035156 7.48504638671875 2.922874689102173 9.5 2.922874689102173 C 11.51495361328125 2.922874689102173 13.15425109863281 4.562171936035156 13.15425109863281 6.577125072479248 C 13.15425109863281 8.59207820892334 11.51495361328125 10.23137664794922 9.5 10.23137664794922 Z M 9.5 4.384312152862549 C 8.291606903076172 4.384312152862549 7.308501720428467 5.368001461029053 7.308501720428467 6.577125072479248 C 7.308501720428467 7.78624963760376 8.291606903076172 8.769939422607422 9.5 8.769939422607422 C 10.70912456512451 8.769939422607422 11.69281387329102 7.78624963760376 11.69281387329102 6.577125072479248 C 11.69281387329102 5.368001461029053 10.70912456512451 4.384312152862549 9.5 4.384312152862549 Z" fill="#e2b443" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ns3zl4 =
    '<svg viewBox="2195.3 -739.0 28.7 21.5" ><path transform="translate(2195.31, -739.0)" d="M 26.48002243041992 21.53216171264648 L 2.206502676010132 21.53216171264648 C 0.9898258447647095 21.53216171264648 0 20.56632423400879 0 19.3791389465332 L 0 2.153022289276123 C 0 0.9658347368240356 0.9898258447647095 0 2.206502676010132 0 L 26.48002243041992 0 C 27.69669532775879 0 28.6865234375 0.9658347368240356 28.6865234375 2.153022289276123 L 28.6865234375 19.3791389465332 C 28.6865234375 20.56632423400879 27.69669532775879 21.53216171264648 26.48002243041992 21.53216171264648 Z M 2.206502676010132 4.164577007293701 L 2.206502676010132 19.3791389465332 L 26.48002243041992 19.3791389465332 L 26.48002243041992 4.164577007293701 L 14.34326171875 12.05963802337646 L 2.206502676010132 4.164577007293701 Z M 3.092281341552734 2.153022289276123 L 14.34326171875 9.472522735595703 L 25.59423828125 2.153022289276123 L 3.092281341552734 2.153022289276123 Z" fill="#1d4f8b" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ixcwbu =
    '<svg viewBox="377.0 178.6 16.0 20.4" ><path transform="translate(377.0, 178.64)" d="M 7.999045848846436 20.35793495178223 C 6.276595592498779 20.35793495178223 4.778454303741455 19.13442993164062 4.4367995262146 17.4487247467041 L 0.7292893528938293 17.4487247467041 C 0.4517313838005066 17.4487247467041 0.2022375017404556 17.29467582702637 0.07817397266626358 17.04671096801758 C -0.04761993139982224 16.79525184631348 -0.02191150188446045 16.51062774658203 0.1469236612319946 16.28530120849609 L 1.455610632896423 14.54082107543945 L 1.455610632896423 7.99738597869873 C 1.455610632896423 4.656264781951904 3.956424236297607 1.860633134841919 7.272724628448486 1.494520664215088 L 7.272724628448486 6.942748598248727e-08 L 8.726675987243652 6.942748598248727e-08 L 8.726675987243652 1.494520664215088 C 12.04166793823242 1.860502362251282 14.54248142242432 4.656744956970215 14.54248142242432 7.99738597869873 L 14.54248142242432 14.54082107543945 L 15.85116767883301 16.28530120849609 C 16.02007675170898 16.51071548461914 16.04576873779297 16.79548454284668 15.91988849639893 17.04708671569824 C 15.7959566116333 17.29482269287109 15.54697036743164 17.4487247467041 15.27011013031006 17.4487247467041 L 11.56129264831543 17.4487247467041 C 11.21972465515137 19.13394927978516 9.720987319946289 20.35793495178223 7.999045848846436 20.35793495178223 Z M 5.941789627075195 17.4487247467041 C 6.249112606048584 18.31837463378906 7.075868606567383 18.90267562866211 7.999045848846436 18.90267562866211 C 8.922223091125488 18.90267562866211 9.748978614807129 18.31837463378906 10.05630207061768 17.4487247467041 L 5.941789627075195 17.4487247467041 Z M 7.999045848846436 2.907902717590332 C 5.192697048187256 2.907902717590332 2.909562110900879 5.191038131713867 2.909562110900879 7.99738597869873 L 2.909562110900879 15.0250358581543 L 2.183240652084351 15.99477195739746 L 13.81615924835205 15.99477195739746 L 13.08853054046631 15.0250358581543 L 13.08853054046631 7.99738597869873 C 13.08853054046631 5.191038131713867 10.80539512634277 2.907902717590332 7.999045848846436 2.907902717590332 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_siap1o =
    '<svg viewBox="3.4 3.4 20.2 20.2" ><path transform="translate(3.38, 3.38)" d="M 15.1875 20.2494945526123 L 1.687331199645996 20.2494945526123 C 0.7569281458854675 20.2494945526123 0 19.49256706237793 0 18.56216239929199 L 0 5.061994075775146 C 0 4.131590366363525 0.7569281458854675 3.374662399291992 1.687331199645996 3.374662399291992 L 15.1875 3.374662399291992 C 16.11790466308594 3.374662399291992 16.87483024597168 4.131590366363525 16.87483024597168 5.061994075775146 L 16.87483024597168 18.56216239929199 C 16.87483024597168 19.49256706237793 16.11790466308594 20.2494945526123 15.1875 20.2494945526123 Z M 1.687331199645996 5.061994075775146 L 1.687331199645996 18.56216239929199 L 15.1875 18.56216239929199 L 15.1875 5.061994075775146 L 1.687331199645996 5.061994075775146 Z M 9.422325134277344 17.43828773498535 L 9.420638084411621 17.43828773498535 L 7.734993457794189 17.43828773498535 L 7.734993457794189 12.51601886749268 L 2.812725067138672 12.51601886749268 L 2.812725067138672 10.82868766784668 L 7.734993457794189 10.82868766784668 L 7.734993457794189 6.187387466430664 L 9.422325134277344 6.187387466430664 L 9.422325134277344 10.82868766784668 L 14.06210708618164 10.82868766784668 L 14.06210708618164 12.51601886749268 L 9.422325134277344 12.51601886749268 L 9.422325134277344 17.43659973144531 L 9.422325134277344 17.43828773498535 Z M 20.2494945526123 16.87483024597168 L 20.24780654907227 16.87483024597168 L 18.56216430664062 16.87483024597168 L 18.56216430664062 1.687331199645996 L 3.374662637710571 1.687331199645996 L 3.374662637710571 0 L 18.56216430664062 0 C 19.49256706237793 0 20.2494945526123 0.7569281458854675 20.2494945526123 1.687331199645996 L 20.2494945526123 16.87314414978027 L 20.2494945526123 16.87483024597168 Z" fill="#e2b443" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_mhzw9h =
    '<svg viewBox="48.0 844.0 24.0 22.8" ><path transform="translate(48.0, 844.0)" d="M 18.99449920654297 22.75047302246094 L 4.994325160980225 22.75047302246094 C 4.029462337493896 22.75047302246094 3.244499921798706 21.96479225158691 3.244499921798706 20.99907302856445 L 3.244499921798706 10.86235523223877 L 1.237950086593628 12.86892223358154 L 0 11.63095474243164 L 11.37464904785156 0.2563225626945496 C 11.53993701934814 0.09103497862815857 11.75975513458252 0 11.99362468719482 0 C 12.22749423980713 0 12.4473123550415 0.09103497862815857 12.61260032653809 0.2563225626945496 L 23.98725128173828 11.63095474243164 L 22.74930000305176 12.86892223358154 L 20.74432563781738 10.86235523223877 L 20.74432563781738 20.99907302856445 C 20.74432563781738 21.96479225158691 19.95936393737793 22.75047302246094 18.99449920654297 22.75047302246094 Z M 11.99362468719482 2.111655235290527 L 11.99360752105713 2.111672401428223 L 4.994325160980225 9.112546920776367 L 4.994325160980225 20.99907302856445 L 18.99449920654297 20.99907302856445 L 18.99449920654297 9.112546920776367 L 11.99362468719482 2.111672401428223 L 11.99362468719482 2.111655235290527 Z M 15.49327373504639 18.3751049041748 L 15.4915246963501 18.3751049041748 L 8.493974685668945 18.3751049041748 L 8.493974685668945 16.62529754638672 L 15.49327373504639 16.62527847290039 L 15.49327373504639 18.37335395812988 L 15.49327373504639 18.3751049041748 Z" fill="#4486d5" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_gio5vx =
    '<svg viewBox="1.4 2.8 19.7 17.8" ><path transform="translate(1.42, 2.84)" d="M 16.79717826843262 17.77358055114746 C 16.20869255065918 17.77358055114746 15.72991752624512 17.29538917541504 15.72991752624512 16.70759963989258 C 15.72991752624512 16.11911392211914 16.20869255065918 15.64033985137939 16.79717826843262 15.64033985137939 C 17.38496589660645 15.64033985137939 17.86315727233887 16.11911392211914 17.86315727233887 16.70759963989258 C 17.86315727233887 17.29538917541504 17.38496589660645 17.77358055114746 16.79717826843262 17.77358055114746 Z M 5.332457542419434 17.77358055114746 C 4.743971824645996 17.77358055114746 4.265198230743408 17.29538917541504 4.265198230743408 16.70759963989258 C 4.265198230743408 16.11911392211914 4.743971824645996 15.64033985137939 5.332457542419434 15.64033985137939 C 5.920246124267578 15.64033985137939 6.3984375 16.11911392211914 6.3984375 16.70759963989258 C 6.3984375 17.29538917541504 5.920246124267578 17.77358055114746 5.332457542419434 17.77358055114746 Z M 18.48380470275879 14.21860790252686 L 18.48238372802734 14.21860790252686 L 5.337576389312744 14.21860790252686 C 4.779746532440186 14.21860790252686 4.307754993438721 13.81873416900635 4.215290546417236 13.26779937744141 L 2.242012500762939 1.421732902526855 L 0 1.421732902526855 L 0 0 L 2.482593774795532 0 C 3.040423631668091 0 3.512415170669556 0.3998738825321198 3.60487961769104 0.9508078098297119 L 3.919682741165161 2.843465566635132 L 18.59001922607422 2.843465566635132 C 18.94217681884766 2.843465566635132 19.26859474182129 3.002786636352539 19.48557281494141 3.280564308166504 C 19.70294952392578 3.558867931365967 19.77859497070312 3.91496205329895 19.6931095123291 4.257520198822021 L 18.48380470275879 9.090900421142578 C 18.35812759399414 9.598736763000488 17.90452003479004 9.953409194946289 17.38071441650391 9.953409194946289 L 5.104673385620117 9.953409194946289 L 5.579437255859375 12.796875 L 18.48380470275879 12.796875 L 18.48380470275879 14.21718502044678 L 18.48380470275879 14.21860790252686 Z M 4.156424999237061 4.265198230743408 L 4.867931365966797 8.531676292419434 L 17.15933036804199 8.531676292419434 L 18.22530937194824 4.265198230743408 L 4.156424999237061 4.265198230743408 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_n4iggw =
    '<svg viewBox="2.8 2.9 18.3 16.3" ><path transform="translate(2.84, 2.9)" d="M 14.21860790252686 16.29278182983398 L 14.21718597412109 16.29278182983398 L 12.79686069488525 16.29278182983398 L 12.79687404632568 0.7548165917396545 C 12.79687404632568 0.2823417186737061 13.18240165710449 0 13.55511856079102 0 C 13.75204753875732 0 13.93950843811035 0.07901359349489212 14.08296012878418 0.2224665731191635 L 18.27649688720703 4.414722919464111 L 17.27066230773926 5.420557022094727 L 14.21860790252686 2.368502378463745 L 14.21860790252686 16.29136085510254 L 14.21860790252686 16.29278182983398 Z M 10.66363620758057 16.29278182983398 L 10.66221332550049 16.29278182983398 L 0 16.29278182983398 L 0 14.87104892730713 L 10.66363620758057 14.87104892730713 L 10.66363620758057 16.29136085510254 L 10.66363620758057 16.29278182983398 Z M 10.66363620758057 9.182838439941406 L 10.66221332550049 9.182838439941406 L 0 9.182838439941406 L 0 7.761105537414551 L 10.66363620758057 7.761105537414551 L 10.66363620758057 9.181417465209961 L 10.66363620758057 9.182838439941406 Z M 10.66363620758057 2.074174165725708 L 10.66221332550049 2.074174165725708 L 0 2.074174165725708 L 0 0.6524416208267212 L 10.66363620758057 0.6524416208267212 L 10.66363620758057 2.072752475738525 L 10.66363620758057 2.074174165725708 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_dqqdvu =
    '<svg viewBox="1.4 4.3 19.9 14.2" ><path transform="translate(1.42, 4.27)" d="M 18.48380661010742 14.21860790252686 L 1.421732902526855 14.21860790252686 C 0.637782096862793 14.21860790252686 0 13.58082485198975 0 12.796875 L 0 1.421732783317566 C 0 0.6377820372581482 0.637782096862793 0 1.421732902526855 0 L 18.48380661010742 0 C 19.26845359802246 0 19.90682029724121 0.6377820372581482 19.90682029724121 1.421732783317566 L 19.90682029724121 12.796875 C 19.90682029724121 13.58082485198975 19.26845359802246 14.21860790252686 18.48380661010742 14.21860790252686 Z M 1.421732902526855 4.976704597473145 L 1.421732902526855 12.796875 L 18.48380661010742 12.796875 L 18.48380661010742 4.976704597473145 L 1.421732902526855 4.976704597473145 Z M 1.421732902526855 1.421732783317566 L 1.421732902526855 3.554971933364868 L 18.48380661010742 3.554971933364868 L 18.48380661010742 1.421732783317566 L 1.421732902526855 1.421732783317566 Z M 7.820170402526855 11.37514209747314 L 7.818748474121094 11.37514209747314 L 3.554971694946289 11.37514209747314 L 3.554971694946289 9.953409194946289 L 7.820170402526855 9.953409194946289 L 7.820170402526855 11.37372016906738 L 7.820170402526855 11.37514209747314 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_zdel1 =
    '<svg viewBox="0.0 0.0 69.7 1.0" ><path transform="translate(0.0, 0.0)" d="M 0 0 L 69.712158203125 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qt6lpn =
    '<svg viewBox="0.0 10.0 25.5 1.0" ><path transform="translate(0.0, 10.03)" d="M 0 0 L 25.46428489685059 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f4mgmk =
    '<svg viewBox="0.0 21.5 53.1 1.0" ><path transform="translate(0.0, 21.49)" d="M 0 0 L 53.14285659790039 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lc3naw =
    '<svg viewBox="0.0 34.4 63.1 1.0" ><path transform="translate(0.0, 34.38)" d="M 0 0 L 63.06930160522461 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nry3q0 =
    '<svg viewBox="16.6 44.4 47.6 1.0" ><path transform="translate(16.57, 44.41)" d="M 0 0 L 47.60714340209961 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
