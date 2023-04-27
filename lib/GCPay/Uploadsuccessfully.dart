import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Uploadsuccessfully extends StatelessWidget {
  Uploadsuccessfully({
    required Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: -16.0, end: -23.0),
            Pin(size: 43.0, middle: 0.3283),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff1d4f8b),
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.003, -0.337),
            child: SizedBox(
              width: 65.0,
              height: 24.0,
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                      child: SingleChildScrollView(
                    primary: false,
                    child: Text(
                      'Verified\n',
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 18,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: -124.0, end: -124.0),
            Pin(size: 787.0, start: -535.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff4486d5),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(startFraction: 0.0737, endFraction: 0.8917),
            Pin(startFraction: 0.0353, endFraction: 0.9371),
            child: SvgPicture.string(
              _svg_ehpyic,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: -10.0, end: -10.0),
            Pin(size: 77.0, middle: 0.3944),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffd4e3fc),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 80.0, start: 28.0),
            Pin(size: 18.0, middle: 0.4226),
            child: Text(
              'Upload ID',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 16,
                color: const Color(0xff1d4f8b),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.155),
            child: SizedBox(
              width: 120.0,
              height: 18.0,
              child: Text(
                'Face recognition ',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 16,
                  color: const Color(0xff1d4f8b),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 103.0, end: 27.0),
            Pin(size: 18.0, middle: 0.4226),
            child: Text(
              'Manual review',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 16,
                color: const Color(0xff1d4f8b),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 95.0, end: 94.3),
            Pin(size: 238.2, middle: 0.7098),
            child: SvgPicture.string(
              _svg_a8rquh,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment(0.004, -0.006),
            child: SizedBox(
              width: 181.0,
              height: 27.0,
              child: Text(
                'Face recognition ',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 23,
                  color: const Color(0xff1d4f8b),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 24.0, end: 23.0),
            Pin(size: 43.0, end: 68.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff1d4f8b),
                borderRadius: BorderRadius.circular(9.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 195.0, middle: 0.502),
            Pin(size: 21.0, end: 79.0),
            child: Text(
              'Turn on face recognition ',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 35.0, end: 33.0),
            Pin(size: 4.0, middle: 0.3868),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 8.0, end: 33.0),
            Pin(size: 8.0, middle: 0.3863),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff6c646),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.23),
            child: Container(
              width: 18.0,
              height: 18.0,
              decoration: BoxDecoration(
                color: const Color(0xfff6c646),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 185.0, start: 35.0),
            Pin(size: 4.0, middle: 0.3868),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff6c646),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 151.2, middle: 0.4987),
            Pin(size: 168.0, start: 39.0),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 13.9, 0.0),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(size: 91.0, start: 0.0),
                        Pin(start: 0.3, end: 0.7),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..rotateZ(3.1416)
                            ..scale(1.0, -1.0),
                          child: Text(
                            'G',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 119,
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
                      Pinned.fromPins(
                        Pin(size: 92.0, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: Text(
                          'C',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 120,
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
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 58.0,
                    height: 21.0,
                    child: Text(
                      'GCPAY',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: const Color(0xffffffff),
                        letterSpacing: 1.215,
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
          Padding(
            padding: EdgeInsets.fromLTRB(-14.0, -15.0, -15.0, -16.0),
            child: Stack(
              children: <Widget>[
                Container(
                  color: const Color(0xbf1f2022),
                ),
                Pinned.fromPins(
                  Pin(start: 46.0, end: 46.0),
                  Pin(size: 345.0, end: 114.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 173.0, middle: 0.5),
                        Pin(size: 22.0, start: 28.0),
                        child: Text(
                          'Upload successfully',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 18,
                            color: const Color(0xff1d4f8b),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 54.5, end: 54.6),
                        Pin(size: 1.0, start: 67.0),
                        child: SvgPicture.string(
                          _svg_lbsuhw,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 90.0, end: 90.0),
                        Pin(size: 16.0, middle: 0.5745),
                        child: Text(
                          'Manual review takes 3-10 minutes',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 13,
                            color: const Color(0xff1d4f8b),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 46.0, end: 46.0),
                        Pin(size: 50.0, end: 32.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff1d4f8b),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 54.0, middle: 0.5015),
                        Pin(size: 27.0, end: 43.0),
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
                      Pinned.fromPins(
                        Pin(start: 58.0, end: 58.0),
                        Pin(size: 31.0, middle: 0.7038),
                        child: Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: 13,
                              color: const Color(0xff1d4f8b),
                            ),
                            children: [
                              TextSpan(
                                text: 'The adults  can be viewed in\n“',
                              ),
                              TextSpan(
                                text:
                                    'Personal Center-Real Name Authentication',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: '”',
                              ),
                            ],
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.004, -0.311),
                        child: SizedBox(
                          width: 100.0,
                          height: 110.0,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                color: Colors.transparent,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 14.0),
                                child: Stack(
                                  children: <Widget>[
                                    Container(),
                                    Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: SizedBox.expand(
                                          child: SvgPicture.string(
                                        _svg_uz4c19,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.269, -0.122),
                        child: SizedBox(
                          width: 10.0,
                          height: 10.0,
                          child: Stack(
                            children: <Widget>[
                              Container(),
                              Padding(
                                padding: EdgeInsets.all(0.8),
                                child: SizedBox.expand(
                                    child: SvgPicture.string(
                                  _svg_j1klwj,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.082, 0.021),
                        child: SizedBox(
                          width: 8.0,
                          height: 8.0,
                          child: Stack(
                            children: <Widget>[
                              Container(),
                              Padding(
                                padding: EdgeInsets.all(0.6),
                                child: SizedBox.expand(
                                    child: SvgPicture.string(
                                  _svg_h9pdbh,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.099, 0.033),
                        child: SizedBox(
                          width: 10.0,
                          height: 10.0,
                          child: Stack(
                            children: <Widget>[
                              Container(),
                              Padding(
                                padding: EdgeInsets.all(0.8),
                                child: SizedBox.expand(
                                    child: SvgPicture.string(
                                  _svg_j1klwj,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.236, -0.092),
                        child: SizedBox(
                          width: 8.0,
                          height: 8.0,
                          child: Stack(
                            children: <Widget>[
                              Container(),
                              Padding(
                                padding: EdgeInsets.all(0.6),
                                child: SizedBox.expand(
                                    child: SvgPicture.string(
                                  _svg_h9pdbh,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.216, 0.051),
                        child: SizedBox(
                          width: 10.0,
                          height: 10.0,
                          child: Stack(
                            children: <Widget>[
                              Container(),
                              Padding(
                                padding: EdgeInsets.all(0.8),
                                child: SizedBox.expand(
                                    child: SvgPicture.string(
                                  _svg_j1klwj,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                )),
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
        ],
      ),
    );
  }
}

const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_a8rquh =
    '<svg viewBox="95.0 466.9 258.7 238.2" ><path transform="translate(95.0, 466.91)" d="M 215.59423828125 238.1772918701172 L 43.11496734619141 238.1772918701172 C 31.22805786132812 238.1772918701172 21.55748176574707 228.4648895263672 21.55748176574707 216.5265808105469 L 21.55748176574707 151.574462890625 L 43.11496734619141 151.574462890625 L 43.11496734619141 216.5265808105469 L 215.59423828125 216.5265808105469 L 215.59423828125 151.574462890625 L 237.1517333984375 151.574462890625 L 237.1517333984375 216.5265808105469 C 237.1517333984375 228.4648895263672 227.4811401367188 238.1772918701172 215.59423828125 238.1772918701172 Z M 258.7091979980469 129.9237365722656 L 258.6876220703125 129.9237365722656 L 0 129.9237365722656 L 0 108.2730407714844 L 258.7091979980469 108.2730407714844 L 258.7091979980469 129.9020843505859 L 258.7091979980469 129.9237365722656 Z M 43.11496734619141 86.62449645996094 L 43.09340667724609 86.62449645996094 L 21.55748176574707 86.60282897949219 L 21.55748176574707 21.65070724487305 C 21.55748176574707 9.712396621704102 31.22805786132812 -4.700763924300614e-16 43.11496734619141 -4.700763924300614e-16 L 215.59423828125 -4.700763924300614e-16 C 227.4811401367188 -4.700763924300614e-16 237.1517333984375 9.712396621704102 237.1517333984375 21.65070724487305 L 237.1517333984375 86.58116912841797 L 215.59423828125 86.60282897949219 L 215.59423828125 21.65070724487305 L 43.11496734619141 21.65070724487305 L 43.11496734619141 86.60282897949219 L 43.11496734619141 86.62449645996094 Z" fill="#000000" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_lbsuhw =
    '<svg viewBox="86.5 520.0 275.9 1.0" ><path transform="translate(86.5, 520.0)" d="M 0 0 L 275.9072265625 0" fill="none" stroke="#5e5e5e" stroke-width="2" stroke-dasharray="4 4" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_uz4c19 =
    '<svg viewBox="6.0 6.0 84.0 84.0" ><path transform="translate(6.0, 6.0)" d="M 41.99999618530273 84 C 18.84110069274902 84 0 65.15888977050781 0 41.99999618530273 C 0 18.84110069274902 18.84110069274902 0 41.99999618530273 0 C 65.15888977050781 0 84 18.84110069274902 84 41.99999618530273 C 84 65.15888977050781 65.15888977050781 84 41.99999618530273 84 Z M 25.23801612854004 39.00180053710938 L 25.23796844482422 39.00184631347656 L 20.99999809265137 43.23986434936523 L 35.99938201904297 58.24357223510742 L 63 31.24727439880371 L 58.75766754150391 27.00061416625977 L 35.99938201904297 49.75889205932617 L 25.23801612854004 39.00184631347656 L 25.23801612854004 39.00180053710938 Z" fill="#00a870" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_j1klwj =
    '<svg viewBox="0.8 0.9 8.5 8.1" ><path transform="translate(0.41, 0.48)" d="M 5.964834690093994 2.933066129684448 L 8.66932201385498 3.326051235198975 C 8.823113441467285 3.348398208618164 8.884521484375 3.537393093109131 8.773237228393555 3.645868539810181 L 6.816251277923584 5.553457736968994 L 7.278233528137207 8.247017860412598 C 7.304503917694092 8.400187492370605 7.143735885620117 8.516992568969727 7.006180286407471 8.444675445556641 L 4.587212562561035 7.172949314117432 L 2.168245315551758 8.444675445556641 C 2.03069019317627 8.516992568969727 1.869921684265137 8.400187492370605 1.896192312240601 8.247017860412598 L 2.358173847198486 5.553457736968994 L 0.4011883139610291 3.645868539810181 C 0.289903849363327 3.537393093109131 0.351311981678009 3.348398208618164 0.5051033496856689 3.326051235198975 L 3.209590911865234 2.933066129684448 L 4.419074535369873 0.4823843240737915 C 4.487852096557617 0.3430257439613342 4.686573028564453 0.3430257439613342 4.755351066589355 0.4823843240737915 L 5.964834690093994 2.933066129684448 Z" fill="#4486d5" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_h9pdbh =
    '<svg viewBox="0.6 0.7 6.8 6.5" ><path transform="translate(0.26, 0.31)" d="M 4.840739727020264 2.422025918960571 L 7.004329681396484 2.736413955688477 C 7.127362728118896 2.754291534423828 7.176489353179932 2.905487537384033 7.087461948394775 2.992267847061157 L 5.521872997283936 4.518339157104492 L 5.891458988189697 6.673187255859375 C 5.912475109100342 6.795722961425781 5.783860683441162 6.889167308807373 5.673816204071045 6.831313610076904 L 3.73864221572876 5.813932418823242 L 1.803468346595764 6.831313610076904 C 1.693424224853516 6.889167308807373 1.564809441566467 6.795722961425781 1.58582592010498 6.673187255859375 L 1.955411195755005 4.518339157104492 L 0.389822781085968 2.992267847061157 C 0.3007951974868774 2.905487537384033 0.349921703338623 2.754291534423828 0.4729548096656799 2.736413955688477 L 2.636544942855835 2.422025918960571 L 3.604131937026978 0.4614805579185486 C 3.659153938293457 0.3499936461448669 3.818130731582642 0.3499936461448669 3.873153209686279 0.4614805579185486 L 4.840739727020264 2.422025918960571 Z" fill="#4486d5" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
