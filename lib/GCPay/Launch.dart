import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class q1 extends StatelessWidget {
  q1({
    required Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4486d5),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0.0, -0.116),
            child: SizedBox(
              width: 231.0,
              height: 247.0,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 28.0, 0.0),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 135.0,
                            height: 247.0,
                            child: Transform.rotate(
                              angle: 3.1416,
                              child: Text(
                                'G',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 176,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w600,
                                  shadows: [
                                    Shadow(
                                      color: const Color(0x29000000),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    )
                                  ],
                                ),
                                softWrap: false,
                              ),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 137.0, end: -1.3),
                          Pin(size: 251.0, middle: 0.0936),
                          child: Text(
                            'C',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 179,
                              color: const Color(0xff00f5ff),
                              fontWeight: FontWeight.w600,
                              shadows: [
                                Shadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                )
                              ],
                            ),
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(1.0, -0.008),
                    child: SizedBox(
                      width: 93.0,
                      height: 33.0,
                      child: Text(
                        'GCPAY',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          color: const Color(0xffffffff),
                          letterSpacing: 1.944,
                          fontWeight: FontWeight.w700,
                          shadows: [
                            Shadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            )
                          ],
                        ),
                        softWrap: false,
                      ),
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
