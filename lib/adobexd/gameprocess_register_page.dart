import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../widget/webview_page.dart';

class GameProcessRegisterPage extends StatelessWidget {
  const GameProcessRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.secondaryContainer,
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 315.0, start: 50.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 42.0, start: 5.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0x7300a8a8),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6.0),
                            topRight: Radius.circular(6.0),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 54.0, start: 23.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: Text(
                          'Platform'.tr,
                          style: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 12,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w600,
                          ),
                          softWrap: false,
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.033, 0.04),
                        child: SizedBox(
                          width: 34.0,
                          height: 17.0,
                          child: Text(
                            'URL'.tr,
                            style: TextStyle(
                              fontFamily: 'PingFang SC',
                              fontSize: 12,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 54.0, end: 18.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: Text(
                          'Tutorial'.tr,
                          style: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 12,
                            color: const Color(0xffffffff),
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
                  Pin(size: 42.0, middle: 0.16),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: const Color(0xfe013428),
                      ),
                      Pinned.fromPins(
                        Pin(size: 66.0, start: 51.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: const Text(
                          'coinpocket',
                          style: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 12,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w600,
                          ),
                          softWrap: false,
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0.15, 0.04),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(WebViewPage(
                                strUrl: 'https://coinpocket.io',
                                strTitle: 'URL'.tr,
                                blNavigation: false));
                          },
                          child: const SizedBox(
                            width: 80.0,
                            height: 17.0,
                            child: Text(
                              'coinpocket.io',
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 48.0, end: 24.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(WebViewPage(
                                strUrl: 'https://help.coinpocket.io',
                                strTitle: 'Tutorial'.tr,
                                blNavigation: false));
                          },
                          child: Text(
                            'View Tutorial'.tr,
                            style: TextStyle(
                              fontFamily: 'PingFang SC',
                              fontSize: 12,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 30.0, start: 17.0),
                        Pin(size: 30.0, end: 5.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/icon_cp.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              margin: EdgeInsets.fromLTRB(6.0, 5.0, 5.0, 6.0),
                            ),
                            Container(
                              color: Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 42.0, middle: 0.32),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: const Color(0xfe013428),
                      ),
                      Pinned.fromPins(
                        Pin(size: 36.0, start: 51.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: const Text(
                          'token',
                          style: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 12,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w600,
                          ),
                          softWrap: false,
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0.046, 0.04),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(WebViewPage(
                                strUrl: 'https://token.im/download',
                                strTitle: 'URL'.tr,
                                blNavigation: false));
                          },
                          child: const SizedBox(
                            width: 52.0,
                            height: 17.0,
                            child: Text(
                              'token.im',
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 48.0, end: 21.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(WebViewPage(
                                strUrl: 'https://support.token.im/',
                                strTitle: 'Tutorial'.tr,
                                blNavigation: false));
                          },
                          child: Text(
                            'View Tutorial'.tr,
                            style: TextStyle(
                              fontFamily: 'PingFang SC',
                              fontSize: 12,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 30.0, start: 17.0),
                        Pin(size: 30.0, end: 5.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/icon_imtoken.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              margin: EdgeInsets.fromLTRB(6.0, 5.0, 5.0, 6.0),
                            ),
                            Container(
                              color: Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 42.0, middle: 0.4819),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: const Color(0xfe013428),
                      ),
                      Pinned.fromPins(
                        Pin(size: 40.0, start: 51.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: Text(
                          'ownbit',
                          style: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 12,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w600,
                          ),
                          softWrap: false,
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.056, 0.04),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(WebViewPage(
                                strUrl: 'https://ownbit.io/download/',
                                strTitle: 'URL'.tr,
                                blNavigation: false));
                          },
                          child: SizedBox(
                            width: 58.0,
                            height: 17.0,
                            child: Text(
                              'ownbit.io',
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 48.0, end: 21.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(WebViewPage(
                                strUrl: 'https://ownbit.io/h5/app/help/v3_0/faq.html',
                                strTitle: 'Tutorial'.tr,
                                blNavigation: false));
                          },
                          child: Text(
                            'View Tutorial'.tr,
                            style: TextStyle(
                              fontFamily: 'PingFang SC',
                              fontSize: 12,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 30.0, start: 17.0),
                        Pin(start: 6.0, end: 6.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/icon_ownbit.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              margin: EdgeInsets.fromLTRB(6.0, 5.0, 5.0, 5.0),
                            ),
                            Container(
                              color: Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 42.0, middle: 0.6446),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: const Color(0xfe013428),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.0, start: 51.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: Text(
                          'trustwallet',
                          style: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 12,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w600,
                          ),
                          softWrap: false,
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.199, 0.04),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(WebViewPage(
                                strUrl: 'https://trustwallet.com/',
                                strTitle: 'URL'.tr,
                                blNavigation: false));
                          },
                          child: SizedBox(
                            width: 95.0,
                            height: 17.0,
                            child: Text(
                              'trustwallet.com',
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 48.0, end: 21.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(WebViewPage(
                                strUrl: 'https://community.trustwallet.com/c/faq/21',
                                strTitle: 'Tutorial'.tr,
                                blNavigation: false));
                          },
                          child: Text(
                            'View Tutorial'.tr,
                            style: TextStyle(
                              fontFamily: 'PingFang SC',
                              fontSize: 12,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 30.0, start: 17.0),
                        Pin(size: 30.0, end: 5.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/icon_trustwallet.png'),
                                  fit: BoxFit.fill,
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
                  Pin(size: 42.0, middle: 0.8073),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: const Color(0xfe013428),
                      ),
                      Pinned.fromPins(
                        Pin(size: 46.0, start: 51.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: Text(
                          'tronlink',
                          style: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 12,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w600,
                          ),
                          softWrap: false,
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.103, 0.04),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(WebViewPage(
                                strUrl: 'https://www.tronlink.org/',
                                strTitle: 'URL'.tr,
                                blNavigation: false));
                          },
                          child: SizedBox(
                            width: 72.0,
                            height: 17.0,
                            child: Text(
                              'tronlink.org',
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 48.0, end: 21.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(WebViewPage(
                                strUrl: 'https://tronlinkorg.zendesk.com',
                                strTitle: 'Tutorial'.tr,
                                blNavigation: false));
                          },
                          child: Text(
                            'View Tutorial'.tr,
                            style: TextStyle(
                              fontFamily: 'PingFang SC',
                              fontSize: 12,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 30.0, start: 17.0),
                        Pin(size: 30.0, end: 4.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/icon_tronlink.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              margin: EdgeInsets.fromLTRB(6.0, 5.0, 5.0, 6.0),
                            ),
                            Container(
                              color: Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 42.0, middle: 0.97),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: const Color(0xfe013428),
                      ),
                      Pinned.fromPins(
                        Pin(size: 38.0, start: 51.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: Text(
                          'Bitpie'.tr,
                          style: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 12,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w600,
                          ),
                          softWrap: false,
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.085, 0.04),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(WebViewPage(
                                strUrl: 'https://bitpie.com/',
                                strTitle: 'URL'.tr,
                                blNavigation: false));
                          },
                          child: SizedBox(
                            width: 62.0,
                            height: 17.0,
                            child: Text(
                              'bitpie.com',
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 48.0, end: 21.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(WebViewPage(
                                strUrl: 'https://zendesk.bitpiehk.com/',
                                strTitle: 'Tutorial'.tr,
                                blNavigation: false));
                          },
                          child: Text(
                            'View Tutorial'.tr,
                            style: TextStyle(
                              fontFamily: 'PingFang SC',
                              fontSize: 12,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 30.0, start: 17.0),
                        Pin(size: 30.0, end: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/icon_bitpie.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 340.0, start: 14.0),
                  Pin(size: 17.0, start: -30.0),
                  child: Text(
                    'Digital currency'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'PingFang SC',
                      fontSize: 12,
                      color: const Color(0xff707070),
                      fontWeight: FontWeight.w600,
                    ),
                    softWrap: false,
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

class GameProcessRegisterPageBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => TopicController());
  }
}
