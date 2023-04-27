import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RecordBetPage extends StatelessWidget {
  RecordBetPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 180.0, middle: 0.5017),
            Pin(size: 68.0, start: 56.0),
            child: Text(
              'betting record'.tr,
              style: TextStyle(
                fontFamily: 'PingFang SC',
                fontSize: 20,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 355.0, middle: 0.5),
            Pin(start: 120.0, end: 0.0),
            child: SingleChildScrollView(
              primary: false,
              child: SizedBox(
                width: 355.0,
                height: 746.0,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 169.0, 0.0, -54.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 150.0, end: 0.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xfeffffff),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 203.0, start: 27.0),
                                  Pin(size: 90.0, middle: 0.5385),
                                  child: Text(
                                    'Downline betting'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 12,
                                      color: const Color(0xff1e3c8d),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 56.0, start: 27.0),
                                  Pin(size: 20.0, middle: 0.7846),
                                  child: Text(
                                    'Downline winning'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      color: const Color(0xff707070),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(-0.487, 0.569),
                                  child: SizedBox(
                                    width: 8.0,
                                    height: 20.0,
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                        fontFamily: 'PingFang SC',
                                        fontSize: 14,
                                        color: const Color(0xff1e3c8d),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 8.0, end: 20.0),
                                  Pin(size: 20.0, middle: 0.7846),
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      color: const Color(0xff1e3c8d),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(0.21, 0.569),
                                  child: SizedBox(
                                    width: 8.0,
                                    height: 20.0,
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                        fontFamily: 'PingFang SC',
                                        fontSize: 14,
                                        color: const Color(0xff1e3c8d),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 56.0, end: 37.0),
                                  Pin(size: 20.0, middle: 0.7846),
                                  child: Text(
                                    'Offline profit'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      color: const Color(0xff707070),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(-0.03, 0.569),
                                  child: SizedBox(
                                    width: 56.0,
                                    height: 20.0,
                                    child: Text(
                                      'Number of people offline'.tr,
                                      style: TextStyle(
                                        fontFamily: 'PingFang SC',
                                        fontSize: 14,
                                        color: const Color(0xff707070),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 24.0, start: 27.0),
                                  Pin(size: 54.0, start: 16.0),
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 39,
                                      color: const Color(0xff1e3c8d),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                    softWrap: false,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 68.0, end: 20.0),
                                  Pin(size: 27.0, middle: 0.1951),
                                  child: Stack(
                                    children: <Widget>[
                                      Pinned.fromPins(
                                        Pin(start: 10.0, end: 10.0),
                                        Pin(size: 17.0, middle: 0.5),
                                        child: Text(
                                          'View details'.tr,
                                          style: TextStyle(
                                            fontFamily: 'PingFang SC',
                                            fontSize: 12,
                                            color: const Color(0xff707070),
                                          ),
                                          softWrap: false,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          border: Border.all(
                                              width: 1.0,
                                              color: const Color(0xff707070)),
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
                            Pin(size: 250.0, middle: 0.6417),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xfeffffff),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 170.0, start: 27.0),
                                  Pin(size: 120.0, middle: 0.5385),
                                  child: Text(
                                    'Cumulative total winnings'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      color: const Color(0xff1e3c8d),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 56.0, start: 27.0),
                                  Pin(size: 20.0, middle: 0.7846),
                                  child: Text(
                                    'Win today'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      color: const Color(0xff707070),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(-0.887, 0.569),
                                  child: SizedBox(
                                    width: 8.0,
                                    height: 20.0,
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                        fontFamily: 'PingFang SC',
                                        fontSize: 14,
                                        color: const Color(0xff1e3c8d),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 8.0, end: 20.0),
                                  Pin(size: 20.0, middle: 0.7846),
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      color: const Color(0xff1e3c8d),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 56.0, end: 37.0),
                                  Pin(size: 20.0, middle: 0.7846),
                                  child: Text(
                                    'Win yesterday'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      color: const Color(0xff707070),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 23.0, start: 27.0),
                                  Pin(size: 54.0, start: 16.0),
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 39,
                                      color: const Color(0xff1e3c8d),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 68.0, end: 20.0),
                                  Pin(size: 27.0, middle: 0.1951),
                                  child: Stack(
                                    children: <Widget>[
                                      Pinned.fromPins(
                                        Pin(start: 10.0, end: 10.0),
                                        Pin(size: 17.0, middle: 0.5),
                                        child: Text(
                                          'View details'.tr,
                                          style: TextStyle(
                                            fontFamily: 'PingFang SC',
                                            fontSize: 12,
                                            color: const Color(0xff707070),
                                          ),
                                          softWrap: false,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          border: Border.all(
                                              width: 1.0,
                                              color: const Color(0xff707070)),
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
                            Pin(size: 150.0, middle: 0.2951),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xfeffffff),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 84.0, start: 27.0),
                                  Pin(size: 20.0, middle: 0.5385),
                                  child: Text(
                                    'Cumulative total bet'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      color: const Color(0xff1e3c8d),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 56.0, start: 27.0),
                                  Pin(size: 20.0, middle: 0.7846),
                                  child: Text(
                                    'Bet Today'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      color: const Color(0xff707070),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(-0.487, 0.569),
                                  child: SizedBox(
                                    width: 8.0,
                                    height: 20.0,
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                        fontFamily: 'PingFang SC',
                                        fontSize: 14,
                                        color: const Color(0xff1e3c8d),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 6.0, end: 22.0),
                                  Pin(size: 20.0, middle: 0.7846),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      color: const Color(0xff1e3c8d),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 56.0, end: 37.0),
                                  Pin(size: 20.0, middle: 0.7846),
                                  child: Text(
                                    'bet yesterday'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      color: const Color(0xff707070),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 39.0, start: 27.0),
                                  Pin(size: 54.0, start: 16.0),
                                  child: Text(
                                    '10',
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 39,
                                      color: const Color(0xff1e3c8d),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 68.0, end: 20.0),
                                  Pin(size: 27.0, middle: 0.1951),
                                  child: Stack(
                                    children: <Widget>[
                                      Pinned.fromPins(
                                        Pin(start: 10.0, end: 10.0),
                                        Pin(size: 17.0, middle: 0.5),
                                        child: Text(
                                          'View details'.tr,
                                          style: TextStyle(
                                            fontFamily: 'PingFang SC',
                                            fontSize: 12,
                                            color: const Color(0xff707070),
                                          ),
                                          softWrap: false,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          border: Border.all(
                                              width: 1.0,
                                              color: const Color(0xff707070)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 112.0, middle: 0.5062),
                            Pin(size: 70.0, start: 54.0),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment(1.0, -0.4),
                                  child: SizedBox(
                                    width: 96.0,
                                    height: 20.0,
                                    child: Text(
                                      'historical jackpot'.tr,
                                      style: TextStyle(
                                        fontFamily: 'PingFang SC',
                                        fontSize: 14,
                                        color: const Color(0xff1e3c8d),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 38.0, middle: 0.7568),
                                  Pin(size: 20.0, end: 9.0),
                                  child: Text(
                                    'USDT',
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 14,
                                      color: const Color(0xff1e3c8d),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                    softWrap: false,
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 30.0, start: 0.0),
                                  Pin(start: 0.0, end: 0.0),
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 50,
                                      color: const Color(0xff1e3c8d),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 52.0, end: 51.0),
                            Pin(size: 42.0, start: 0.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  margin:
                                      EdgeInsets.fromLTRB(0.0, 0.0, 1.0, 0.0),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 126.0, start: 0.0),
                                  Pin(start: 0.0, end: 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 126.0, end: 0.0),
                                  Pin(start: 0.0, end: 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffd9e3f5),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(-0.542, 0.0),
                                  child: SizedBox(
                                    width: 38.0,
                                    height: 20.0,
                                    child: Text(
                                      'USDT',
                                      style: TextStyle(
                                        fontFamily: 'PingFang SC',
                                        fontSize: 14,
                                        color: const Color(0xff1e3c8d),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(0.563, 0.0),
                                  child: SizedBox(
                                    width: 28.0,
                                    height: 20.0,
                                    child: Text(
                                      'TRX',
                                      style: TextStyle(
                                        fontFamily: 'PingFang SC',
                                        fontSize: 14,
                                        color: const Color(0xff1e3c8d),
                                        fontWeight: FontWeight.w500,
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
                      Pin(size: 150.0, start: 0.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfe1e3c8d),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 56.0, start: 45.0),
                            Pin(size: 20.0, middle: 0.7538),
                            child: Text(
                              'betting record'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 14,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.003, 0.508),
                            child: SizedBox(
                              width: 56.0,
                              height: 20.0,
                              child: Text(
                                'Withdrawals record'.tr,
                                style: TextStyle(
                                  fontFamily: 'PingFang SC',
                                  fontSize: 14,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                                softWrap: false,
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 56.0, end: 45.0),
                            Pin(size: 20.0, middle: 0.7538),
                            child: Text(
                              'Anti-water record'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 14,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.658, -0.254),
                            child: SizedBox(
                              width: 37.0,
                              height: 37.0,
                              child: Stack(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      SizedBox.expand(
                                          child: SvgPicture.string(
                                        _svg_jgx47o,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      )),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: SizedBox(
                                          width: 28.0,
                                          height: 28.0,
                                          child: SvgPicture.string(
                                            _svg_dyb0qc,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(0.442, -0.443),
                                        child: SizedBox(
                                          width: 14.0,
                                          height: 14.0,
                                          child: SvgPicture.string(
                                            _svg_fg068o,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.0, -0.267),
                            child: SizedBox(
                              width: 38.0,
                              height: 35.0,
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.0, 8.2, 0.0, 0.0),
                                    child: SizedBox.expand(
                                        child: SvgPicture.string(
                                      _svg_bef0lu,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 5.1, end: 2.9),
                                    Pin(size: 24.8, start: 0.0),
                                    child: SvgPicture.string(
                                      _svg_rewcgk,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.647, -0.235),
                            child: SizedBox(
                              width: 32.0,
                              height: 36.0,
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment(0.041, 0.119),
                                    child: SizedBox(
                                      width: 3.0,
                                      height: 3.0,
                                      child: SvgPicture.string(
                                        _svg_lhv7p3,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(-0.271, 0.119),
                                    child: SizedBox(
                                      width: 3.0,
                                      height: 3.0,
                                      child: SvgPicture.string(
                                        _svg_e742u,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(-0.584, 0.119),
                                    child: SizedBox(
                                      width: 3.0,
                                      height: 3.0,
                                      child: SvgPicture.string(
                                        _svg_f2vcdk,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                  ),
                                  SizedBox.expand(
                                      child: SvgPicture.string(
                                    _svg_w0d8s,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  )),
                                  Pinned.fromPins(
                                    Pin(start: 6.0, end: 6.0),
                                    Pin(size: 2.4, middle: 0.1714),
                                    child: SvgPicture.string(
                                      _svg_ulr,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 6.0, end: 6.0),
                                    Pin(size: 2.4, middle: 0.3688),
                                    child: SvgPicture.string(
                                      _svg_f81ds5,
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

const String _svg_jgx47o =
    '<svg viewBox="0.0 0.2 37.2 37.2" ><path transform="translate(-7.0, -6.78)" d="M 25.59099197387695 44.18215179443359 C 23.08157920837402 44.18215179443359 20.64564323425293 43.6898193359375 18.35299873352051 42.71985244750977 C 16.13751029968262 41.78295135498047 14.14981746673584 40.44189453125 12.44502925872803 38.73709869384766 C 10.73656940460205 37.02862930297852 9.39919376373291 35.04092788696289 8.462296485900879 32.82910537719727 C 7.492330551147461 30.53645324707031 7 28.10050392150879 7 25.59107971191406 C 7 23.08165168762207 7.492330551147461 20.64570617675781 8.462296485900879 18.35305213928223 C 9.39919376373291 16.13755416870117 10.74024391174316 14.1498498916626 12.44502925872803 12.44505500793457 C 14.15349006652832 10.73658561706543 16.14118576049805 9.399204254150391 18.35299873352051 8.462302207946777 C 20.64564323425293 7.492332935333252 23.08157920837402 7.000000476837158 25.59099197387695 7.000000476837158 C 27.34721946716309 7.000000476837158 29.0850715637207 7.246166229248047 30.75679016113281 7.727476596832275 C 31.53570365905762 7.95159912109375 31.98761940002441 8.767254829406738 31.75982093811035 9.546169281005859 C 31.53570365905762 10.32508373260498 30.72005081176758 10.77700233459473 29.94113922119141 10.54920673370361 C 28.53395462036133 10.14505195617676 27.0716609954834 9.939301490783691 25.59099197387695 9.939301490783691 C 16.96051216125488 9.939301490783691 9.939287185668945 16.96055603027344 9.939287185668945 25.59107971191406 C 9.939287185668945 34.22159957885742 16.96051216125488 41.24285507202148 25.59099197387695 41.24285507202148 C 34.22148132324219 41.24285507202148 41.24270248413086 34.22159957885742 41.24270248413086 25.59107971191406 C 41.24270248413086 23.9854850769043 41.00021362304688 22.40193939208984 40.52257537841797 20.88819885253906 C 40.28008270263672 20.11295700073242 40.70995712280273 19.28995132446289 41.48519515991211 19.04378700256348 C 42.26043319702148 18.80129432678223 43.08343124389648 19.23116683959961 43.3296012878418 20.00640869140625 C 43.89540863037109 21.80672836303711 44.18199157714844 23.6878833770752 44.18199157714844 25.59107971191406 C 44.18199157714844 28.10050392150879 43.68965911865234 30.53645324707031 42.71969604492188 32.82910537719727 C 41.78279876708984 35.04460144042969 40.44174957275391 37.03230667114258 38.73696136474609 38.73709869384766 C 37.03217315673828 40.44189071655273 35.04080963134766 41.78295135498047 32.8289909362793 42.71985244750977 C 30.53634262084961 43.68982315063477 28.10040855407715 44.18215179443359 25.59099197387695 44.18215179443359 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dyb0qc =
    '<svg viewBox="9.8 0.0 27.6 27.8" ><path transform="translate(-263.23, -1.1)" d="M 281.9281005859375 28.87271690368652 C 279.5435485839844 28.87271690368652 277.3023681640625 27.94316101074219 275.615966796875 26.25674057006836 C 273.9295654296875 24.57032012939453 273 22.3291015625 273 19.94459342956543 C 273 17.56008529663086 273.9295654296875 15.31886959075928 275.615966796875 13.63244533538818 C 277.3023681640625 11.94601821899414 279.5435485839844 11.01646423339844 281.9281005859375 11.01646423339844 C 282.6004638671875 11.01646423339844 283.2691040039062 11.08994770050049 283.915771484375 11.24058628082275 C 284.7056884765625 11.42061901092529 285.2016906738281 12.20688247680664 285.0216674804688 13.00049591064453 C 284.8416442871094 13.79043292999268 284.0553894042969 14.28643798828125 283.2617797851562 14.10640716552734 C 282.8282165527344 14.00720500946045 282.3763122558594 13.95576667785645 281.9244079589844 13.95576667785645 C 278.6213989257812 13.95576667785645 275.9356079101562 16.64155578613281 275.9356079101562 19.94459342956543 C 275.9356079101562 23.24763488769531 278.6213989257812 25.93341636657715 281.9244079589844 25.93341636657715 C 285.2274475097656 25.93341636657715 287.9131774902344 23.24763488769531 287.9131774902344 19.94459342956543 C 287.9131774902344 19.44491195678711 287.8507385253906 18.95257759094238 287.733154296875 18.47494316101074 C 287.5347595214844 17.68868064880371 288.0123901367188 16.88772010803223 288.7986755371094 16.68931579589844 C 289.5848999023438 16.49091339111328 290.3858642578125 16.96855163574219 290.5842590332031 17.75481414794922 C 290.7642822265625 18.46759605407715 290.8561706542969 19.20241928100586 290.8561706542969 19.94459342956543 C 290.8561706542969 22.3291015625 289.9266052246094 24.57032012939453 288.2401733398438 26.25674057006836 C 286.5538024902344 27.94316101074219 284.3125610351562 28.87271690368652 281.9281005859375 28.87271690368652 Z M 292.9761047363281 5.251761436462402 C 293.33984375 6.963903427124023 294.6919250488281 8.323330879211426 296.400390625 8.694416999816895 L 293.9534606933594 11.14138507843018 C 293.3986206054688 10.86582565307617 292.7850646972656 10.68946838378906 292.1531372070312 10.62333297729492 L 291.1464233398438 10.52045822143555 L 291.0398559570312 9.495376586914062 C 290.9737548828125 8.867100715637207 290.7973937988281 8.257196426391602 290.5218200683594 7.702404022216797 L 292.9761047363281 5.251761436462402 M 293.7329711914062 1.099998712539673 C 293.2884216308594 1.099998712539673 292.8401489257812 1.257986068725586 292.4690856933594 1.603353977203369 C 292.4507446289062 1.621724605560303 292.4323425292969 1.636420965194702 292.4140014648438 1.654791712760925 L 288.0491333007812 6.023327827453613 C 287.2959594726562 6.776524066925049 287.2004089355469 7.941221237182617 287.7662048339844 8.793618202209473 C 287.9646301269531 9.094897270202637 288.0821838378906 9.443939208984375 288.1189575195312 9.804003715515137 L 288.3467407226562 11.97541236877441 C 288.4201965332031 12.69186687469482 288.9897155761719 13.25768375396729 289.7061767578125 13.3311653137207 L 291.8591918945312 13.54794025421143 C 292.2192687988281 13.58468055725098 292.5646362304688 13.69857978820801 292.8658752441406 13.89698123931885 C 293.2333068847656 14.13947486877441 293.6558227539062 14.26072025299072 294.0783386230469 14.26072025299072 C 294.6441345214844 14.26072025299072 295.206298828125 14.04394817352295 295.6361694335938 13.61407375335693 L 300.0046997070312 9.249210357666016 C 300.0230712890625 9.230838775634766 300.0414428710938 9.212469100952148 300.05615234375 9.194098472595215 C 301.1252746582031 8.051444053649902 300.3905029296875 6.170292377471924 298.8289794921875 6.01230525970459 L 297.1866760253906 5.846969127655029 C 296.4701843261719 5.773486614227295 295.9007263183594 5.207671165466309 295.8272094726562 4.491216659545898 L 295.6508483886719 2.823163747787476 C 295.5443115234375 1.776037693023682 294.6515197753906 1.099998474121094 293.7329711914062 1.099998474121094 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fg068o =
    '<svg viewBox="17.0 6.6 13.7 13.7" ><path transform="translate(-453.76, -174.2)" d="M 472.2696533203125 194.4934387207031 C 471.8948364257812 194.4934387207031 471.5164794921875 194.3501281738281 471.2298583984375 194.0635528564453 C 470.6566772460938 193.4903869628906 470.6566772460938 192.5608367919922 471.2298583984375 191.9839935302734 L 481.9839477539062 181.2298278808594 C 482.5570678710938 180.6566772460938 483.4866943359375 180.6566772460938 484.0634765625 181.2298278808594 C 484.640380859375 181.8030090332031 484.6366577148438 182.7325592041016 484.0634765625 183.3093872070312 L 473.3094482421875 194.0598907470703 C 473.0228271484375 194.3501434326172 472.6480712890625 194.4934387207031 472.2696533203125 194.4934387207031 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bef0lu =
    '<svg viewBox="0.0 8.2 37.6 27.3" ><path transform="translate(-0.17, -243.1)" d="M 34.41293716430664 278.5641174316406 L 3.555492162704468 278.5641174316406 C 1.690367221832275 278.5641174316406 0.1729965209960938 277.0466613769531 0.1729965209960938 275.1816101074219 L 0.1729965209960938 254.6324920654297 C 0.1729965209960938 252.7673492431641 1.690366983413696 251.2499694824219 3.555492162704468 251.2499694824219 L 34.41293716430664 251.2499694824219 C 36.2780647277832 251.2499694824219 37.79543685913086 252.7673492431641 37.79543685913086 254.6324920654297 L 37.79543685913086 259.4993591308594 C 37.79543685913086 260.1728210449219 37.2495002746582 260.7187805175781 36.57603454589844 260.7187805175781 L 29.73535537719727 260.7187805175781 C 27.42595672607422 260.7187805175781 25.54713439941406 262.59765625 25.54713439941406 264.9070129394531 C 25.54713439941406 267.2163696289062 27.42595863342285 269.0952453613281 29.73535537719727 269.0952453613281 L 36.57600402832031 269.0952453613281 C 37.24946594238281 269.0952453613281 37.79540252685547 269.6411743164062 37.79540252685547 270.3146362304688 L 37.79540252685547 275.1815795898438 C 37.79540252685547 277.0466613769531 36.27803039550781 278.5641174316406 34.41293716430664 278.5641174316406 Z M 3.555492162704468 253.6888580322266 C 3.035164833068848 253.6888580322266 2.611834049224854 254.1121826171875 2.611834049224854 254.6324920654297 L 2.611834049224854 275.1816101074219 C 2.611834049224854 275.7018737792969 3.035128116607666 276.125244140625 3.555492162704468 276.125244140625 L 34.41293716430664 276.125244140625 C 34.93323135375977 276.125244140625 35.35656356811523 275.7019348144531 35.35656356811523 275.1816101074219 L 35.35656356811523 271.5341491699219 L 29.73535537719727 271.5341491699219 C 26.08116149902344 271.5341491699219 23.1082592010498 268.5612182617188 23.1082592010498 264.9070434570312 C 23.1082592010498 261.2528381347656 26.08116149902344 258.2799377441406 29.73535537719727 258.2799377441406 L 35.35652542114258 258.2799377441406 L 35.35652542114258 254.6324920654297 C 35.35652542114258 254.1121826171875 34.93323135375977 253.6888580322266 34.41290283203125 253.6888580322266 L 3.555492162704468 253.6888580322266 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rewcgk =
    '<svg viewBox="5.1 0.0 29.6 24.8" ><path transform="translate(-134.47, -29.33)" d="M 167.0032806396484 51.14306259155273 C 167.0032806396484 52.78558349609375 165.671630859375 54.11727142333984 164.0290832519531 54.11727142333984 C 162.3864898681641 54.11727142333984 161.0548553466797 52.78558349609375 161.0548553466797 51.14306259155273 C 161.0548553466797 49.50032043457031 162.3864898681641 48.1688232421875 164.0290832519531 48.1688232421875 C 165.671630859375 48.1688232421875 167.0032806396484 49.50032043457031 167.0032806396484 51.14306259155273 Z M 164.8406677246094 31.78762054443359 C 165.0538330078125 31.72567558288574 165.2777709960938 31.84868431091309 165.3397521972656 32.06185913085938 L 166.6556854248047 36.5877571105957 L 169.1955108642578 36.5877571105957 L 167.6816253662109 31.38097190856934 C 167.2442321777344 29.87641716003418 165.6643981933594 29.00840377807617 164.1598205566406 29.44573593139648 L 139.5959930419922 36.5877571105957 L 148.3314208984375 36.5877571105957 L 164.8406677246094 31.78762054443359 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lhv7p3 =
    '<svg viewBox="15.3 18.5 2.6 2.6" ><path transform="translate(-486.94, -499.66)" d="M 503.5571899414062 519.4556274414062 M 502.244140625 519.4556274414062 C 502.244140625 520.1808471679688 502.83203125 520.7687377929688 503.5571899414062 520.7687377929688 C 504.2824096679688 520.7687377929688 504.8702392578125 520.1808471679688 504.8702392578125 519.4556274414062 C 504.8702392578125 518.73046875 504.2824096679688 518.142578125 503.5571899414062 518.142578125 C 502.83203125 518.142578125 502.244140625 518.73046875 502.244140625 519.4556274414062 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e742u =
    '<svg viewBox="10.7 18.5 2.6 2.6" ><path transform="translate(-395.42, -499.66)" d="M 407.4443054199219 519.4556274414062 M 406.1312255859375 519.4556274414062 C 406.1312255859375 520.1808471679688 406.7191162109375 520.7687377929688 407.4443054199219 520.7687377929688 C 408.1694641113281 520.7687377929688 408.7573547363281 520.1808471679688 408.7573547363281 519.4556274414062 C 408.7573547363281 518.73046875 408.1694641113281 518.142578125 407.4443054199219 518.142578125 C 406.7191162109375 518.142578125 406.1312255859375 518.73046875 406.1312255859375 519.4556274414062 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f2vcdk =
    '<svg viewBox="6.1 18.5 2.6 2.6" ><path transform="translate(-303.9, -499.66)" d="M 311.3313903808594 519.4556274414062 M 310.0183410644531 519.4556274414062 C 310.0183410644531 520.1808471679688 310.6062316894531 520.7687377929688 311.3313903808594 520.7687377929688 C 312.0566101074219 520.7687377929688 312.6445007324219 520.1808471679688 312.6445007324219 519.4556274414062 C 312.6445007324219 518.73046875 312.0566101074219 518.142578125 311.3313903808594 518.142578125 C 310.6062316894531 518.142578125 310.0183410644531 518.73046875 310.0183410644531 519.4556274414062 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_w0d8s =
    '<svg viewBox="0.0 0.0 32.0 35.7" ><path transform="translate(-182.11, -131.52)" d="M 211.9635772705078 131.5229339599609 L 184.2855834960938 131.5229339599609 C 183.076171875 131.5229339599609 182.1086730957031 132.4904632568359 182.1086730957031 133.6998443603516 L 182.1086730957031 165.0231018066406 C 182.1086730957031 166.2324981689453 183.076171875 167.2000122070312 184.2855834960938 167.2000122070312 L 211.9635772705078 167.2000122070312 C 213.1729583740234 167.2000122070312 214.1404876708984 166.2324981689453 214.1404876708984 165.0231018066406 L 214.1404876708984 133.7344207763672 C 214.1750335693359 132.5250091552734 213.1729583740234 131.5229339599609 211.9635772705078 131.5229339599609 Z M 211.7562408447266 164.8157806396484 L 184.5274658203125 164.8157806396484 L 184.5274658203125 133.9417266845703 L 211.7562408447266 133.9417266845703 L 211.7562408447266 164.8157806396484 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ulr =
    '<svg viewBox="6.0 5.7 20.0 2.4" ><path transform="translate(-302.53, -245.06)" d="M 309.7824096679688 253.1795349121094 L 327.3359985351562 253.1795349121094 C 327.9924926757812 253.1795349121094 328.54541015625 252.6266479492188 328.54541015625 251.9701232910156 C 328.54541015625 251.3135986328125 327.9924926757812 250.7607421875 327.3359985351562 250.7607421875 L 309.7824096679688 250.7607421875 C 309.1259155273438 250.7607421875 308.572998046875 251.3135986328125 308.572998046875 251.9701232910156 C 308.572998046875 252.6266479492188 309.0913696289062 253.1795349121094 309.7824096679688 253.1795349121094 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f81ds5 =
    '<svg viewBox="6.0 12.3 20.0 2.4" ><path transform="translate(-302.53, -375.8)" d="M 309.7824096679688 390.4837341308594 L 327.3359985351562 390.4837341308594 C 327.9924926757812 390.4837341308594 328.54541015625 389.9308776855469 328.54541015625 389.2743530273438 C 328.54541015625 388.6178283691406 327.9924926757812 388.06494140625 327.3359985351562 388.06494140625 L 309.7824096679688 388.06494140625 C 309.1259155273438 388.06494140625 308.572998046875 388.6178283691406 308.572998046875 389.2743530273438 C 308.572998046875 389.9308776855469 309.0913696289062 390.4837341308594 309.7824096679688 390.4837341308594 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
