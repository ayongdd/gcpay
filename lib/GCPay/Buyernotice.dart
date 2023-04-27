import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Buyernotice extends StatelessWidget {
  Buyernotice({
    required Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0.003, -0.178),
            child: Container(
              width: 129.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: const Color(0xffd3e0f0),
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(width: 1.0, color: const Color(0xff1d4f8b)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.173),
            child: SizedBox(
              width: 148.0,
              height: 13.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 13.0, middle: 0.5),
                    child: Text(
                      'PAYMENT METHOD',
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 11,
                        color: const Color(0xff1d4f8b),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
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
            Pin(size: 191.0, middle: 0.5019),
            Pin(size: 27.0, start: 70.0),
            child: Text(
              'TRADING FLOOR',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 23,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 40.0, start: 40.0),
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
              _svg_jdjgx,
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
            Pin(size: 25.0, start: 45.0),
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
          Align(
            alignment: Alignment(0.234, -0.055),
            child: Container(
              width: 239.0,
              height: 41.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: const Color(0x4d707070)),
              ),
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
            Pin(startFraction: 0.0711, endFraction: 0.8944),
            Pin(startFraction: 0.0353, endFraction: 0.9371),
            child: SvgPicture.string(
              _svg_yrsu,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 119.0, start: 30.0),
            Pin(size: 22.0, start: 114.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 22.0, middle: 0.5),
                  child: Text(
                    'GCPAY NOTE: ',
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 18,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: -21.0, end: -38.0),
            Pin(size: 43.0, middle: 0.3259),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff1d4f8b),
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.06, -0.339),
            child: SizedBox(
              width: 180.0,
              height: 22.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 22.0, middle: 0.5),
                    child: Text(
                      'Payment information',
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 18,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 118.0, start: 35.0),
            Pin(size: 41.0, middle: 0.4725),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd3e0f0),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 74.0, end: 35.0),
            Pin(size: 41.0, middle: 0.4725),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd4d4d4),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: const Color(0xff1d4f8b)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.234, 0.057),
            child: SizedBox(
              width: 239.0,
              height: 41.0,
              child: SvgPicture.string(
                _svg_foia3,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 29.0, end: 57.0),
            Pin(size: 32.0, middle: 0.4734),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.565, -0.053),
            child: SizedBox(
              width: 80.0,
              height: 15.0,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 13,
                    color: const Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text: '100.0',
                    ),
                    TextSpan(
                      text: ' GC',
                      style: TextStyle(
                        color: const Color(0xff5d5d5d),
                      ),
                    ),
                  ],
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.234, 0.17),
            child: Container(
              width: 239.0,
              height: 41.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: const Color(0x4d707070)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.234, 0.282),
            child: SizedBox(
              width: 239.0,
              height: 41.0,
              child: SvgPicture.string(
                _svg_fez5h,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.234, 0.394),
            child: Container(
              width: 239.0,
              height: 41.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: const Color(0x4d707070)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.234, 0.506),
            child: SizedBox(
              width: 239.0,
              height: 41.0,
              child: SvgPicture.string(
                _svg_b215cb,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.234, 0.619),
            child: SizedBox(
              width: 239.0,
              height: 41.0,
              child: SvgPicture.string(
                _svg_nxb3lh,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 118.0, start: 35.0),
            Pin(size: 41.0, middle: 0.5287),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd3e0f0),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 29.0, end: 57.0),
            Pin(size: 32.0, middle: 0.5289),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.565, 0.056),
            child: SizedBox(
              width: 80.0,
              height: 15.0,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 13,
                    color: const Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text: '150.0',
                    ),
                    TextSpan(
                      text: ' GC',
                      style: TextStyle(
                        color: const Color(0xff5d5d5d),
                      ),
                    ),
                  ],
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 118.0, start: 35.0),
            Pin(size: 41.0, middle: 0.5848),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd3e0f0),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.565, 0.165),
            child: SizedBox(
              width: 80.0,
              height: 15.0,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 13,
                    color: const Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text: '200.0',
                    ),
                    TextSpan(
                      text: ' GC',
                      style: TextStyle(
                        color: const Color(0xff5d5d5d),
                      ),
                    ),
                  ],
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 118.0, start: 35.0),
            Pin(size: 41.0, middle: 0.6409),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd3e0f0),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 29.0, end: 57.0),
            Pin(size: 32.0, middle: 0.64),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.565, 0.274),
            child: SizedBox(
              width: 80.0,
              height: 15.0,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 13,
                    color: const Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text: '250.0',
                    ),
                    TextSpan(
                      text: ' GC',
                      style: TextStyle(
                        color: const Color(0xff5d5d5d),
                      ),
                    ),
                  ],
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 118.0, start: 35.0),
            Pin(size: 41.0, middle: 0.6971),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd3e0f0),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 29.0, end: 57.0),
            Pin(size: 32.0, middle: 0.6956),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.565, 0.383),
            child: SizedBox(
              width: 80.0,
              height: 15.0,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 13,
                    color: const Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text: '300.0',
                    ),
                    TextSpan(
                      text: ' GC',
                      style: TextStyle(
                        color: const Color(0xff5d5d5d),
                      ),
                    ),
                  ],
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 118.0, start: 35.0),
            Pin(size: 41.0, middle: 0.7532),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd3e0f0),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 29.0, end: 57.0),
            Pin(size: 32.0, middle: 0.7512),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.565, 0.491),
            child: SizedBox(
              width: 80.0,
              height: 15.0,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 13,
                    color: const Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text: '350.0',
                    ),
                    TextSpan(
                      text: ' GC',
                      style: TextStyle(
                        color: const Color(0xff5d5d5d),
                      ),
                    ),
                  ],
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 118.0, start: 35.0),
            Pin(size: 41.0, middle: 0.8094),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd3e0f0),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.565, 0.6),
            child: SizedBox(
              width: 80.0,
              height: 15.0,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 13,
                    color: const Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text: '400.0',
                    ),
                    TextSpan(
                      text: ' GC',
                      style: TextStyle(
                        color: const Color(0xff5d5d5d),
                      ),
                    ),
                  ],
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 27.0, end: 58.0),
            Pin(size: 16.0, middle: 0.4727),
            child: Text(
              'BUY',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 13,
                color: const Color(0xff1d4f8b),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 74.0, end: 35.0),
            Pin(size: 41.0, middle: 0.5287),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd4d4d4),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: const Color(0xff1d4f8b)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 27.0, end: 58.0),
            Pin(size: 16.0, middle: 0.5273),
            child: Text(
              'BUY',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 13,
                color: const Color(0xff1d4f8b),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 74.0, end: 35.0),
            Pin(size: 41.0, middle: 0.5848),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd4d4d4),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: const Color(0xff1d4f8b)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 27.0, end: 58.0),
            Pin(size: 16.0, middle: 0.5818),
            child: Text(
              'BUY',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 13,
                color: const Color(0xff1d4f8b),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 74.0, end: 35.0),
            Pin(size: 41.0, middle: 0.6409),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd4d4d4),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: const Color(0xff1d4f8b)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 27.0, end: 58.0),
            Pin(size: 16.0, middle: 0.6364),
            child: Text(
              'BUY',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 13,
                color: const Color(0xff1d4f8b),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 74.0, end: 35.0),
            Pin(size: 41.0, middle: 0.6971),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd4d4d4),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: const Color(0xff1d4f8b)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 27.0, end: 58.0),
            Pin(size: 16.0, middle: 0.6909),
            child: Text(
              'BUY',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 13,
                color: const Color(0xff1d4f8b),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 74.0, end: 35.0),
            Pin(size: 41.0, middle: 0.7532),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd4d4d4),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: const Color(0xff1d4f8b)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 27.0, end: 58.0),
            Pin(size: 16.0, middle: 0.7455),
            child: Text(
              'BUY',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 13,
                color: const Color(0xff1d4f8b),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 74.0, end: 35.0),
            Pin(size: 41.0, middle: 0.8094),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd4d4d4),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: const Color(0xff1d4f8b)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 27.0, end: 58.0),
            Pin(size: 16.0, middle: 0.8),
            child: Text(
              'BUY',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 13,
                color: const Color(0xff1d4f8b),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 41.6, middle: 0.4774),
            Pin(size: 39.1, start: 27.7),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(1.4, 0.0, 0.0, 0.0),
                      child: SizedBox.expand(
                          child: SvgPicture.string(
                        _svg_xqpawy,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      )),
                    ),
                    Pinned.fromPins(
                      Pin(size: 28.3, start: 1.4),
                      Pin(size: 10.4, end: 0.0),
                      child: BlendMask(
                        blendMode: BlendMode.multiply,
                        child: SvgPicture.string(
                          _svg_kmeecd,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 26.9, start: 5.2),
                      Pin(size: 27.9, start: 1.6),
                      child: SvgPicture.string(
                        _svg_pyqu9n,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Align(
                      alignment: Alignment(-1.0, 0.108),
                      child: SizedBox(
                        width: 21.0,
                        height: 24.0,
                        child: SvgPicture.string(
                          _svg_iz2wub,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.341, 0.396),
                      child: SizedBox(
                        width: 17.0,
                        height: 7.0,
                        child: BlendMask(
                          blendMode: BlendMode.multiply,
                          child: SvgPicture.string(
                            _svg_sh5ibr,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 30.0, end: 30.0),
            Pin(size: 91.0, middle: 0.1752),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 91.0, middle: 0.5),
                  child: Text(
                    'Recently, some criminals have deceived users through WeChat, Alipay, etc.. for example, if you called say that the account is delayed is delayed or Alipay, WeChat QR side risk control is the reason to add friends, do not add! Any private transaction is always a liar. Don’t believe the SMS arrival notification, the actual arrival of online banking shall prevail. If you encounter  any problem during the transaction, please contact our APP official Online Customer Service.',
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 11,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 63.0, start: 60.0),
            Pin(size: 63.0, end: 87.0),
            child: Container(),
          ),
          Pinned.fromPins(
            Pin(size: 28.0, start: 41.0),
            Pin(size: 28.0, middle: 0.4735),
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
            Pin(size: 28.0, start: 41.0),
            Pin(size: 28.0, middle: 0.5288),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 28.0, start: 41.0),
            Pin(size: 28.0, middle: 0.5841),
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
            Pin(size: 28.0, start: 41.0),
            Pin(size: 28.0, middle: 0.6394),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 28.0, start: 41.0),
            Pin(size: 28.0, middle: 0.6947),
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
            Pin(size: 28.0, start: 41.0),
            Pin(size: 28.0, middle: 0.75),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 28.0, start: 41.0),
            Pin(size: 28.0, middle: 0.8053),
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
            Pin(size: 1.0, start: 74.5),
            Pin(size: 25.0, middle: 0.4736),
            child: SvgPicture.string(
              _svg_wua465,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 1.0, start: 74.5),
            Pin(size: 25.0, middle: 0.5287),
            child: SvgPicture.string(
              _svg_fxh8rv,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 1.0, start: 74.5),
            Pin(size: 25.0, middle: 0.5838),
            child: SvgPicture.string(
              _svg_cfow0d,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 1.0, start: 74.5),
            Pin(size: 25.0, middle: 0.6389),
            child: SvgPicture.string(
              _svg_h3zdx,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 1.0, start: 74.5),
            Pin(size: 25.0, middle: 0.694),
            child: SvgPicture.string(
              _svg_vrmb,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 1.0, start: 74.5),
            Pin(size: 25.0, middle: 0.7491),
            child: SvgPicture.string(
              _svg_cux3rz,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 1.0, start: 74.5),
            Pin(size: 25.0, middle: 0.8042),
            child: SvgPicture.string(
              _svg_bxcrr,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment(0.002, -0.054),
            child: Container(
              width: 27.0,
              height: 27.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.002, 0.056),
            child: Container(
              width: 27.0,
              height: 27.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.002, 0.167),
            child: Container(
              width: 27.0,
              height: 27.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.002, 0.284),
            child: Container(
              width: 27.0,
              height: 27.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.002, 0.388),
            child: Container(
              width: 27.0,
              height: 27.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.002, 0.498),
            child: Container(
              width: 27.0,
              height: 27.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.002, 0.609),
            child: Container(
              width: 27.0,
              height: 27.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.301, -0.052),
            child: SizedBox(
              width: 56.0,
              height: 12.0,
              child: Text(
                'Not for sale',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 11,
                  color: const Color(0xff5d5d5d),
                  letterSpacing: -0.187,
                  height: 1.0909090909090908,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.367, 0.057),
            child: SizedBox(
              width: 75.0,
              height: 12.0,
              child: Text(
                'Not removable',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 11,
                  color: const Color(0xff5d5d5d),
                  letterSpacing: -0.187,
                  height: 1.0909090909090908,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.301, 0.165),
            child: SizedBox(
              width: 56.0,
              height: 12.0,
              child: Text(
                'Not for sale',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 11,
                  color: const Color(0xff5d5d5d),
                  letterSpacing: -0.187,
                  height: 1.0909090909090908,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.367, 0.281),
            child: SizedBox(
              width: 75.0,
              height: 12.0,
              child: Text(
                'For sale',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 11,
                  color: const Color(0xff5d5d5d),
                  letterSpacing: -0.187,
                  height: 1.0909090909090908,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.367, 0.382),
            child: SizedBox(
              width: 75.0,
              height: 12.0,
              child: Text(
                'For sale',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 11,
                  color: const Color(0xff5d5d5d),
                  letterSpacing: -0.187,
                  height: 1.0909090909090908,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.301, 0.491),
            child: SizedBox(
              width: 56.0,
              height: 12.0,
              child: Text(
                'Not for sale',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 11,
                  color: const Color(0xff5d5d5d),
                  letterSpacing: -0.187,
                  height: 1.0909090909090908,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.301, 0.6),
            child: SizedBox(
              width: 56.0,
              height: 12.0,
              child: Text(
                'Not for sale',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 11,
                  color: const Color(0xff5d5d5d),
                  letterSpacing: -0.187,
                  height: 1.0909090909090908,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 69.0, start: 35.0),
            Pin(size: 18.0, middle: 0.41),
            child: Text(
              'Quantity',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 16,
                color: const Color(0xff1d4f8b),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 83.0, end: 46.5),
            Pin(size: 18.0, middle: 0.41),
            child: Text(
              'Way of sale',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 16,
                color: const Color(0xff1d4f8b),
              ),
            ),
          ),
          Container(
            color: const Color(0xbf1f2022),
            margin: EdgeInsets.fromLTRB(-14.0, -15.0, -15.0, -16.0),
          ),
          Pinned.fromPins(
            Pin(start: 32.0, end: 31.0),
            Pin(size: 574.0, middle: 0.5497),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.487),
            child: SizedBox(
              width: 218.0,
              height: 42.0,
              child: Text(
                'Buyer Notice',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 35,
                  color: const Color(0xff1d4f8b),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 86.5, end: 85.6),
            Pin(size: 1.0, middle: 0.3106),
            child: SvgPicture.string(
              _svg_fp15lo,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 67.0, end: 67.0),
            Pin(size: 60.0, middle: 0.3624),
            child: Text(
              'In order to ensure the safety of your Transaction and funds, do not trust privately to add friends to conduct transactions, and any losses will be borne bt the individual ',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 13,
                color: const Color(0xff1d4f8b),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 67.0, end: 67.0),
            Pin(size: 45.0, middle: 0.4571),
            child: Text(
              '1. You need to use the payment information you bind to pay the seller. If the payment information does not match, the seller has the right not to give you money.',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 13,
                color: const Color(0xff1d4f8b),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 67.0, end: 67.0),
            Pin(size: 60.0, middle: 0.5359),
            child: Text(
              '2. If there is a dispute between the two parties during the transaction, please click on the upper right corner Apply for Customer Service to intervene in transaction disputes.',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 13,
                color: const Color(0xff1d4f8b),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 67.0, end: 67.0),
            Pin(size: 60.0, middle: 0.6328),
            child: Text(
              '3. Do not place frequent orders without purchasing, or maliciously cancel the order, If the verification is true, the account will be suspended.\n',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 13,
                color: const Color(0xff1d4f8b),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 78.0, end: 77.0),
            Pin(size: 50.0, middle: 0.7719),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff1d4f8b),
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.53),
            child: SizedBox(
              width: 54.0,
              height: 27.0,
              child: Text(
                'Sure',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 23,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
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
const String _svg_jdjgx =
    '<svg viewBox="48.0 844.0 24.0 22.8" ><path transform="translate(48.0, 844.0)" d="M 18.99449920654297 22.75047302246094 L 4.994325160980225 22.75047302246094 C 4.029462337493896 22.75047302246094 3.244499921798706 21.96479225158691 3.244499921798706 20.99907302856445 L 3.244499921798706 10.86235523223877 L 1.237950086593628 12.86892223358154 L 0 11.63095474243164 L 11.37464904785156 0.2563225626945496 C 11.53993701934814 0.09103497862815857 11.75975513458252 0 11.99362468719482 0 C 12.22749423980713 0 12.4473123550415 0.09103497862815857 12.61260032653809 0.2563225626945496 L 23.98725128173828 11.63095474243164 L 22.74930000305176 12.86892223358154 L 20.74432563781738 10.86235523223877 L 20.74432563781738 20.99907302856445 C 20.74432563781738 21.96479225158691 19.95936393737793 22.75047302246094 18.99449920654297 22.75047302246094 Z M 11.99362468719482 2.111655235290527 L 11.99360752105713 2.111672401428223 L 4.994325160980225 9.112546920776367 L 4.994325160980225 20.99907302856445 L 18.99449920654297 20.99907302856445 L 18.99449920654297 9.112546920776367 L 11.99362468719482 2.111672401428223 L 11.99362468719482 2.111655235290527 Z M 15.49327373504639 18.3751049041748 L 15.4915246963501 18.3751049041748 L 8.493974685668945 18.3751049041748 L 8.493974685668945 16.62529754638672 L 15.49327373504639 16.62527847290039 L 15.49327373504639 18.37335395812988 L 15.49327373504639 18.3751049041748 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_gio5vx =
    '<svg viewBox="1.4 2.8 19.7 17.8" ><path transform="translate(1.42, 2.84)" d="M 16.79717826843262 17.77358055114746 C 16.20869255065918 17.77358055114746 15.72991752624512 17.29538917541504 15.72991752624512 16.70759963989258 C 15.72991752624512 16.11911392211914 16.20869255065918 15.64033985137939 16.79717826843262 15.64033985137939 C 17.38496589660645 15.64033985137939 17.86315727233887 16.11911392211914 17.86315727233887 16.70759963989258 C 17.86315727233887 17.29538917541504 17.38496589660645 17.77358055114746 16.79717826843262 17.77358055114746 Z M 5.332457542419434 17.77358055114746 C 4.743971824645996 17.77358055114746 4.265198230743408 17.29538917541504 4.265198230743408 16.70759963989258 C 4.265198230743408 16.11911392211914 4.743971824645996 15.64033985137939 5.332457542419434 15.64033985137939 C 5.920246124267578 15.64033985137939 6.3984375 16.11911392211914 6.3984375 16.70759963989258 C 6.3984375 17.29538917541504 5.920246124267578 17.77358055114746 5.332457542419434 17.77358055114746 Z M 18.48380470275879 14.21860790252686 L 18.48238372802734 14.21860790252686 L 5.337576389312744 14.21860790252686 C 4.779746532440186 14.21860790252686 4.307754993438721 13.81873416900635 4.215290546417236 13.26779937744141 L 2.242012500762939 1.421732902526855 L 0 1.421732902526855 L 0 0 L 2.482593774795532 0 C 3.040423631668091 0 3.512415170669556 0.3998738825321198 3.60487961769104 0.9508078098297119 L 3.919682741165161 2.843465566635132 L 18.59001922607422 2.843465566635132 C 18.94217681884766 2.843465566635132 19.26859474182129 3.002786636352539 19.48557281494141 3.280564308166504 C 19.70294952392578 3.558867931365967 19.77859497070312 3.91496205329895 19.6931095123291 4.257520198822021 L 18.48380470275879 9.090900421142578 C 18.35812759399414 9.598736763000488 17.90452003479004 9.953409194946289 17.38071441650391 9.953409194946289 L 5.104673385620117 9.953409194946289 L 5.579437255859375 12.796875 L 18.48380470275879 12.796875 L 18.48380470275879 14.21718502044678 L 18.48380470275879 14.21860790252686 Z M 4.156424999237061 4.265198230743408 L 4.867931365966797 8.531676292419434 L 17.15933036804199 8.531676292419434 L 18.22530937194824 4.265198230743408 L 4.156424999237061 4.265198230743408 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_n4iggw =
    '<svg viewBox="2.8 2.9 18.3 16.3" ><path transform="translate(2.84, 2.9)" d="M 14.21860790252686 16.29278182983398 L 14.21718597412109 16.29278182983398 L 12.79686069488525 16.29278182983398 L 12.79687404632568 0.7548165917396545 C 12.79687404632568 0.2823417186737061 13.18240165710449 0 13.55511856079102 0 C 13.75204753875732 0 13.93950843811035 0.07901359349489212 14.08296012878418 0.2224665731191635 L 18.27649688720703 4.414722919464111 L 17.27066230773926 5.420557022094727 L 14.21860790252686 2.368502378463745 L 14.21860790252686 16.29136085510254 L 14.21860790252686 16.29278182983398 Z M 10.66363620758057 16.29278182983398 L 10.66221332550049 16.29278182983398 L 0 16.29278182983398 L 0 14.87104892730713 L 10.66363620758057 14.87104892730713 L 10.66363620758057 16.29136085510254 L 10.66363620758057 16.29278182983398 Z M 10.66363620758057 9.182838439941406 L 10.66221332550049 9.182838439941406 L 0 9.182838439941406 L 0 7.761105537414551 L 10.66363620758057 7.761105537414551 L 10.66363620758057 9.181417465209961 L 10.66363620758057 9.182838439941406 Z M 10.66363620758057 2.074174165725708 L 10.66221332550049 2.074174165725708 L 0 2.074174165725708 L 0 0.6524416208267212 L 10.66363620758057 0.6524416208267212 L 10.66363620758057 2.072752475738525 L 10.66363620758057 2.074174165725708 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_dqqdvu =
    '<svg viewBox="1.4 4.3 19.9 14.2" ><path transform="translate(1.42, 4.27)" d="M 18.48380661010742 14.21860790252686 L 1.421732902526855 14.21860790252686 C 0.637782096862793 14.21860790252686 0 13.58082485198975 0 12.796875 L 0 1.421732783317566 C 0 0.6377820372581482 0.637782096862793 0 1.421732902526855 0 L 18.48380661010742 0 C 19.26845359802246 0 19.90682029724121 0.6377820372581482 19.90682029724121 1.421732783317566 L 19.90682029724121 12.796875 C 19.90682029724121 13.58082485198975 19.26845359802246 14.21860790252686 18.48380661010742 14.21860790252686 Z M 1.421732902526855 4.976704597473145 L 1.421732902526855 12.796875 L 18.48380661010742 12.796875 L 18.48380661010742 4.976704597473145 L 1.421732902526855 4.976704597473145 Z M 1.421732902526855 1.421732783317566 L 1.421732902526855 3.554971933364868 L 18.48380661010742 3.554971933364868 L 18.48380661010742 1.421732783317566 L 1.421732902526855 1.421732783317566 Z M 7.820170402526855 11.37514209747314 L 7.818748474121094 11.37514209747314 L 3.554971694946289 11.37514209747314 L 3.554971694946289 9.953409194946289 L 7.820170402526855 9.953409194946289 L 7.820170402526855 11.37372016906738 L 7.820170402526855 11.37514209747314 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_yrsu =
    '<svg viewBox="31.8 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 47.32, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_foia3 =
    '<svg viewBox="129.0 452.0 239.0 41.0" ><path transform="translate(129.0, 452.0)" d="M 8 0 L 231 0 C 235.4182739257812 0 239 3.581721782684326 239 8 L 239 33 C 239 37.41827774047852 235.4182739257812 41 231 41 L 8 41 C 3.581721782684326 41 0 37.41827774047852 0 33 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z" fill="#ffffff" stroke="#707070" stroke-width="1" stroke-opacity="0.3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fez5h =
    '<svg viewBox="129.0 548.0 239.0 41.0" ><path transform="translate(129.0, 548.0)" d="M 8 0 L 231 0 C 235.4182739257812 0 239 3.581721782684326 239 8 L 239 33 C 239 37.41827774047852 235.4182739257812 41 231 41 L 8 41 C 3.581721782684326 41 0 37.41827774047852 0 33 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z" fill="#ffffff" stroke="#707070" stroke-width="1" stroke-opacity="0.3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_b215cb =
    '<svg viewBox="129.0 644.0 239.0 41.0" ><path transform="translate(129.0, 644.0)" d="M 8 0 L 231 0 C 235.4182739257812 0 239 3.581721782684326 239 8 L 239 33 C 239 37.41827774047852 235.4182739257812 41 231 41 L 8 41 C 3.581721782684326 41 0 37.41827774047852 0 33 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z" fill="#ffffff" stroke="#707070" stroke-width="1" stroke-opacity="0.3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nxb3lh =
    '<svg viewBox="129.0 692.0 239.0 41.0" ><path transform="translate(129.0, 692.0)" d="M 8 0 L 231 0 C 235.4182739257812 0 239 3.581721782684326 239 8 L 239 33 C 239 37.41827774047852 235.4182739257812 41 231 41 L 8 41 C 3.581721782684326 41 0 37.41827774047852 0 33 L 0 8 C 0 3.581721782684326 3.581721782684326 0 8 0 Z" fill="#ffffff" stroke="#707070" stroke-width="1" stroke-opacity="0.3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xqpawy =
    '<svg viewBox="1.4 3.3 40.3 39.1" ><path transform="translate(-547.1, -277.45)" d="M 579.9700317382812 281.4569396972656 L 579.9700317382812 281.4569396972656 C 579.0651245117188 282.3618774414062 579.0111083984375 283.7898559570312 579.8013916015625 284.7964477539062 C 585.5317993164062 292.0924682617188 585.0348510742188 302.6834106445312 578.3104248046875 309.4077758789062 C 571.0494384765625 316.6688232421875 559.2802124023438 316.6688232421875 552.0191650390625 309.4077758789062 L 548.4910278320312 312.9359741210938 C 557.6993408203125 322.1445922851562 572.63037109375 322.1445922851562 581.8389892578125 312.9359741210938 C 590.3800048828125 304.3949890136719 590.9989013671875 290.9298706054688 583.6952514648438 281.6752319335938 C 582.7698974609375 280.5026245117188 581.0263671875 280.400634765625 579.9700317382812 281.4569396972656 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_kmeecd =
    '<svg viewBox="1.4 32.0 28.3 10.4" ><path transform="translate(-547.1, -334.82)" d="M 576.7945556640625 368.1319274902344 C 569.494140625 374.0010070800781 558.7945556640625 373.5503540039062 552.0191650390625 366.7749633789062 L 548.4910278320312 370.3031616210938 C 556.1607055664062 377.9731750488281 567.7982177734375 379.2484741210938 576.7945556640625 374.1416625976562 L 576.7945556640625 368.1319274902344 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_pyqu9n =
    '<svg viewBox="5.2 4.9 26.9 27.9" ><path transform="translate(-554.61, -280.62)" d="M 573.6451416015625 285.5012512207031 C 568.47802734375 285.1546020507812 563.864501953125 287.6205139160156 561.1796264648438 291.5166625976562 C 560.1629638671875 292.991943359375 561.263916015625 295.0051879882812 563.0555419921875 295.0051879882812 L 563.0555419921875 295.0051879882812 C 563.7808227539062 295.0051879882812 564.47119140625 294.6622314453125 564.882080078125 294.0645751953125 C 566.647705078125 291.4979858398438 569.6492919921875 289.8457641601562 573.0281372070312 289.9664001464844 C 577.8486328125 290.1383666992188 581.83544921875 294.0182495117188 582.1277465820312 298.8327026367188 C 582.4617919921875 304.3294677734375 578.10595703125 308.8883056640625 572.6814575195312 308.8883056640625 C 568.0283203125 308.8883056640625 564.1635131835938 305.5347595214844 563.370849609375 301.1116333007812 L 559.7659912109375 304.7164306640625 C 561.849609375 309.8002624511719 566.8480834960938 313.3794555664062 572.6814575195312 313.3794555664062 C 580.7181396484375 313.3794555664062 587.1658935546875 306.5897216796875 586.6025390625 298.4327392578125 C 586.126953125 291.5416564941406 580.536865234375 285.9635620117188 573.6451416015625 285.5012512207031 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_iz2wub =
    '<svg viewBox="0.0 11.8 21.2 23.6" ><path transform="translate(-544.31, -294.6)" d="M 564.8463134765625 306.4439697265625 L 558.27392578125 306.4439697265625 C 557.6656494140625 306.4439697265625 557.3609619140625 307.1796264648438 557.7909545898438 307.609619140625 L 559.1722412109375 308.9908752441406 L 546.0244140625 322.138671875 C 543.8648681640625 324.2982788085938 543.7242431640625 327.754150390625 545.701416015625 330.0816650390625 L 562.982421875 312.8007202148438 L 564.36328125 314.1820068359375 C 564.7936401367188 314.6119995117188 565.5289916992188 314.3073425292969 565.5289916992188 313.6993408203125 L 565.5289916992188 307.126953125 C 565.5289916992188 306.7496337890625 565.2233276367188 306.4439697265625 564.8463134765625 306.4439697265625 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_sh5ibr =
    '<svg viewBox="8.2 25.5 16.8 7.3" ><path transform="translate(-560.71, -321.91)" d="M 578.7769165039062 354.6776733398438 C 581.2874755859375 354.6776733398438 583.64111328125 354.0113830566406 585.6766357421875 352.8507690429688 L 583.683349609375 348.8165893554688 C 582.2527465820312 349.685546875 580.573486328125 350.1858520507812 578.7769165039062 350.1858520507812 C 576.163330078125 350.1858520507812 573.7974243164062 349.1265869140625 572.0848388671875 347.4139709472656 L 568.908935546875 350.58984375 C 571.4345092773438 353.1154174804688 574.9237060546875 354.6776733398438 578.7769165039062 354.6776733398438 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_wua465 =
    '<svg viewBox="74.5 412.5 1.0 25.0" ><path transform="translate(74.5, 412.5)" d="M 0 0 L 0 25" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fxh8rv =
    '<svg viewBox="74.5 460.5 1.0 25.0" ><path transform="translate(74.5, 460.5)" d="M 0 0 L 0 25" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cfow0d =
    '<svg viewBox="74.5 508.5 1.0 25.0" ><path transform="translate(74.5, 508.5)" d="M 0 0 L 0 25" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_h3zdx =
    '<svg viewBox="74.5 556.5 1.0 25.0" ><path transform="translate(74.5, 556.5)" d="M 0 0 L 0 25" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vrmb =
    '<svg viewBox="74.5 604.5 1.0 25.0" ><path transform="translate(74.5, 604.5)" d="M 0 0 L 0 25" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cux3rz =
    '<svg viewBox="74.5 652.5 1.0 25.0" ><path transform="translate(74.5, 652.5)" d="M 0 0 L 0 25" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bxcrr =
    '<svg viewBox="74.5 700.5 1.0 25.0" ><path transform="translate(74.5, 700.5)" d="M 0 0 L 0 25" fill="none" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fp15lo =
    '<svg viewBox="86.5 278.0 275.9 1.0" ><path transform="translate(86.5, 278.0)" d="M 0 0 L 275.9072265625 0" fill="none" stroke="#5e5e5e" stroke-width="2" stroke-dasharray="4 4" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
