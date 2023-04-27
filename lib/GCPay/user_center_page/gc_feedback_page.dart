import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({
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
                        alignment: Alignment.center,
                        child: ClipPath(
                          clipper:
                          CustomShape(), // this is my own class which extendsCustomClipper
                          child: Container(
                            width: 700,
                            height: 600,
                            color: Color(0xff2072d3),
                            child: Align(
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
                                    'feedback'.tr,
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
                            //box1
                            Pinned.fromPins(
                              Pin(size: 346.0, start: 17.0),
                              Pin(size: 50.0, start: 40.0),
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
                              Pin(start: 50.0, end: 20.0),
                              Pin(size: 60.0, start: 52.0),
                              child: TextFormField(
                                maxLines: 1,
                                maxLength: 100,
                                decoration: InputDecoration(
                                  helperText: '',
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: 'title'.tr,
                                  contentPadding: EdgeInsets.only(
                                      left: 0,
                                      right: -15,
                                      top: 13,
                                      bottom: 0),
                                  hintStyle: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 15,
                                      color: const Color(0xff5d5d5d),
                                      fontWeight: FontWeight.w500,
                                      height: 0.7),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 0, 4, 21),
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 15,
                                  color: const Color(0xff5d5d5d),
                                ),
                              ),
                            ),
                            //box2
                            Pinned.fromPins(
                              Pin(size: 346.0, start: 17.0),
                              Pin(size: 285.0, start: 120.0),
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
                              Pin(start: 50.0, end: 20.0),
                              Pin(size: 600.0, start: 125),
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 15,
                                maxLength: 500,
                                decoration: InputDecoration(
                                  helperText: ' ',
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: 'content'.tr,
                                  contentPadding: EdgeInsets.only(
                                      left: 0,
                                      right: -15,
                                      top: 13,
                                      bottom: 10),
                                  hintStyle: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 15,
                                      color: const Color(0xff707070),
                                      fontWeight: FontWeight.w500,
                                      height: 0.7),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 0, 4, 21),
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 15,
                                  color: const Color(0xff5d5d5d),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(start: 20.0, end: 20.0),
                              Pin(size: 43.0, start: 500.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff15056d),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 200.0, start: 90.0),
                              Pin(size: 21.0, start: 510.0),
                               child: Text(
                                  'confirmed'.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
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
