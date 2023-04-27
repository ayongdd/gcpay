import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GameIntroPage extends StatelessWidget {
  GameIntroPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 355.0, middle: 0.5),
            Pin(size: 850.0, end: 99.0),
            child: SingleChildScrollView(
              primary: false,
              child: SizedBox(
                width: 355.0,
                height: 1250.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 386.0, start: 480.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfeffffff),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                            margin: EdgeInsets.fromLTRB(0.0, 67.0, 0.0, 0.0),
                          ),
                          Pinned.fromPins(
                            Pin(start: 60.0, end: 59.0),
                            Pin(size: 59.0, start: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/introduce_banner.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 176.0, middle: 0.5028),
                            Pin(size: 22.0, start: 18.0),
                            child: Text(
                              'The perfect entertainment solution for customer satisfaction'.tr,
                              style: TextStyle(
                                fontFamily: 'inpin nanzhengbeizhanNZBZti',
                                fontSize: 16,
                                color: const Color(0xfe014b38),
                              ),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 285.0, start: 19.0),
                            Pin(size: 33.0, middle: 0.2635),
                            child: Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(size: 33.0, start: 0.0),
                                  Pin(start: 0.0, end: 0.0),
                                  child: Stack(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: const AssetImage('assets/images/listtile_left_icon.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            margin: EdgeInsets.all(1.0),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0x80ffffff),
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(
                                                      9999.0, 9999.0)),
                                              border: Border.all(
                                                  width: 1.0,
                                                  color:
                                                  const Color(0x80707070)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment(0.072, 0.011),
                                        child: SizedBox(
                                          width: 12.0,
                                          height: 7.0,
                                          child: SvgPicture.string(
                                            _svg_k4avo8,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 40.0, end: -30.0),
                                  Pin(size: 29.0, middle: 1.0),
                                  child: Text(
                                    'The block hash value is unique and cannot be forged, preventing the possibility of forgery'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 10.5,
                                      color: const Color(0xcd00a889),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 264.0, start: 19.0),
                            Pin(size: 33.0, middle: 0.3881),
                            child: Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(size: 33.0, start: 0.0),
                                  Pin(start: 0.0, end: 0.0),
                                  child: Stack(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: const AssetImage('assets/images/listtile_left_icon.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            margin: EdgeInsets.all(1.0),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0x80ffffff),
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(
                                                      9999.0, 9999.0)),
                                              border: Border.all(
                                                  width: 1.0,
                                                  color:
                                                  const Color(0x80707070)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment(0.072, 0.011),
                                        child: SizedBox(
                                          width: 12.0,
                                          height: 7.0,
                                          child: SvgPicture.string(
                                            _svg_k4avo8,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 40.0, end: -30.0),
                                  Pin(size: 29.0, middle: 1.0),
                                  child: Text(
                                    'Reward pool funds, betting return TRON public chain can be checked'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 10.5,
                                      color: const Color(0xcd00a889),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 290.0, start: 19.0),
                            Pin(size: 33.0, middle: 0.5127),
                            child: Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(size: 33.0, start: 0.0),
                                  Pin(start: 0.0, end: 0.0),
                                  child: Stack(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: const AssetImage('assets/images/listtile_left_icon.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            margin: EdgeInsets.all(1.0),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0x80ffffff),
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(
                                                      9999.0, 9999.0)),
                                              border: Border.all(
                                                  width: 1.0,
                                                  color:
                                                  const Color(0x80707070)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment(0.072, 0.011),
                                        child: SizedBox(
                                          width: 12.0,
                                          height: 7.0,
                                          child: SvgPicture.string(
                                            _svg_k4avo8,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 40.0, end: -10.0),
                                  Pin(size: 47.0, middle: -0.15),
                                  child: Text(
                                    'The system will automatically distribute the prize within 10 seconds of winning the lottery, no manual work, no financial audit'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 10,
                                      color: const Color(0xcd00a889),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 266.0, start: 19.0),
                            Pin(size: 33.0, middle: 0.6374),
                            child: Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(size: 33.0, start: 0.0),
                                  Pin(start: 0.0, end: 0.0),
                                  child: Stack(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: const AssetImage('assets/images/listtile_left_icon.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            margin: EdgeInsets.all(1.0),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0x80ffffff),
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(
                                                      9999.0, 9999.0)),
                                              border: Border.all(
                                                  width: 1.0,
                                                  color:
                                                  const Color(0x80707070)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment(0.072, 0.011),
                                        child: SizedBox(
                                          width: 12.0,
                                          height: 7.0,
                                          child: SvgPicture.string(
                                            _svg_k4avo8,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 40.0, end: -20.0),
                                  Pin(size: 47.0, middle: -0.35),
                                  child: Text(
                                    'Completely anonymous, no information, no card binding, no card risk'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 10,
                                      color: const Color(0xcd00a889),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 252.0, start: 19.0),
                            Pin(size: 33.0, middle: 0.762),
                            child: Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(size: 33.0, start: 0.0),
                                  Pin(start: 0.0, end: 0.0),
                                  child: Stack(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: const AssetImage('assets/images/listtile_left_icon.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            margin: EdgeInsets.all(1.0),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0x80ffffff),
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(
                                                      9999.0, 9999.0)),
                                              border: Border.all(
                                                  width: 1.0,
                                                  color:
                                                  const Color(0x80707070)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment(0.072, 0.011),
                                        child: SizedBox(
                                          width: 12.0,
                                          height: 7.0,
                                          child: SvgPicture.string(
                                            _svg_k4avo8,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 40.0, end: -40.0),
                                  Pin(size: 47.0, middle: -0.35),
                                  child: Text(
                                    'Perfectly solve the pain points of all players! Win money to the wallet!'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 10,
                                      color: const Color(0xcd00a889),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 162.0, middle: 0.5026),
                            Pin(size: 38.0, end: 22.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xcd00a889),
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(0.07, 0.078),
                                  child: SizedBox(
                                    width: 78.0,
                                    height: 25.0,
                                    child: Text(
                                      'play now'.tr,
                                      style: TextStyle(
                                        fontFamily: 'PingFang SC',
                                        fontSize: 17,
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 443.0, start: 10.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfeffffff),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                            margin: EdgeInsets.fromLTRB(0.0, 59.0, 0.0, 0.0),
                          ),
                          Pinned.fromPins(
                            Pin(size: 120.0, start: 27.0),
                            Pin(size: 65.0, middle: 0.3000),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 37.0,
                                    height: 37.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(9999.0, 9999.0)),
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 0.0),
                                  Pin(size: 48.0, end: 0.0),
                                  child: Text(
                                    'Block hashes are unique'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 13,
                                      color: const Color(0xff707070),
                                      height: 1.5384615384615385,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 150.0, end: 27.0),
                            Pin(size: 60.0, middle: 0.3000),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 37.0,
                                    height: 37.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(9999.0, 9999.0)),
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 0.0),
                                  Pin(size: 45.0, end: 0.0),
                                  child: Text(
                                    'Block hashes cannot be forged'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 13,
                                      color: const Color(0xff707070),
                                      height: 1.5384615384615385,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 134.0, start: 27.0),
                            Pin(size: 65.0, middle: 0.5253),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 37.0,
                                    height: 37.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(9999.0, 9999.0)),
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 0.0),
                                  Pin(size: 48.0, end: 0.0),
                                  child: Text(
                                    'The system automatically recognizes whether you have won the lottery'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 13,
                                      color: const Color(0xff707070),
                                      height: 1.5384615384615385,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.482, -0.089),
                            child: SizedBox(
                              width: 115.0,
                              height: 85.0,
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 37.0,
                                      height: 37.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(9999.0, 9999.0)),
                                      ),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 0.0, end: 0.0),
                                    Pin(size: 37.0, end: 1.5954),
                                    child: Text(
                                      'TRON can check the betting rewards'.tr,
                                      style: TextStyle(
                                        fontFamily: 'PingFang SC',
                                        fontSize: 12.5,
                                        color: const Color(0xff707070),
                                        height: 1.5084615384615385,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      softWrap: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 158.0, start: 29.0),
                            Pin(size: 63.0, middle: 0.7595),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 37.0,
                                    height: 37.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(9999.0, 9999.0)),
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 0.0),
                                  Pin(size: 48.0, end: 0.0),
                                  child: Text(
                                    'No pre-charge required'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 13,
                                      color: const Color(0xff707070),
                                      height: 1.5384615384615385,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.506, 0.379),
                            child: SizedBox(
                              width: 120.0,
                              height: 83.0,
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 37.0,
                                      height: 37.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(9999.0, 9999.0)),
                                      ),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 0.0, end: 0.0),
                                    Pin(size: 35.0, end: 1.3620),
                                    child: Text(
                                      'No card binding, no frozen card risk'.tr,
                                      style: TextStyle(
                                        fontFamily: 'PingFang SC',
                                        fontSize: 12,
                                        color: const Color(0xff707070),
                                        height: 1.5384615384615385,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      softWrap: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 140.0, start: 27.0),
                            Pin(size: 68.0, end: 19.0),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 37.0,
                                    height: 37.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(9999.0, 9999.0)),
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 0.0, end: 0.0),
                                  Pin(size: 35.0, end: 0.0),
                                  child: Text(
                                    '10 seconds automatic reward cold wallet'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 13,
                                      color: const Color(0xff707070),
                                      height: 1.4384615384615385,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 125.0, middle: 0.7750),
                            Pin(size: 65.0, end: 19.0),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 37.0,
                                    height: 37.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(9999.0, 9999.0)),
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(start: 10.0, end: 0.0),
                                  Pin(size: 38.0, end: 0.2345),
                                  child: Text(
                                    'Completely anonymous game'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 13,
                                      color: const Color(0xff707070),
                                      height: 1.4384615384615385,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 25.0, start: 33.0),
                            Pin(size: 25.0, middle: 0.2177),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/introduce_icon1.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.145, -0.565),
                            child: Container(
                              width: 25.0,
                              height: 25.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/introduce_icon2.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 23.0, start: 34.0),
                            Pin(size: 19.0, middle: 0.4316),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/introduce_icon3.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.145, -0.139),
                            child: Container(
                              width: 18.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/introduce_icon4.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 24.0, start: 33.0),
                            Pin(size: 24.0, middle: 0.6372),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/introduce_icon5.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.151, 0.283),
                            child: Container(
                              width: 23.0,
                              height: 16.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/introduce_icon6.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 23.0, start: 33.0),
                            Pin(size: 23.0, end: 61.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/introduce_icon7.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 21.0, middle: 0.5749),
                            Pin(size: 26.0, end: 60.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/introduce_icon8.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 60.0, end: 59.0),
                            Pin(size: 59.0, start: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/introduce_banner.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 136.0, middle: 0.5022),
                            Pin(size: 22.0, start: 19.0),
                            child: Text(
                              'CP Hash Blockchain Game Advantage'.tr,
                              style: TextStyle(
                                fontFamily: 'inpin nanzhengbeizhanNZBZti',
                                fontSize: 16,
                                color: const Color(0xfe014b38),
                              ),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_k4avo8 =
    '<svg viewBox="44.5 810.0 11.5 7.3" ><path transform="translate(-4907.0, -1177.0)" d="M 4951.49853515625 1990.061401367188 L 4955.73486328125 1994.297973632812 L 4963.0419921875 1986.990966796875" fill="none" stroke="#5fd4ff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
