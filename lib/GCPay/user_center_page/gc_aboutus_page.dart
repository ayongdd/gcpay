import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final backgroundColor = themeData.colorScheme.surfaceVariant;
    final foregroundColor = themeData.colorScheme.surface;
    final primaryTextTheme = themeData.textTheme;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    //statusBar height
    statusBarHeight +
        //pinned SliverAppBar height in header
        kToolbarHeight;
    return Scaffold(
      body: ExtendedNestedScrollView(
        onlyOneScrollInBody: false,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 170,
              pinned: false,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: SizedBox(
                  child: Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment(0.0, -1.0),
                          child: Container(
                            width: double.infinity,
                            height: 185,
                            child: Image.asset(
                              'assets/images/topBG.png',
                              fit: BoxFit.fill,
                            ),
                          )),
                      Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 110,
                                width: 110,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: const AssetImage(
                                        'assets/images/gcpay.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(
                width: 284.0,
                height: 800.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: 200.0, start: 0.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 43.0, end: 500.0),
                            child: Container(
                              height: 45,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Color(0xff15056d),
                              ),
                              child: Align(
                                alignment: Alignment(0.02, 0.170),
                                child: SizedBox(
                                  width: 200.0,
                                  height: 28.0,
                                  child: Text(
                                    'aboutus'.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 18,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 380.0, middle: 0.5),
                      Pin(start: 44.0, end: 10.0),
                      child: SizedBox(
                        width: 380.0,
                        height: 700.0,
                        child: Stack(
                          children: <Widget>[
                            /*Bubbles*/
                            Pinned.fromPins(
                              Pin(start: -120.0, end: 16.0),
                              Pin(size: 506.0, end: -100.0),
                              child: Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                    Pin(size: 435.0, start: 0.0),
                                    Pin(start: 71.0, end: 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0x0c4486d5),
                                        borderRadius:
                                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 279.0,
                                      height: 279.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0x0c4486d5),
                                        borderRadius:
                                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(start: 15.0, end: 15.0),
                              Pin(size: 40.0, start: 20.0),
                              child: Text(
                                'gcpayaboutus'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 14,
                                  color: const Color(0xff1d4f8b),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(start: 15.0, end: 15.0),
                              Pin(size: 550.0, start: 70.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffd3e0f0),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      width: 1.0, color: const Color(0xffd4d4d4)),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 200.0, start: 90.0),
                              Pin(size: 20.0, start: 90.0),
                              child: Text(
                                'ourmission'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 16,
                                  color: const Color(0xff1d4f8b),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 300.0, start: 40.0),
                              Pin(size: 120.0, start: 120.0),
                              child: Text(
                                'ourmission1'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 13,
                                  color: const Color(0xff1d4f8b),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 200.0, start: 80.0),
                              Pin(size: 30.0, start: 250.0),
                              child: Text(
                                'ourvision'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 17,
                                  color: const Color(0xff1d4f8b),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 300.0, start: 35.0),
                              Pin(size: 70.0, start: 280.0),
                              child: Text(
                                'ourvision1'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 13,
                                  color: const Color(0xff1d4f8b),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 320.0, start: 30.0),
                              Pin(size: 130.0, start: 350.0),
                              child: Text(
                                'ourvision2'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 13,
                                  color: const Color(0xff1d4f8b),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 320.0, start: 30.0),
                              Pin(size: 100.0, start: 480),
                              child: Text(
                                'ourvision3'.tr,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 13,
                                  color: const Color(0xff1d4f8b),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
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
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width - 0, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

const String _svg_ehpyic =
    '<svg viewBox="33.0 31.6 15.5 24.8" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 48.51, 31.6)" d="M 2.555429220199585 0 L 12.39747714996338 10.18674468994141 L 22.23952484130859 0 L 24.79495429992676 2.644927740097046 L 12.39747714996338 15.47660064697266 L 0 2.644927740097046 L 2.555429220199585 0 Z" fill="#ffffff" fill-opacity="0.9" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
