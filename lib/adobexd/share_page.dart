import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:GCPay/services/cache_service.dart';

import '../routes/app_routes.dart';
import '../services/lang/localization_service.dart';
import '../widget/webview_page.dart';

class SharePage extends StatelessWidget {
  SharePage({
    Key? key,
  }) : super(key: key);
  CacheService cacheservice = Get.find<CacheService>();
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () async {
            // onBackPressed();
            var canPop = navigator?.canPop();
            if (canPop != null && canPop) {
              Get.back();
            } else {
              SystemNavigator.pop();
            }
          },
        ),
        title: Text(
          'share'.tr,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 165.0, start: 10.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.336, -0.556),
                  child: SizedBox(
                    width: 145.0,
                    height: 80.0,
                    child: Text(
                      'Invite friends to receive prizes'.tr,
                      style: TextStyle(
                        fontFamily: 'inpin nanzhengbeizhanNZBZti',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 38.0, end: 37.0),
                  Pin(size: 85.0, middle: 0.9115),
                  child: Text(
                    'Invite a friend to bet'.tr,
                    style: TextStyle(
                      fontFamily: 'PingFang SC',
                      fontSize: 10.7,
                      color: const Color(0xffffffff),
                      height: 1.4333333333333333,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 78.0, end: 20.0),
                  Pin(size: 27.0, middle: 0.2029),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      InkWell(
                        child: Center(
                          child: SizedBox(
                            width: 64.0,
                            height: 17.0,
                            child: Text(
                              'Application'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'PingFang SC',
                                fontSize: 12,
                                color: const Color(0xff000000),
                              ),
                              softWrap: false,
                            ),
                          ),
                        ),
                        onTap: () {
                          CacheService cacheservice = Get.find<CacheService>();
                          String? getLocal = cacheservice.loadLanguage();
                          String strCSUrl = '';
                          if(getLocal == '1')
                          {
                            strCSUrl = "https://chatlink.mstatik.com/widget/standalone.html?eid=b6de0b8c409c539be3cfa3a9908f1d6c";
                          }
                          else
                          {
                            strCSUrl = "https://chatlink.mstatik.com/widget/standalone.html?eid=0d2b2137e3c92d6d9205c2e0a2feb9ff&language=en";
                          }
                          Get.to(WebViewPage(
                            strUrl:strCSUrl,
                            strTitle: 'customerService'.tr,
                            blNavigation: false,
                          ));
                        },
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 33.3, start: 28.0),
                  Pin(size: 25.8, middle: 0.2311),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          width: 27.0,
                          height: 19.0,
                          child: SvgPicture.string(
                            _svg_n43g,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ),
                      SizedBox.expand(
                          child: SvgPicture.string(
                        _svg_sbcuro,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 252.0, middle: 0.3861),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 31.0, end: 38.0),
                  Pin(size: 50.0, start: 10.0),
                  child: Text(
                    'Invite friends and enjoy permanent rebates'.tr,
                    style: TextStyle(
                      fontFamily: 'inpin nanzhengbeizhanNZBZti',
                      fontSize: 17,
                      color: const Color(0xffffffff),
                      height: 1.1333333333333333,
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 122.0, start: 31.0),
                  Pin(size: 17.0, middle: 0.2298),
                  child: Text(
                    'my promotion link'.tr,
                    style: TextStyle(
                      fontFamily: 'PingFang SC',
                      fontSize: 12,
                      color: const Color(0xffffffff),
                      height: 1.5333333333333333,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 58.0, start: 31.0),
                  Pin(size: 17.0, middle: 0.5234),
                  child: Text(
                    'share to:'.tr,
                    style: TextStyle(
                      fontFamily: 'PingFang SC',
                      fontSize: 12,
                      color: const Color(0xffffffff),
                      height: 1.8333333333333333,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 28.0, end: 27.0),
                  Pin(size: 27.0, middle: 0.3733),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff4f4f4),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 10.0, end: 39.0),
                        Pin(size: 17.0, middle: 0.5),
                        child: Text(
                          cacheservice.loadUserId().toString(),
                          style: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 12,
                            color: const Color(0xff707070),
                          ),
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 50.0, start: 33.0),
                  Pin(size: 14.0, middle: 0.8403),
                  child: Text(
                    'copy Link'.tr,
                    style: TextStyle(
                      fontFamily: 'PingFang SC',
                      fontSize: 10,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(-0.399, 0.681),
                  child: SizedBox(
                    width: 50.0,
                    height: 14.0,
                    child: Text(
                      'Wechat'.tr,
                      style: TextStyle(
                        fontFamily: 'PingFang SC',
                        fontSize: 10,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.009, 0.681),
                  child: SizedBox(
                    width: 80.0,
                    height: 14.0,
                    child: Text(
                      'Circle of friends'.tr,
                      style: TextStyle(
                        fontFamily: 'PingFang SC',
                        fontSize: 10,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.381, 0.681),
                  child: SizedBox(
                    width: 16.0,
                    height: 14.0,
                    child: Text(
                      'QQ',
                      style: TextStyle(
                        fontFamily: 'PingFang SC',
                        fontSize: 10,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 20.0, end: 40.0),
                  Pin(size: 14.0, middle: 0.8403),
                  child: Text(
                    'Weibo'.tr,
                    style: TextStyle(
                      fontFamily: 'PingFang SC',
                      fontSize: 10,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(-0.395, 0.423),
                  child: SizedBox(
                    width: 44.0,
                    height: 44.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.053, -0.009),
                          child: SizedBox(
                            width: 25.0,
                            height: 20.0,
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: SizedBox(
                                    width: 18.0,
                                    height: 16.0,
                                    child: SvgPicture.string(
                                      _svg_brqsjs,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SizedBox(
                                    width: 15.0,
                                    height: 14.0,
                                    child: SvgPicture.string(
                                      _svg_ntawp,
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
                ),
                Pinned.fromPins(
                  Pin(size: 44.0, start: 31.0),
                  Pin(size: 44.0, middle: 0.7115),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.044, 0.114),
                        child: SizedBox(
                          width: 19.0,
                          height: 19.0,
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: SizedBox(
                                  width: 13.0,
                                  height: 12.0,
                                  child: SvgPicture.string(
                                    _svg_e0zaez,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  width: 13.0,
                                  height: 12.0,
                                  child: SvgPicture.string(
                                    _svg_wa897y,
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
                Align(
                  alignment: Alignment(0.01, 0.423),
                  child: SizedBox(
                    width: 44.0,
                    height: 44.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: 22.0,
                            height: 22.0,
                            child: SvgPicture.string(
                              _svg_pigtlf,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.415, 0.423),
                  child: SizedBox(
                    width: 44.0,
                    height: 44.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 20.3, middle: 0.5325),
                          Pin(start: 10.4, end: 11.0),
                          child: SvgPicture.string(
                            _svg_u3l4vi,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 44.0, end: 28.0),
                  Pin(size: 44.0, middle: 0.7115),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.087, 0.033),
                        child: SizedBox(
                          width: 24.0,
                          height: 20.0,
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  width: 8.0,
                                  height: 9.0,
                                  child: SvgPicture.string(
                                    _svg_o6o0li,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 4.3, end: 3.2),
                                Pin(size: 4.5, middle: 0.2235),
                                child: SvgPicture.string(
                                  _svg_su,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 8.4, middle: 0.3507),
                                Pin(size: 7.0, end: 2.7),
                                child: SvgPicture.string(
                                  _svg_bape,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 2.6, 2.6, 0.0),
                                child: SizedBox.expand(
                                    child: SvgPicture.string(
                                  _svg_pv9jvw,
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
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 50.0, middle: 0.666),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfeff984b),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                Align(
                  alignment: Alignment(0.004, 0.0),
                  child: SizedBox(
                    width: 176.0,
                    height: 22.0,
                    child: Text(
                      'My promotion record'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'PingFang SC',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        height: 1.8125,
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
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

const String _svg_gu7j7h =
    '<svg viewBox="25.1 53.5 7.4 14.9" ><path transform="translate(-3056.39, -5242.41)" d="M 3088.940673828125 5295.9091796875 L 3081.505859375 5303.34423828125 L 3088.940673828125 5310.77880859375" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n43g =
    '<svg viewBox="38.3 151.1 26.8 19.4" ><path transform="translate(-0.12, -177.84)" d="M 64.66978454589844 330.7774658203125 C 64.66822814941406 330.7735900878906 64.66610717773438 330.7699584960938 64.66347503662109 330.7666625976562 C 64.34188842773438 330.2172241210938 63.88682556152344 329.7578125 63.34043884277344 329.4310302734375 C 62.82506561279297 329.123779296875 62.2364387512207 328.9610900878906 61.63643646240234 328.9599914550781 L 38.40000152587891 328.9599914550781 L 38.40000152587891 344.3923950195312 C 38.40000152587891 346.5539245605469 40.02114868164062 348.3236999511719 42.00254821777344 348.3236999511719 L 65.23898315429688 348.3236999511719 L 65.23898315429688 332.8912658691406 C 65.23887634277344 332.7133178710938 65.22774505615234 332.5355529785156 65.20565795898438 332.3590087890625 C 65.13676452636719 331.80078125 64.95440673828125 331.2625732421875 64.66977691650391 330.7774658203125 Z" fill="#ee7c3d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sbcuro =
    '<svg viewBox="38.3 144.6 33.3 25.8" ><path  d="M 71.56675720214844 148.0390014648438 C 71.52446746826172 147.4750518798828 71.34011840820312 146.9309844970703 71.03087615966797 146.4574890136719 C 71.02932739257812 146.4535980224609 71.02719879150391 146.449951171875 71.02456665039062 146.4466857910156 C 70.70298767089844 145.897216796875 70.24791717529297 145.4378204345703 69.7015380859375 145.1110382080078 C 69.1861572265625 144.8038024902344 68.5975341796875 144.6410827636719 67.99752807617188 144.6399993896484 L 41.87905883789062 144.6399993896484 C 41.27905654907227 144.6410827636719 40.6904296875 144.8038024902344 40.17505645751953 145.1110382080078 C 39.6286735534668 145.4378204345703 39.17360687255859 145.897216796875 38.85202026367188 146.4466857910156 C 38.84939575195312 146.449951171875 38.84727096557617 146.4535980224609 38.8457145690918 146.4574890136719 C 38.53488159179688 146.9305572509766 38.34896850585938 147.4746551513672 38.30533218383789 148.0390014648438 C 38.28324508666992 148.215576171875 38.27211380004883 148.3933410644531 38.27200698852539 148.5712890625 L 38.27200698852539 166.5570068359375 C 38.27200698852539 168.7185363769531 39.89315414428711 170.48828125 41.87455749511719 170.48828125 L 67.99752807617188 170.48828125 C 69.97892761230469 170.48828125 71.60008239746094 168.7194366455078 71.60008239746094 166.5570068359375 L 71.60008239746094 148.5712890625 C 71.5999755859375 148.3933410644531 71.58885192871094 148.215576171875 71.56675720214844 148.0390014648438 Z M 67.99752807617188 147.5220489501953 C 68.01641845703125 147.5207061767578 68.03538513183594 147.5207061767578 68.05427551269531 147.5220489501953 L 68.07228088378906 147.5220489501953 L 68.1029052734375 147.5292510986328 L 68.42082977294922 147.7994384765625 C 68.47657775878906 147.8457489013672 68.52648162841797 147.898681640625 68.56943511962891 147.9570465087891 C 68.62469482421875 148.0624694824219 68.66443634033203 148.1753082275391 68.68742370605469 148.2920837402344 C 68.67481231689453 148.4722137451172 68.53791809082031 148.6289215087891 68.41722869873047 148.7315979003906 L 56.16676330566406 159.2357330322266 C 55.86775207519531 159.4924163818359 55.42013549804688 159.6392211914062 54.93829345703125 159.6392211914062 C 54.45645523071289 159.6392211914062 54.00883865356445 159.4924163818359 53.7098274230957 159.2366333007812 L 41.45486068725586 148.7442016601562 C 41.33597564697266 148.6415405273438 41.19907760620117 148.4857177734375 41.18466949462891 148.3038024902344 C 41.20736694335938 148.1872253417969 41.24711990356445 148.0746307373047 41.30265045166016 147.9696655273438 C 41.34561157226562 147.9112854003906 41.39551162719727 147.8583679199219 41.45125579833984 147.8120422363281 L 41.76918029785156 147.5418548583984 L 41.7998046875 147.5355529785156 L 41.81781768798828 147.5355529785156 C 41.83670806884766 147.5342102050781 41.85566711425781 147.5342102050781 41.87455749511719 147.5355529785156 L 67.99752807617188 147.5220489501953 Z M 67.99752807617188 167.6062469482422 L 41.87905883789062 167.6062469482422 C 41.53861999511719 167.6062469482422 41.15855026245117 167.1559295654297 41.15855026245117 166.5570068359375 L 41.15855026245117 152.2837066650391 L 51.83560180664062 161.4260864257812 C 52.68670272827148 162.1573944091797 53.81340026855469 162.5176544189453 54.93829345703125 162.5176544189453 C 56.06319046020508 162.5176544189453 57.18988800048828 162.1519927978516 58.04099273681641 161.4224700927734 L 68.71804046630859 152.2837066650391 L 68.71804046630859 166.5570068359375 C 68.71804046630859 167.1577301025391 68.33796691894531 167.6062469482422 67.99752807617188 167.6062469482422 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_brqsjs =
    '<svg viewBox="0.0 0.0 17.6 16.0" ><path transform="translate(0.0, -0.77)" d="M 16.81917762756348 6.886385917663574 C 17.09466171264648 6.886385917663574 17.37014389038086 6.886385917663574 17.64562606811523 6.931339263916016 C 16.866943359375 3.394905090332031 13.09718227386475 0.7749019861221313 8.776453971862793 0.7749019861221313 C 3.952488899230957 0.7749019861221313 0 4.083636283874512 0 8.218849182128906 C 0 10.60833740234375 1.287508964538574 12.62957572937012 3.491461515426636 14.14761543273926 L 2.617190837860107 16.76758766174316 L 5.695423126220703 15.25236129760742 C 6.797401905059814 15.48289108276367 7.6716628074646 15.71060752868652 8.773641586303711 15.71060752868652 C 9.049124717712402 15.71060752868652 9.324607849121094 15.71060752868652 9.647903442382812 15.66560935974121 C 9.465184211730957 15.06682968139648 9.372419357299805 14.47086524963379 9.372419357299805 13.82713317871094 C 9.375232696533203 10.01237106323242 12.63898086547852 6.886385917663574 16.81917762756348 6.886385917663574 Z M 12.08515644073486 4.496879577636719 C 12.77388668060303 4.496879577636719 13.18713474273682 4.955099105834961 13.18713474273682 5.598876953125 C 13.18713474273682 6.242608070373535 12.72893333435059 6.700809478759766 12.08515644073486 6.700809478759766 C 11.39642524719238 6.700809478759766 10.75269317626953 6.239795684814453 10.75269317626953 5.598876953125 C 10.75269317626953 4.910118103027344 11.44423675537109 4.496879577636719 12.08515644073486 4.496879577636719 Z M 6.004655838012695 6.551840782165527 C 5.310299873352051 6.551840782165527 4.660897731781006 6.096452713012695 4.660897731781006 5.461112022399902 C 4.660897731781006 4.777997016906738 5.355253219604492 4.370378494262695 6.004655838012695 4.370378494262695 C 6.654012203216553 4.370378494262695 7.115025520324707 4.825785636901855 7.115025520324707 5.461112022399902 C 7.117837905883789 6.099218845367432 6.654012203216553 6.551840782165527 6.004655838012695 6.551840782165527 Z" fill="#82cca7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ntawp =
    '<svg viewBox="9.9 6.6 14.9 13.6" ><path transform="translate(-11.55, -8.46)" d="M 36.36720275878906 21.41722106933594 C 36.36720275878906 17.87798881530762 32.87573623657227 15.03030014038086 28.92325782775879 15.03030014038086 C 24.74024772644043 15.03030014038086 21.43149948120117 17.92580032348633 21.43149948120117 21.41722106933594 C 21.43149948120117 24.95650100708008 24.74024772644043 27.80419158935547 28.92325782775879 27.80419158935547 C 29.79751777648926 27.80419158935547 30.66901206970215 27.57370758056641 31.54327392578125 27.34598922729492 L 33.93276214599609 28.67845153808594 L 33.28898620605469 26.47172546386719 C 35.03474044799805 25.13921737670898 36.36720275878906 23.39350891113281 36.36720275878906 21.41722106933594 Z M 26.48600387573242 20.31528854370117 C 26.07275581359863 20.31528854370117 25.61169624328613 19.90204238891602 25.61169624328613 19.44098281860352 C 25.61169624328613 19.02778053283691 26.06994247436523 18.56672096252441 26.48600387573242 18.56672096252441 C 27.12973403930664 18.56672096252441 27.58798217773438 19.02496719360352 27.58798217773438 19.44098281860352 C 27.58798217773438 19.90204238891602 27.17473411560059 20.31528854370117 26.48600387573242 20.31528854370117 Z M 31.48983764648438 20.10163497924805 C 31.07377624511719 20.10163497924805 30.60995101928711 19.69120025634766 30.60995101928711 19.23857688903809 C 30.60995101928711 18.82818603515625 31.07377624511719 18.37556457519531 31.48983764648438 18.37556457519531 C 32.13924026489258 18.37556457519531 32.60025405883789 18.83100128173828 32.60025405883789 19.23857688903809 C 32.60025405883789 19.69401168823242 32.13924026489258 20.10163497924805 31.48983764648438 20.10163497924805 Z" fill="#82cca7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e0zaez =
    '<svg viewBox="0.0 6.7 13.5 12.5" ><path transform="translate(-341.34, -392.09)" d="M 341.3550415039062 406.4928588867188 C 341.4146423339844 405.2185668945312 341.9599609375 404.0155639648438 342.8789672851562 403.1307983398438 L 344.4028930664062 401.6068725585938 C 344.8818054199219 401.1279907226562 345.6582641601562 401.1279907226562 346.13720703125 401.6068725585938 C 346.6160888671875 402.0857849121094 346.6160888671875 402.8622436523438 346.13720703125 403.3411560058594 L 344.6132202148438 404.8651123046875 C 344.1346435546875 405.3184814453125 343.8518371582031 405.940673828125 343.8249206542969 406.599365234375 C 343.7914428710938 407.18212890625 344.0006713867188 407.7527465820312 344.4028930664062 408.17578125 C 344.795654296875 408.55859375 345.3261108398438 408.7669677734375 345.8743896484375 408.7537536621094 C 346.561767578125 408.7183837890625 347.2139587402344 408.4388427734375 347.7135620117188 407.9654541015625 L 351.5498046875 404.1292114257812 C 352.4957580566406 403.1832580566406 352.6009216308594 401.7117614746094 351.7601318359375 400.8709716796875 C 351.28125 400.39208984375 351.28125 399.6156005859375 351.7601318359375 399.13671875 C 352.2390747070312 398.6577758789062 353.0155029296875 398.6577758789062 353.4944152832031 399.13671875 C 354.351806640625 399.9809265136719 354.8265380859375 401.1390991210938 354.8083190917969 402.3422241210938 C 354.790283203125 403.6874694824219 354.2427368164062 404.971435546875 353.2843627929688 405.9156494140625 L 349.4481201171875 409.7518920898438 C 348.5016479492188 410.7069396972656 347.2191162109375 411.2538757324219 345.8746948242188 411.2758178710938 C 344.6743469238281 411.2796020507812 343.5215454101562 410.8070983886719 342.669189453125 409.9619445800781 C 341.7404174804688 409.05615234375 341.2594604492188 407.7861328125 341.3552856445312 406.4923095703125 Z M 341.3550415039062 406.4928588867188" fill="#7a87aa" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wa897y =
    '<svg viewBox="5.6 0.0 13.5 12.5" ><path transform="translate(-92.04, -109.23)" d="M 106.240837097168 117.1633682250977 L 106.240837097168 117.1633682250977 L 107.2919464111328 116.1122589111328 L 107.8175048828125 115.5867080688477 C 108.2886047363281 115.1438598632812 108.5866622924805 114.5477447509766 108.6582794189453 113.905143737793 C 108.6917419433594 113.322380065918 108.4825210571289 112.7517623901367 108.0802764892578 112.3287582397461 C 107.6875534057617 111.9458999633789 107.1570816040039 111.7375335693359 106.6087799072266 111.7507476806641 C 105.9160232543945 111.761962890625 105.2554473876953 112.0451126098633 104.7696075439453 112.5390777587891 L 100.9331207275391 116.3755722045898 C 99.98716735839844 117.3215179443359 99.88200378417969 118.7930145263672 100.722785949707 119.6337966918945 C 101.2016906738281 120.1127014160156 101.2016906738281 120.8891677856445 100.722785949707 121.3680725097656 C 100.2438812255859 121.8469848632812 99.46742248535156 121.8469848632812 98.98851013183594 121.3680725097656 C 98.13114166259766 120.5238571166992 97.65641784667969 119.3656768798828 97.67462158203125 118.1625671386719 C 97.692626953125 116.8172988891602 98.24018859863281 115.5333404541016 99.19857788085938 114.5891265869141 L 103.0347900390625 110.7528991699219 C 103.9812927246094 109.7978363037109 105.2638092041016 109.2508850097656 106.6082458496094 109.2289505004883 C 107.8085708618164 109.2251586914062 108.9613876342773 109.6976776123047 109.8137512207031 110.5428314208984 C 110.7064056396484 111.4500122070312 111.182258605957 112.6871337890625 111.1276397705078 113.9586639404297 C 111.0680084228516 115.2329330444336 110.5226821899414 116.4359893798828 109.6036834716797 117.3207092285156 L 109.0781326293945 117.8462677001953 L 108.0797424316406 118.8973693847656 C 107.598388671875 119.3703460693359 106.8268127441406 119.3703460693359 106.345458984375 118.8973693847656 C 106.0934600830078 118.6863708496094 105.9394073486328 118.3809509277344 105.9195098876953 118.0528793334961 C 105.8996124267578 117.7248001098633 106.0156326293945 117.4029998779297 106.2402954101562 117.1631011962891 Z M 106.240837097168 117.1633682250977" fill="#7a87aa" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pigtlf =
    '<svg viewBox="178.2 435.3 21.7 22.1" ><path transform="translate(178.17, 435.34)" d="M 11.46466159820557 6.735160350799561 L 6.008851051330566 1.182618260383606 C 5.800268173217773 1.288671135902405 5.595327377319336 1.399777293205261 5.395780563354492 1.517822504043579 C 4.592199802398682 1.98762834072113 3.835089206695557 2.568111896514893 3.151134729385376 3.263850927352905 C 2.855438947677612 3.563069581985474 2.586834907531738 3.87705135345459 2.336276769638062 4.197948455810547 C 1.720038175582886 4.987283229827881 1.224786400794983 5.842548847198486 0.8514479994773865 6.73700475692749 C 0.8514479994773865 6.73700475692749 11.13555717468262 6.681677341461182 11.46466159820557 6.735160350799561 Z M 8.289621353149414 7.524494647979736 L 0.5733414888381958 7.524494647979736 C 0.498848021030426 7.744881153106689 0.4329515695571899 7.972183704376221 0.3715398013591766 8.200869560241699 C 0.1309289336204529 9.109617233276367 0 10.06447315216064 0 11.05160140991211 C 0 11.47347164154053 0.02573288977146149 11.88888549804688 0.07269112020730972 12.29738521575928 C 0.1837488412857056 13.299729347229 0.4293331503868103 14.25919437408447 0.7882413268089294 15.15918350219727 C 0.7882413268089294 15.15918350219727 8.019624710083008 7.720906257629395 8.289621353149414 7.524494647979736 Z M 20.53213691711426 6.103969573974609 C 20.42964363098145 5.8951096534729 20.3204174041748 5.686249732971191 20.20437049865723 5.481077671051025 C 19.74118995666504 4.665924072265625 19.17233276367188 3.894580364227295 18.48660087585449 3.198361873626709 C 18.19359588623047 2.900526762008667 17.88616180419922 2.624342679977417 17.56922912597656 2.368934154510498 C 16.79317474365234 1.742353916168213 15.95395278930664 1.237945318222046 15.07494354248047 0.8589542508125305 C 15.07494354248047 0.8589542508125305 15.12957859039307 11.32224273681641 15.07494354248047 11.65559005737305 L 20.53213691711426 6.103969573974609 Z M 14.31742286682129 8.436010360717773 L 14.31742286682129 0.5850847959518433 C 14.09934043884277 0.5099412798881531 13.87591075897217 0.4412341713905334 13.65197467803955 0.3776079118251801 C 12.75991630554199 0.1341683864593506 11.82087707519531 0 10.85025405883789 0 C 10.43534660339355 0 10.02772331237793 0.02628040313720703 9.625449180603027 0.07376217842102051 C 8.641732215881348 0.1871828734874725 7.698680877685547 0.4380141198635101 6.811556339263916 0.8008607029914856 C 6.811556339263916 0.8008607029914856 14.12101078033447 8.162139892578125 14.31742286682129 8.436010360717773 Z M 6.584484577178955 10.41902732849121 L 1.130448937416077 15.9715690612793 C 1.2315593957901 16.18416404724121 1.343085050582886 16.39021110534668 1.458202362060547 16.59584426879883 C 1.919132828712463 17.41242790222168 2.489763498306274 18.1837329864502 3.175981521606445 18.88039588928223 C 3.468523740768433 19.17874717712402 3.776405572891235 19.45261764526367 4.093347072601318 19.70988845825195 C 4.869389057159424 20.33785057067871 5.706857204437256 20.83994483947754 6.587619781494141 21.21842956542969 C 6.587619781494141 21.21796798706055 6.531647205352783 10.75467872619629 6.584438323974609 10.41907405853271 L 6.584484577178955 10.41902732849121 Z M 10.15230178833008 15.43720054626465 L 15.60949611663818 20.98974418640137 C 15.81688022613525 20.88365364074707 16.02145195007324 20.77184677124023 16.22298049926758 20.65455436706543 C 17.02255249023438 20.18565559387207 17.77915000915527 19.60656547546387 18.46626663208008 18.90759658813477 C 18.75793266296387 18.61021423339844 19.02788352966309 18.29807662963867 19.28068161010742 17.97487449645996 C 19.89559745788574 17.18507766723633 20.39220428466797 16.33257865905762 20.76418876647949 15.436279296875 C 20.76326560974121 15.436279296875 10.48186779022217 15.49345111846924 10.15230178833008 15.43720054626465 Z M 21.59667778015137 9.837631225585938 C 21.4842700958252 8.836670875549316 21.24046325683594 7.876283168792725 20.88203430175781 6.974911689758301 C 20.88203430175781 6.974911689758301 13.64925384521484 14.41272735595703 13.3788423538208 14.61144351959229 L 21.09509086608887 14.61144351959229 C 21.16858291625977 14.38773727416992 21.23557472229004 14.16191005706787 21.2960205078125 13.93414688110352 C 21.53798484802246 13.02447605133057 21.66980171203613 12.0723876953125 21.66980171203613 11.08479785919189 C 21.66980171203613 10.66246700286865 21.64315223693848 10.24659156799316 21.59667778015137 9.837631225585938 L 21.59667778015137 9.837631225585938 Z M 7.352839946746826 13.69347381591797 L 7.352839946746826 21.54532051086426 C 7.571797370910645 21.62093544006348 7.794351100921631 21.68917083740234 8.017826080322266 21.75049209594727 C 8.91126823425293 21.99808120727539 9.84892463684082 22.13086700439453 10.81954669952393 22.13086700439453 C 11.23307132720947 22.13086700439453 11.64166259765625 22.10458564758301 12.04209232330322 22.05663681030273 C 13.02714729309082 21.94275283813477 13.96890735626221 21.69516563415527 14.85464763641357 21.33046722412109 C 14.85598659515381 21.33046722412109 7.547407150268555 13.97010898590088 7.352839946746826 13.69347381591797 Z" fill="#82b160" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u3l4vi =
    '<svg viewBox="242.6 434.4 20.3 22.6" ><path transform="translate(242.63, 434.41)" d="M 0.6945401430130005 13.03056144714355 C -0.09657730162143707 15.03308200836182 -0.2329753041267395 16.92282867431641 0.3944525420665741 17.2612476348877 C 0.8309400081634521 17.51510620117188 1.540201783180237 16.95099830627441 2.19492506980896 15.93560695648193 C 2.440425395965576 17.06381988525391 3.095148324966431 18.05094909667969 3.99537205696106 18.8689136505127 C 3.040581941604614 19.23559761047363 2.413153648376465 19.8560905456543 2.413153648376465 20.53297233581543 C 2.413153648376465 21.66118431091309 4.104477405548096 22.59192657470703 6.177783966064453 22.59192657470703 C 8.060059547424316 22.59192657470703 9.614982604980469 21.85861015319824 9.915040969848633 20.87143516540527 L 10.35157203674316 20.87143516540527 C 10.65158367156982 21.85861015319824 12.20655345916748 22.59192657470703 14.08882904052734 22.59192657470703 C 16.18941497802734 22.59192657470703 17.85347175598145 21.68935585021973 17.85347175598145 20.53297233581543 C 17.85347175598145 19.8560905456543 17.22601699829102 19.23554992675781 16.27125358581543 18.8689136505127 C 17.17147254943848 18.05094909667969 17.82617950439453 17.06381988525391 18.07169151306152 15.93560695648193 C 18.72639656066895 16.95099830627441 19.40839576721191 17.51506042480469 19.87217712402344 17.2612476348877 C 20.52688026428223 16.92282867431641 20.39049911499023 15.0048656463623 19.57207107543945 13.03056144714355 C 18.94466209411621 11.47928047180176 18.09898567199707 10.32289600372314 17.44428253173828 10.06908321380615 C 17.44428253173828 9.984432220458984 17.47157669067383 9.871611595153809 17.47157669067383 9.758790016174316 C 17.47157669067383 9.166512489318848 17.30789947509766 8.60240650177002 17.0350456237793 8.151121139526367 L 17.0350456237793 8.038345336914062 C 17.0350456237793 7.756269454956055 16.98050308227539 7.502455711364746 16.87141609191895 7.27681303024292 C 16.70774078369141 3.215333700180054 14.19796180725098 0 10.1333065032959 0 C 6.06865119934082 0 3.558905124664307 3.215333700180054 3.395215034484863 7.27681303024292 C 3.286109924316406 7.502455711364746 3.231543779373169 7.756269454956055 3.231543779373169 8.038345336914062 L 3.231543779373169 8.151121139526367 C 2.958748579025269 8.60240650177002 2.795058727264404 9.166512489318848 2.795058727264404 9.758835792541504 L 2.795058727264404 10.06908321380615 C 2.19492506980896 10.32289600372314 1.32196843624115 11.45106315612793 0.6945401430130005 13.03056144714355 Z" fill="#7cd8d8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o6o0li =
    '<svg viewBox="16.1 0.0 8.2 8.7" ><path transform="translate(-18.85, -0.77)" d="M 41.47319030761719 2.666629314422607 C 39.15027618408203 0.4843372702598572 35.74032592773438 0.7894749045372009 35.74032592773438 0.7894749045372009 C 35.32108306884766 0.7977578639984131 34.98109817504883 1.137381792068481 34.98109817504883 1.551150560379028 L 34.98109817504883 1.919873952865601 C 34.98109817504883 2.332291841506958 35.31951904296875 2.647356986999512 35.75111389160156 2.64013671875 C 35.75111389160156 2.64013671875 39.02348327636719 2.300354242324829 40.41740798950195 4.28800106048584 C 41.81105041503906 6.275666236877441 41.20890808105469 8.769769668579102 41.20890808105469 8.769769668579102 C 41.14495849609375 9.176885604858398 41.43376922607422 9.507003784179688 41.8597412109375 9.507003784179688 L 42.18487930297852 9.507003784179688 C 42.60831451416016 9.507003784179688 42.99984741210938 9.177946090698242 43.04544830322266 8.767048835754395 C 43.04549407958984 8.767048835754395 43.79605102539062 4.848843097686768 41.47319030761719 2.666629314422607 Z" fill="#e88181" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_su =
    '<svg viewBox="16.8 3.4 4.3 4.5" ><path transform="translate(-19.67, -4.71)" d="M 39.59114456176758 12.55853271484375 L 40.0518798828125 12.55853271484375 C 40.33308410644531 12.55853271484375 40.60565948486328 12.34293937683105 40.651123046875 12.06588935852051 C 40.651123046875 12.06588935852051 41.19411087036133 9.998636245727539 39.92721176147461 8.865591049194336 C 38.66017150878906 7.732485771179199 37.00446319580078 8.145807266235352 37.00446319580078 8.145807266235352 C 36.72676849365234 8.187274932861328 36.50139999389648 8.444892883300781 36.50139999389648 8.718757629394531 L 36.50139999389648 8.913190841674805 C 36.50139999389648 9.188323974609375 36.72634887695312 9.394647598266602 37.01686477661133 9.386394500732422 C 37.01686477661133 9.386394500732422 38.40654373168945 9.201417922973633 39.08250427246094 9.998682022094727 C 39.75832366943359 10.79608535766602 39.22921371459961 12.08566856384277 39.22921371459961 12.08566856384277 C 39.14797210693359 12.34690475463867 39.31368255615234 12.55853271484375 39.59114456176758 12.55853271484375 Z" fill="#e88181" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bape =
    '<svg viewBox="5.6 9.8 8.4 7.0" ><path transform="translate(-6.53, -12.23)" d="M 15.62832832336426 22.11910247802734 C 13.34732818603516 22.55282020568848 11.80245590209961 24.43532752990723 12.17766666412354 26.32396697998047 C 12.55301475524902 28.21242141723633 14.70625495910645 29.39181137084961 16.9870719909668 28.95809173583984 C 19.26802635192871 28.5242805480957 20.8132209777832 26.64168167114258 20.43791770935059 24.75308990478516 C 20.06266212463379 22.86468124389648 17.90942001342773 21.6852912902832 15.62832832336426 22.11910247802734 Z M 15.44123077392578 27.08581924438477 C 14.73922157287598 27.40597915649414 13.96800708770752 27.2417049407959 13.71871185302734 26.7186336517334 C 13.46937084197998 26.19537734985352 13.83628273010254 25.51181030273438 14.53829193115234 25.191650390625 C 15.24030113220215 24.87130546569824 16.01156234741211 25.03581237792969 16.26099586486816 25.558837890625 C 16.50996589660645 26.0820484161377 16.14342498779297 26.76566314697266 15.44123077392578 27.08581924438477 Z M 17.0510196685791 25.4965934753418 C 16.66396141052246 25.4965934753418 16.35002517700195 25.18464088439941 16.35002517700195 24.79988670349121 C 16.35002517700195 24.4151782989502 16.66391563415527 24.10313415527344 17.0510196685791 24.10313415527344 C 17.4385871887207 24.10313415527344 17.75252151489258 24.4151782989502 17.75252151489258 24.79988670349121 C 17.75252151489258 25.18468856811523 17.43854141235352 25.4965934753418 17.0510196685791 25.4965934753418 Z" fill="#e88181" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pv9jvw =
    '<svg viewBox="0.0 2.6 21.7 16.9" ><path transform="translate(0.0, -3.87)" d="M 17.59421920776367 12.97882556915283 C 17.59421920776367 12.76904296875 19.63426780700684 10.88058853149414 17.59421920776367 9.705440521240234 C 15.55412197113037 8.530429840087891 11.82212066650391 10.31694316864014 11.93397426605225 10.12505054473877 C 13.53906154632568 7.382095336914062 11.24538230895996 6.516109943389893 10.07595062255859 6.516109943389893 C 7.287876605987549 6.516109943389893 0 12.5914888381958 0 16.43921661376953 C 0 20.28694534301758 4.866207599639893 23.40633773803711 10.86888027191162 23.40633773803711 C 16.87164688110352 23.40633773803711 21.69137763977051 20.28694534301758 21.69137763977051 16.43921661376953 C 21.69137763977051 13.18865394592285 17.59421920776367 13.18865394592285 17.59421920776367 12.97882556915283 Z M 11.16248416900635 21.27199935913086 C 7.327712535858154 21.79926681518555 3.930224180221558 20.21893692016602 3.574396848678589 17.7423095703125 C 3.21856951713562 15.26554393768311 6.039004802703857 12.83036422729492 9.873960494995117 12.30309677124023 C 13.70933055877686 11.77582836151123 17.10637092590332 13.35611057281494 17.46235656738281 15.83292293548584 C 17.81829452514648 18.30955123901367 14.99785327911377 20.74468612670898 11.16248416900635 21.27199935913086 Z" fill="#e88181" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
