import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../widget/webview_page.dart';

class GameProcessBuyPage extends StatelessWidget {
  const GameProcessBuyPage({Key? key}) : super(key: key);

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
            Pin(size: 300.0, start: 20.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 42.0, start: 36.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0x7300a8a8),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6.0),
                        topRight: Radius.circular(6.0),
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 54.0, start: 23.0),
                  Pin(size: 17.0, middle: 0.1731),
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
                  alignment: Alignment(-0.033, -0.654),
                  child: SizedBox(
                    width: 24.0,
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
                  Pin(size: 46.0, end: 24.0),
                  Pin(size: 17.0, middle: 0.1731),
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
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 42.0, end: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: const Color(0xfe013428),
                      ),
                      Pinned.fromPins(
                        Pin(size: 124.0, start: 51.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: Text(
                          'Chinese currency'.tr,
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
                        alignment: Alignment(0.019, 0.04),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(WebViewPage(
                                strUrl: 'https://www.zb.com/',
                                strTitle: 'URL'.tr,
                                blNavigation: false));
                          },
                          child: const SizedBox(
                            width: 42.0,
                            height: 17.0,
                            child: Text(
                              'zb.com',
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
                                strUrl: 'https://www.zb.com/help/guides/1',
                                strTitle: 'URL'.tr,
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
                        Pin(size: 20.0, start: 23.0),
                        Pin(size: 21.0, middle: 0.5238),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/icon_gateio.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 42.0, middle: 0.8256),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: const Color(0xfe013428),
                      ),
                      Pinned.fromPins(
                        Pin(size: 34.0, start: 51.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: Text(
                          'Ouyi'.tr,
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
                        alignment: const Alignment(0.067, 0.04),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(WebViewPage(
                                strUrl: 'https://www.okx.com/',
                                strTitle: 'URL'.tr,
                                blNavigation: false));
                          },
                          child: const SizedBox(
                            width: 56.0,
                            height: 17.0,
                            child: Text(
                              'okex.com',
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
                                strUrl:
                                    'https://www.okx.com/support/hc/en-us/sections/360000033031-Getting-Started',
                                strTitle: '',
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
                        Pin(size: 20.0, start: 23.0),
                        Pin(size: 20.0, middle: 0.5455),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/icon_okex.png'),
                              fit: BoxFit.fill,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 42.0, middle: 0.6512),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: const Color(0xfe013428),
                      ),
                      Pinned.fromPins(
                        Pin(size: 64.0, start: 51.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: Text(
                          'Binance'.tr,
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
                        alignment: Alignment(0.135, 0.04),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(WebViewPage(
                                strUrl: 'https://www.binance.com/',
                                strTitle: 'URL'.tr,
                                blNavigation: false));
                          },
                          child: SizedBox(
                            width: 76.0,
                            height: 17.0,
                            child: Text(
                              'binance.com',
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
                          onTap: () {
                            Get.to(WebViewPage(
                                strUrl:
                                    'https://academy.binance.com/en/articles/binance-beginner-s-guide',
                                strTitle: '',
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
                        Pin(size: 20.0, start: 23.0),
                        Pin(size: 20.0, middle: 0.5455),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/icon_binance.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 42.0, middle: 0.4767),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: const Color(0xfe013428),
                      ),
                      Pinned.fromPins(
                        Pin(size: 44.0, start: 51.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: Text(
                          'Huobi'.tr,
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
                        alignment: Alignment(0.081, 0.04),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(WebViewPage(
                                strUrl: 'https://www.huobi.com/',
                                strTitle: 'URL'.tr,
                                blNavigation: false));
                          },
                          child: SizedBox(
                            width: 62.0,
                            height: 17.0,
                            child: Text(
                              'huobi.com',
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
                          onTap: () {
                            Get.to(WebViewPage(
                                strUrl:
                                    'https://www.huobi.com/support/en-us/list/360000010372',
                                strTitle: 'URL'.tr,
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
                        Pin(size: 20.0, start: 23.0),
                        Pin(size: 20.0, middle: 0.5455),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/icon_huobi.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 42.0, middle: 0.3023),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: const Color(0xfe013428),
                      ),
                      Pinned.fromPins(
                        Pin(size: 88.0, start: 51.0),
                        Pin(size: 17.0, middle: 0.52),
                        child: Text(
                          'Open Sesame'.tr,
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
                        alignment: Alignment(0.013, 0.04),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(WebViewPage(
                                strUrl: 'https://bitpie.com/',
                                strTitle: 'URL'.tr,
                                blNavigation: false));
                          },
                          child: const SizedBox(
                            width: 42.0,
                            height: 17.0,
                            child: Text(
                              'gate.io',
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
                                strUrl: 'https://www.gate.io/zh/help/guide',
                                strTitle: '',
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
                        Pin(size: 20.0, start: 23.0),
                        Pin(size: 20.0, middle: 0.5455),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/icon_gateio.png'),
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
                  Pin(size: 17.0, start: 5.0),
                  child: Text(
                    'Digital currency purchase trading platform'.tr,
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

class GameProcessBuyPageBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => TopicController());
  }
}
