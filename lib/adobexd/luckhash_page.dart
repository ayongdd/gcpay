import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class luckhash_page extends StatelessWidget {
  luckhash_page({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 278.0, end: 6.0),
            Pin(size: 937.0, end: 98.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff1e3c8d),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 258.0, end: 16.0),
            Pin(size: 75.0, middle: 0.2324),
            child: SingleChildScrollView(
              primary: false,
              child: SizedBox(
                width: 258.0,
                height: 900.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 155.0, end: -396.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 24.0, start: 3.0),
                            Pin(size: 17.0, start: 0.0),
                            child: Text(
                              'Odds'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xff5fd4ff),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfe21325f),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            margin: EdgeInsets.fromLTRB(0.0, 27.0, 0.0, 0.0),
                          ),
                          Pinned.fromPins(
                            Pin(start: 16.0, end: 15.0),
                            Pin(size: 99.0, end: 16.0),
                            child: Text(
                              'bettingInstruction'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xffc0cce0),
                                height: 1.6666666666666667,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 155.0, end: -563.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 48.0, start: 3.0),
                            Pin(size: 17.0, start: 0.0),
                            child: Text(
                              'Video Tutorial'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xff5fd4ff),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 0.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: const AssetImage(''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xcc0e162e),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 26.0,
                                    height: 26.0,
                                    child: SvgPicture.string(
                                      _svg_je5vsb,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ),
                                Pinned.fromPins(
                                  Pin(size: 23.0, end: 19.0),
                                  Pin(size: 11.0, end: 13.0),
                                  child: Text(
                                    '5:20”',
                                    style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 10,
                                      color: const Color(0xffd9e3f5),
                                    ),
                                    softWrap: false,
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
                      Pin(size: 252.0, end: -825.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 24.0, start: 3.0),
                            Pin(size: 17.0, start: 0.0),
                            child: Text(
                              'example'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xff5fd4ff),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfe21325f),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            margin: EdgeInsets.fromLTRB(0.0, 27.0, 0.0, 0.0),
                          ),
                          Pinned.fromPins(
                            Pin(start: 16.0, end: 15.0),
                            Pin(size: 74.0, middle: 0.3708),
                            child: Text(
                              'caseA'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xffc0cce0),
                                height: 1.6666666666666667,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 16.0, end: 15.0),
                            Pin(size: 74.0, end: 9.0),
                            child: Text(
                              'caseB'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xffc0cce0),
                                height: 1.6666666666666667,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 41.0, start: 15.0),
                            Pin(size: 17.0, middle: 0.166),
                            child: Text(
                              'Case A',
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xffd9e3f5),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 41.0, start: 15.0),
                            Pin(size: 17.0, middle: 0.6043),
                            child: Text(
                              'Case B',
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xffd9e3f5),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 69.0, end: -225.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 24.0, start: 3.0),
                            Pin(size: 17.0, start: 0.0),
                            child: Text(
                              'winning the lottery'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xff5fd4ff),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 42.0, end: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xfe21325f),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 125.0, start: 17.0),
                            Pin(size: 17.0, middle: 0.7692),
                            child: Text(
                              'Number + Letter / Letter + Number'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xffd9e3f5),
                              ),
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 129.0, end: -146.0),
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 27.0, 0.0, 0.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: const AssetImage(''),
                                      fit: BoxFit.cover,
                                      colorFilter: new ColorFilter.mode(
                                          Colors.black.withOpacity(1.0),
                                          BlendMode.dstIn),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xb1000000),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 48.0, start: 3.0),
                            Pin(size: 17.0, start: 0.0),
                            child: Text(
                              'Lottery Result'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xff5fd4ff),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 16.0, end: 16.0),
                            Pin(size: 24.0, middle: 0.3905),
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontFamily: 'inpin nanzhengbeizhanNZBZti',
                                  fontSize: 17,
                                  color: const Color(0xff5fd4ff),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'transfer block hash value final'.tr,
                                  ),
                                  TextSpan(
                                    text: 'two-digit mantissa'.tr,
                                    style: TextStyle(
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 96.0, start: 16.0),
                            Pin(size: 17.0, middle: 0.6339),
                            child: Text(
                              'gameLotteryResults'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xff5fd4ff),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 98.0, start: 16.0),
                            Pin(size: 17.0, end: 18.0),
                            child: Text(
                              'Such as: 000b9……4c1'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 14.0, middle: 0.4959),
                            Pin(size: 17.0, end: 18.0),
                            child: Text(
                              'a6',
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xffffe2e2),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 23.0, middle: 0.4979),
                            Pin(size: 21.0, end: 15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xffffa0a0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, -8.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 48.0, start: 3.0),
                            Pin(size: 17.0, start: 0.0),
                            child: Text(
                              'BettingAddress'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xff5fd4ff),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 123.0, start: 3.0),
                            Pin(size: 14.0, middle: 0.2754),
                            child: Text(
                              'DecentralizedWallet'.tr,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 10,
                                color: const Color(0xffffffff),
                              ),
                              softWrap: false,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 42.0, end: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xfe425588),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 153.0, start: 13.0),
                            Pin(size: 13.0, middle: 0.8),
                            child: Text(
                              'TLneRBe5xNr79JuuVKd9j4nEKsxt9..',
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 9,
                                color: const Color(0xffffffff),
                              ),
                              softWrap: false,
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.644, 1.0),
                            child: Container(
                              width: 39.0,
                              height: 42.0,
                              color: const Color(0xff717ede),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 39.0,
                              height: 42.0,
                              decoration: BoxDecoration(
                                color: const Color(0xff9769cc),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 16.7, end: 10.5),
                            Pin(size: 18.0, end: 12.0),
                            child: Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(size: 14.1, start: 0.0),
                                  Pin(start: 2.6, end: 0.0),
                                  child: SvgPicture.string(
                                    _svg_tijmcy,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    width: 13.0,
                                    height: 14.0,
                                    child: SvgPicture.string(
                                      _svg_d2tqrj,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(-0.286, 0.153),
                                  child: SizedBox(
                                    width: 8.0,
                                    height: 8.0,
                                    child: SvgPicture.string(
                                      _svg_ljitw8,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.586, 0.613),
                            child: SizedBox(
                              width: 16.0,
                              height: 16.0,
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: SizedBox(
                                      width: 13.0,
                                      height: 13.0,
                                      child: SvgPicture.string(
                                        _svg_fdhd3,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.0, 0.0, 2.9, 0.0),
                                    child: SizedBox.expand(
                                        child: SvgPicture.string(
                                      _svg_r2pwvf,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: SizedBox(
                                      width: 13.0,
                                      height: 13.0,
                                      child: SvgPicture.string(
                                        _svg_a0iu3,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: SizedBox(
                                      width: 7.0,
                                      height: 7.0,
                                      child: SvgPicture.string(
                                        _svg_yuh5dm,
                                        allowDrawingOutsideViewBox: true,
                                      ),
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

const String _svg_je5vsb =
    '<svg viewBox="217.2 838.7 25.7 25.7" ><path transform="translate(46.5, 668.0)" d="M 183.5042419433594 196.3418273925781 C 176.4435729980469 196.3418273925781 170.6666564941406 190.5649108886719 170.6666564941406 183.5042266845703 C 170.6666564941406 176.4435424804688 176.4435729980469 170.6666259765625 183.5042419433594 170.6666259765625 C 190.56494140625 170.6666259765625 196.3418579101562 176.4435424804688 196.3418579101562 183.5042266845703 C 196.3418579101562 190.5649108886719 190.56494140625 196.3418273925781 183.5042419433594 196.3418273925781 Z M 183.5042419433594 193.1324157714844 C 188.7997436523438 193.1324157714844 193.1324462890625 188.7997283935547 193.1324462890625 183.5042266845703 C 193.1324462890625 178.2087097167969 188.7997436523438 173.8760223388672 183.5042419433594 173.8760223388672 C 178.208740234375 173.8760223388672 173.8760681152344 178.2087097167969 173.8760681152344 183.5042266845703 C 173.8760681152344 188.7997283935547 178.208740234375 193.1324157714844 183.5042419433594 193.1324157714844 Z M 188.318359375 183.5042266845703 L 180.2948608398438 188.3183135986328 L 180.2948608398438 178.6901245117188 L 188.318359375 183.5042266845703 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tijmcy =
    '<svg viewBox="0.0 2.6 14.1 15.4" ><path transform="translate(-96.0, -189.43)" d="M 108.5191116333008 192 L 97.60501861572266 192 C 96.71903991699219 192.0010681152344 96.00107574462891 192.7190246582031 96 193.6050109863281 L 96 205.8031463623047 C 96 206.6884765625 96.7203369140625 207.4081573486328 97.60501861572266 207.4081573486328 L 108.5191116333008 207.4081573486328 C 109.404426574707 207.4081573486328 110.1241226196289 206.6884765625 110.1241226196289 205.8031463623047 L 110.1241226196289 193.6050109863281 C 110.1241226196289 192.7203521728516 109.404426574707 192 108.5191116333008 192 Z M 108.8401031494141 205.8031463623047 C 108.8401031494141 205.9797058105469 108.6956481933594 206.1241607666016 108.5191116333008 206.1241607666016 L 97.60501861572266 206.1241607666016 C 97.427734375 206.1241607666016 97.28401947021484 205.9804229736328 97.28401947021484 205.8031463623047 L 97.28401947021484 193.6050109863281 C 97.28401947021484 193.427734375 97.427734375 193.2840270996094 97.60501861572266 193.2840270996094 L 108.5191116333008 193.2840270996094 C 108.6963958740234 193.2840270996094 108.8401031494141 193.427734375 108.8401031494141 193.6050109863281 L 108.8401031494141 205.8031463623047 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d2tqrj =
    '<svg viewBox="3.5 0.0 13.2 14.4" ><path transform="translate(-268.47, -64.0)" d="M 283.5560913085938 64 L 272.6419982910156 64 C 272.2874145507812 64 272 64.28744506835938 272 64.64201354980469 C 272 64.99657440185547 272.2874145507812 65.28401947021484 272.6419982910156 65.28401947021484 L 283.5560913085938 65.28401947021484 C 283.7333679199219 65.28401947021484 283.8770751953125 65.427734375 283.8770751953125 65.60501861572266 L 283.8770751953125 77.80313110351562 C 283.8770751953125 78.15770721435547 284.1645202636719 78.44514465332031 284.5190734863281 78.44514465332031 C 284.8736572265625 78.44514465332031 285.1611022949219 78.15770721435547 285.1611022949219 77.80313110351562 L 285.1611022949219 65.60501861572266 C 285.1611022949219 64.7203369140625 284.44140625 64 283.5560913085938 64 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ljitw8 =
    '<svg viewBox="3.2 5.9 7.7 7.7" ><path transform="translate(-252.79, -354.06)" d="M 263.0620727539062 360 L 256.6420288085938 360 C 256.2874145507812 360 256 360.2874145507812 256 360.6419982910156 C 256 360.9965515136719 256.2874145507812 361.2839965820312 256.6420288085938 361.2839965820312 L 263.0620727539062 361.2839965820312 C 263.4166259765625 361.2839965820312 263.7040405273438 360.9965515136719 263.7040405273438 360.6419982910156 C 263.7040405273438 360.2874145507812 263.4166259765625 360 263.0620727539062 360 Z M 263.0620727539062 363.2100524902344 L 256.6420288085938 363.2100524902344 C 256.2874145507812 363.2100524902344 256 363.4974670410156 256 363.85205078125 C 256 364.2066040039062 256.2874145507812 364.4940490722656 256.6420288085938 364.4940490722656 L 263.0620727539062 364.4940490722656 C 263.4166259765625 364.4940490722656 263.7040405273438 364.2066040039062 263.7040405273438 363.85205078125 C 263.7040405273438 363.4974670410156 263.4166259765625 363.2100524902344 263.0620727539062 363.2100524902344 Z M 260.4940185546875 366.39306640625 L 256.6420288085938 366.39306640625 C 256.2874145507812 366.39306640625 256 366.6805114746094 256 367.0350952148438 C 256 367.3896789550781 256.2874145507812 367.6771240234375 256.6420288085938 367.6771240234375 L 260.4940185546875 367.6771240234375 C 260.8486328125 367.6771240234375 261.1360473632812 367.3896789550781 261.1360473632812 367.0350952148438 C 261.1360473632812 366.6805114746094 260.8486328125 366.39306640625 260.4940185546875 366.39306640625 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fdhd3 =
    '<svg viewBox="2.9 2.9 13.2 13.2" ><path transform="translate(-253.07, -253.07)" d="M 256 256 L 257.4674377441406 256 L 257.4674377441406 257.4674987792969 L 256 257.4674987792969 L 256 256 Z M 267.7395324707031 267.7395629882812 L 269.2070007324219 267.7395629882812 L 269.2070007324219 269.20703125 L 267.7395324707031 269.20703125 L 267.7395324707031 267.7395629882812 Z M 267.7395324707031 264.8046569824219 L 266.2720947265625 264.8046569824219 L 266.2720947265625 261.8697814941406 L 261.8697509765625 261.8697814941406 L 261.8697509765625 269.20703125 L 263.3372192382812 269.20703125 L 263.3372192382812 263.3372497558594 L 264.8046569824219 263.3372497558594 L 264.8046569824219 266.2721557617188 L 269.2070007324219 266.2721557617188 L 269.2070007324219 261.8697814941406 L 267.7395324707031 261.8697814941406 L 267.7395324707031 264.8046569824219 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_r2pwvf =
    '<svg viewBox="0.0 0.0 13.2 16.1" ><path transform="translate(-109.71, -109.71)" d="M 121.4535369873047 124.3884429931641 L 122.9209747314453 124.3884429931641 L 122.9209747314453 125.8558959960938 L 121.4535369873047 125.8558959960938 L 121.4535369873047 124.3884429931641 Z M 109.7140045166016 117.0512237548828 L 117.0512390136719 117.0512237548828 L 117.0512390136719 109.7140045166016 L 109.7140045166016 109.7140045166016 L 109.7140045166016 117.0512542724609 Z M 111.1814498901367 111.1814422607422 L 115.5837783813477 111.1814422607422 L 115.5837783813477 115.5838012695312 L 111.1814498901367 115.5838012695312 L 111.1814498901367 111.1814422607422 Z M 112.6488952636719 121.4535369873047 L 114.116340637207 121.4535369873047 L 114.116340637207 122.9209899902344 L 112.6488952636719 122.9209899902344 L 112.6488952636719 121.4535369873047 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_a0iu3 =
    '<svg viewBox="0.0 2.9 13.2 13.2" ><path transform="translate(-109.71, -253.07)" d="M 109.7140045166016 269.20703125 L 117.0512390136719 269.20703125 L 117.0512390136719 261.8697814941406 L 109.7140045166016 261.8697814941406 L 109.7140045166016 269.2069702148438 Z M 111.1814498901367 263.3372497558594 L 115.5837783813477 263.3372497558594 L 115.5837783813477 267.7395629882812 L 111.1814498901367 267.7395629882812 L 111.1814498901367 263.3372497558594 Z M 121.4535369873047 256 L 122.9209747314453 256 L 122.9209747314453 257.4674987792969 L 121.4535369873047 257.4674987792969 L 121.4535369873047 256 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yuh5dm =
    '<svg viewBox="8.8 0.0 7.3 7.3" ><path transform="translate(-539.77, -109.71)" d="M 548.570068359375 109.7140045166016 L 548.570068359375 117.0512542724609 L 555.9072265625 117.0512542724609 L 555.9072265625 109.7140045166016 L 548.5700073242188 109.7140045166016 Z M 554.4398193359375 115.5838012695312 L 550.0374755859375 115.5838012695312 L 550.0374755859375 111.1814422607422 L 554.4398193359375 111.1814422607422 L 554.4398193359375 115.5838012695312 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
