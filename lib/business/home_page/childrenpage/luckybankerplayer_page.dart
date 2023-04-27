import 'dart:async';

import 'package:adobe_xd/pinned.dart';
import 'package:copy_paste/copy_paste.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:GCPay/base/controller/base_controller.dart';
import 'package:GCPay/base/pageWidget/base_stateless_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:GCPay/mixin/toast/toast_mixin.dart';

import '../../../res/colors.dart';
import '../home_page.dart';
import '../model/BetAddressData.dart';

class LuckyBankerPlayerPage extends StatefulWidget {
  String tagType;

  LuckyBankerPlayerPage({Key? key, required this.tagType}) : super(key: key);

  @override
  LuckyBankerPlayerPageState createState() => LuckyBankerPlayerPageState();

  @override
  String? get tag {
    return tagType;
  }
}

class LuckyBankerPlayerPageState extends State<LuckyBankerPlayerPage>
    with ToastMixin {
  GlobalKey _globalKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  void openQrCode() {
    String strBettingAddress = getBetaddress(3)!;
    SmartDialog.show(
      backDismiss: false,
      clickMaskDismiss: false,
      builder: (_) {
        return Container(
          height: 480,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // title
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.close_rounded),
                    tooltip: '',
                    onPressed: () {
                      SmartDialog.dismiss();
                    },
                  ),
                ),

                Container(
                  width: 250,
                  height: 250,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey,
                        width: 10,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  margin: EdgeInsets.all(0),
                  child: Container(),
                ),
                Container(
                  height: 55,
                  margin: EdgeInsets.only(
                      left: 15.0, right: 15, top: 15, bottom: 15),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: ColorStyle.color_272B33,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'BettingAddress\n'.tr + strBettingAddress,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        child: Container(
                          height: 55,
                          width: 45,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: ColorStyle.color_121923,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)),
                            gradient: LinearGradient(
                                colors: [Color(0xFFfcefd9), Color(0xFFf9dba9)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                          ),
                          child: Image.asset(
                            'assets/images/menuicon/copypaste.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        onTap: () async {
                          await CopyPaste.copyToClipboard(
                              strBettingAddress);
                          showToast("CopySuccess".tr,
                              gravity: ToastGravity.CENTER);
                        },
                      ),
                    ],
                  ),
                ),
                // button (only method of close the dialog)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //change width and height on your need width = 200 and height = 50
                    minimumSize: Size(200, 50),
                  ),
                  onPressed: () => SmartDialog.dismiss(),
                  child: Text('close'.tr),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  String? getBetaddress(int intIndex) {
    HomeController homeController = Get.find<HomeController>();
    for (BetAddressData betaddress in homeController.betaddList) {
      if (betaddress.playId == intIndex) {
        return betaddress.address;
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(Get.context!);
    final ColorScheme colorScheme = theme.colorScheme;
    HomeController homeController = Get.find<HomeController>();
    String strBettingAddress = getBetaddress(3)!;
    return SingleChildScrollView(
      primary: false,
      child: SizedBox(
        width: 284.0,
        height: 970.0,
        child: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 258.0, end: -3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfe01231b),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(start: 50.0, end: 50.0),
              Pin(size: 35.0, start: 698.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(
                        'assets/images/introduce_banner1.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 124.0, start: 85.0),
              Pin(size: 17.0, start: 705.0),
              child: Text(
                'example'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'PingFang SC',
                  fontSize: 14,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w600,
                ),
                softWrap: false,
              ),
            ),
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 245.0, end: -3.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Row(
                      children: <Widget>[
                        Container(
                          height: 220,
                          width: 139,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: Color(0x38000000),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text(
                                    'Case1'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 13,
                                      color: const Color(0xffe0622f),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center
                                ),
                                Text(
                                    'caseA luckyBankerPlayer'.tr,
                                    style: TextStyle(color: Colors.white, fontSize: 10.4),
                                    textAlign: TextAlign.center
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 220,
                          width: 139,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: Color(0x38000000),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text(
                                    'Case2'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 13,
                                      color: const Color(0xff44d3ff),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center
                                ),
                                Text(
                                    'caseB luckyBankerPlayer'.tr,
                                    style: TextStyle(color: Colors.white, fontSize: 11),
                                    textAlign: TextAlign.center
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 220,
                          width: 139,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: Color(0x38000000),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text(
                                    'Case3'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 13,
                                      color: const Color(0xff60ff0e),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center
                                ),
                                Text(
                                    'caseC luckyBankerPlayer'.tr,
                                    style: TextStyle(color: Colors.white, fontSize: 10),
                                    textAlign: TextAlign.center
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 220,
                          width: 139,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: Color(0x38000000),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text(
                                    'Case4'.tr,
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 13,
                                      color: const Color(0xffffe11c),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center
                                ),
                                Text(
                                    'caseD luckyBankerPlayer'.tr,
                                    style: TextStyle(color: Colors.white, fontSize: 11),
                                    textAlign: TextAlign.center
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 152.0, middle: 0.6646),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/video_background.png'),
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.dstIn),
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(0.0, 29.0, 0.0, 0.0),
                  ),
                  Align(
                    alignment: Alignment(0.0, 0.23),
                    child: SizedBox(
                      width: 26.0,
                      height: 26.0,
                      child: SvgPicture.string(
                        _svg_uewre,
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
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 145.0, end: 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xfe01231b),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 2.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/video_background.png'),
                              fit: BoxFit.cover,
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.6),
                                  BlendMode.dstIn),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(start: 50.0, end: 50.0),
                          Pin(size: 35.0, start: -14.0),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(
                                    'assets/images/introduce_banner1.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 148.0, start: 70.0),
                          Pin(size: 17.0, start: -5.0),
                          child: Text(
                            'Video Tutorial'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'PingFang SC',
                              fontSize: 12,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: 26.0,
                            height: 26.0,
                            child: SvgPicture.string(
                              _svg_uewre,
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
              Pin(size: 155.0, middle: 0.4590),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 145.0, end: 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xfe01231b),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 50.0, end: 50.0),
                    Pin(size: 35.0, start: -8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(
                              'assets/images/introduce_banner1.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 54.0, start: 115.0),
                    Pin(size: 17.0, start: 0.0),
                    child: Text(
                      'Odds'.tr,
                      textAlign: TextAlign.center,
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
                    Pin(start: 16.0, end: 15.0),
                    Pin(size: 99.0, end: 16.0),
                    child: Text(
                      'bettingBacratInstruction'.tr,
                      style: TextStyle(
                        fontFamily: 'PingFang SC',
                        fontSize: 12,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w600,
                        height: 1.3666666666666667,
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                    ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 267.0, start: 92.0),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 148.0, start: 70.0),
                    Pin(size: 17.0, start: -5.0),
                    child: Text(
                      'Lottery Result'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'PingFang SC',
                        fontSize: 12,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 27.0, 0.0, 0.0),
                    child: Stack(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 238.0, end: 1.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xfe01231b),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/result_bingo.png'),
                                  fit: BoxFit.cover,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.5),
                                      BlendMode.dstIn),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Pinned.fromPins(
                          Pin(start: 50.0, end: 50.0),
                          Pin(size: 35.0, start: -15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(
                                    'assets/images/introduce_banner1.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 250.0, start: 16.0),
                          Pin(size: 54.0, start: -9.0),
                          child: Text(
                            'The Last 5 Digit'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'inpin nanzhengbeizhanNZBZti',
                              fontSize: 15,
                              color: const Color(0xffffcf21),
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 134.0, start: 75.0),
                          Pin(size: 24.0, middle: 0.3806),
                          child: Text(
                            'Transfer amount'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'inpin nanzhengbeizhanNZBZti',
                              fontSize: 12,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 117.0, start: 85.0),
                          Pin(size: 24.0, middle: 0.6235),
                          child: Text(
                            'Banker'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'inpin nanzhengbeizhanNZBZti',
                              fontSize: 13,
                              color: const Color(0xffe0622f),
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 117.0, start: 85.0),
                          Pin(size: 24.0, middle: 0.8535),
                          child: Text(
                            'Player'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'inpin nanzhengbeizhanNZBZti',
                              fontSize: 13,
                              color: const Color(0xff44d3ff),
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 260.0, start: 16.0),
                          Pin(size: 87.0, middle: 0.1373),
                          child: Text(
                            'of the block hash after the transfer as the result of the game'.tr,
                            textAlign: TextAlign.center,
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
                          Pin(start: 16.0, end: 12.0),
                          Pin(size: 32.0, middle: 0.4900),
                          child: Container(
                            height: 5,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Color(0x38000000),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Text(
                                'singleDigit luckyBankerPlayer'.tr,
                                style: TextStyle(color: Colors.white, fontSize: 9),
                                textAlign: TextAlign.center
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 260.0, start: 16.0),
                          Pin(size: 30.0, end: 55.0),
                          child: Container(
                            height: 5,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Color(0x38000000),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Text(
                                'BankerWin luckyBankerPlayer'.tr,
                                style: TextStyle(color: Colors.white, fontSize: 10),
                                textAlign: TextAlign.center
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 260.0, start: 16.0),
                          Pin(size: 30.0, end: 7.0),
                          child: Container(
                            height: 5,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Color(0x38000000),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Text(
                                'Player luckyBankerPlayer'.tr,
                                style: TextStyle(color: Colors.white, fontSize: 10),
                                textAlign: TextAlign.center
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 255.0, start: 16.0),
                          Pin(size: 27.0, middle: 0.2599),
                          child: Container(
                            height: 5,
                            alignment: Alignment.centerLeft,
                            decoration: const BoxDecoration(
                              color: Color(0x38000000),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Text(
                                'such as: 0000d8******1b1b7'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.88, -0.485),
                          child: SizedBox(
                            width: 46.0,
                            height: 26.0,
                            child: Stack(
                              children: <Widget>[
                                Pinned.fromPins(
                                  Pin(size: 35.0, start: 5.0),
                                  Pin(start: 3.0, end: 3.0),
                                  child: Text(
                                    '1b1b7',
                                    style: TextStyle(
                                      fontFamily: 'PingFang SC',
                                      fontSize: 13.5,
                                      color: const Color(0xffffcf21),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xffffcf21)),
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
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 83.0, start: 0.0),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 188.0, start: 50.0),
                    Pin(size: 17.0, start: 0.0),
                    child: Text(
                      'BettingAddress'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'PingFang SC',
                        fontSize: 13,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 240.0, start: 25.0),
                    Pin(size: 14.0, middle: 0.2754),
                    child: Text(
                      'DecentralizedWallet'.tr,
                      textAlign: TextAlign.center,
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
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Pinned.fromPins(Pin(size: 180.0, start: 13.0),
                      Pin(size: 13.0, middle: 0.8),
                      child: Obx(
                        () => Text(
                          homeController.betaddList.length > 0
                              ? getBetaddress(3)!
                              : 'TLneRBe5xNr79JuuVKd9j4nEKsxt9..',
                          style: TextStyle(
                            fontFamily: 'PingFang SC',
                            fontSize: 9,
                            color: const Color(0xff000000),
                          ),
                          softWrap: false,
                        ),
                      )),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 78.0,
                      height: 42.0,
                      child: Stack(
                        children: <Widget>[
                          InkWell(
                            child: Pinned.fromPins(
                              Pin(size: 39.0, start: 0.0),
                              Pin(start: 0.0, end: 0.0),
                              child: Container(
                                color: const Color(0x5700a889),
                              ),
                            ),
                            onTap: () {
                              openQrCode();
                            },
                          ),
                          InkWell(
                            child: Pinned.fromPins(
                              Pin(size: 16.1, start: 10.6),
                              Pin(size: 16.1, middle: 0.5),
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
                            onTap: () {
                              openQrCode();
                            },
                          ),
                          Pinned.fromPins(Pin(size: 39.0, end: 0.0),
                              Pin(start: 0.0, end: 0.0),
                              child: InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff0b5974),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                                onTap: () async {
                                  await CopyPaste.copyToClipboard(
                                      strBettingAddress);
                                  showToast("CopySuccess".tr,
                                      gravity: ToastGravity.CENTER);
                                },
                              )),
                          Pinned.fromPins(
                            Pin(size: 16.7, end: 10.3),
                            Pin(size: 18.0, middle: 0.5),
                            child: InkWell(
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
                              onTap: () async {
                                await CopyPaste.copyToClipboard(
                                    strBettingAddress);
                                showToast("CopySuccess".tr,
                                    gravity: ToastGravity.CENTER);
                              },
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
    );
  }
}

const String _svg_uewre =
    '<svg viewBox="198.2 900.7 25.7 25.7" ><path transform="translate(27.5, 730.0)" d="M 183.5042419433594 196.3418273925781 C 176.4435729980469 196.3418273925781 170.6666564941406 190.5649108886719 170.6666564941406 183.5042266845703 C 170.6666564941406 176.4435424804688 176.4435729980469 170.6666259765625 183.5042419433594 170.6666259765625 C 190.56494140625 170.6666259765625 196.3418579101562 176.4435424804688 196.3418579101562 183.5042266845703 C 196.3418579101562 190.5649108886719 190.56494140625 196.3418273925781 183.5042419433594 196.3418273925781 Z M 183.5042419433594 193.1324157714844 C 188.7997436523438 193.1324157714844 193.1324462890625 188.7997283935547 193.1324462890625 183.5042266845703 C 193.1324462890625 178.2087097167969 188.7997436523438 173.8760223388672 183.5042419433594 173.8760223388672 C 178.208740234375 173.8760223388672 173.8760681152344 178.2087097167969 173.8760681152344 183.5042266845703 C 173.8760681152344 188.7997283935547 178.208740234375 193.1324157714844 183.5042419433594 193.1324157714844 Z M 188.318359375 183.5042266845703 L 180.2948608398438 188.3183135986328 L 180.2948608398438 178.6901245117188 L 188.318359375 183.5042266845703 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fdhd3 =
    '<svg viewBox="2.9 2.9 13.2 13.2" ><path transform="translate(-253.07, -253.07)" d="M 256 256 L 257.4674377441406 256 L 257.4674377441406 257.4674987792969 L 256 257.4674987792969 L 256 256 Z M 267.7395324707031 267.7395629882812 L 269.2070007324219 267.7395629882812 L 269.2070007324219 269.20703125 L 267.7395324707031 269.20703125 L 267.7395324707031 267.7395629882812 Z M 267.7395324707031 264.8046569824219 L 266.2720947265625 264.8046569824219 L 266.2720947265625 261.8697814941406 L 261.8697509765625 261.8697814941406 L 261.8697509765625 269.20703125 L 263.3372192382812 269.20703125 L 263.3372192382812 263.3372497558594 L 264.8046569824219 263.3372497558594 L 264.8046569824219 266.2721557617188 L 269.2070007324219 266.2721557617188 L 269.2070007324219 261.8697814941406 L 267.7395324707031 261.8697814941406 L 267.7395324707031 264.8046569824219 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_r2pwvf =
    '<svg viewBox="0.0 0.0 13.2 16.1" ><path transform="translate(-109.71, -109.71)" d="M 121.4535369873047 124.3884429931641 L 122.9209747314453 124.3884429931641 L 122.9209747314453 125.8558959960938 L 121.4535369873047 125.8558959960938 L 121.4535369873047 124.3884429931641 Z M 109.7140045166016 117.0512237548828 L 117.0512390136719 117.0512237548828 L 117.0512390136719 109.7140045166016 L 109.7140045166016 109.7140045166016 L 109.7140045166016 117.0512542724609 Z M 111.1814498901367 111.1814422607422 L 115.5837783813477 111.1814422607422 L 115.5837783813477 115.5838012695312 L 111.1814498901367 115.5838012695312 L 111.1814498901367 111.1814422607422 Z M 112.6488952636719 121.4535369873047 L 114.116340637207 121.4535369873047 L 114.116340637207 122.9209899902344 L 112.6488952636719 122.9209899902344 L 112.6488952636719 121.4535369873047 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_a0iu3 =
    '<svg viewBox="0.0 2.9 13.2 13.2" ><path transform="translate(-109.71, -253.07)" d="M 109.7140045166016 269.20703125 L 117.0512390136719 269.20703125 L 117.0512390136719 261.8697814941406 L 109.7140045166016 261.8697814941406 L 109.7140045166016 269.2069702148438 Z M 111.1814498901367 263.3372497558594 L 115.5837783813477 263.3372497558594 L 115.5837783813477 267.7395629882812 L 111.1814498901367 267.7395629882812 L 111.1814498901367 263.3372497558594 Z M 121.4535369873047 256 L 122.9209747314453 256 L 122.9209747314453 257.4674987792969 L 121.4535369873047 257.4674987792969 L 121.4535369873047 256 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yuh5dm =
    '<svg viewBox="8.8 0.0 7.3 7.3" ><path transform="translate(-539.77, -109.71)" d="M 548.570068359375 109.7140045166016 L 548.570068359375 117.0512542724609 L 555.9072265625 117.0512542724609 L 555.9072265625 109.7140045166016 L 548.5700073242188 109.7140045166016 Z M 554.4398193359375 115.5838012695312 L 550.0374755859375 115.5838012695312 L 550.0374755859375 111.1814422607422 L 554.4398193359375 111.1814422607422 L 554.4398193359375 115.5838012695312 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tijmcy =
    '<svg viewBox="0.0 2.6 14.1 15.4" ><path transform="translate(-96.0, -189.43)" d="M 108.5191116333008 192 L 97.60501861572266 192 C 96.71903991699219 192.0010681152344 96.00107574462891 192.7190246582031 96 193.6050109863281 L 96 205.8031463623047 C 96 206.6884765625 96.7203369140625 207.4081573486328 97.60501861572266 207.4081573486328 L 108.5191116333008 207.4081573486328 C 109.404426574707 207.4081573486328 110.1241226196289 206.6884765625 110.1241226196289 205.8031463623047 L 110.1241226196289 193.6050109863281 C 110.1241226196289 192.7203521728516 109.404426574707 192 108.5191116333008 192 Z M 108.8401031494141 205.8031463623047 C 108.8401031494141 205.9797058105469 108.6956481933594 206.1241607666016 108.5191116333008 206.1241607666016 L 97.60501861572266 206.1241607666016 C 97.427734375 206.1241607666016 97.28401947021484 205.9804229736328 97.28401947021484 205.8031463623047 L 97.28401947021484 193.6050109863281 C 97.28401947021484 193.427734375 97.427734375 193.2840270996094 97.60501861572266 193.2840270996094 L 108.5191116333008 193.2840270996094 C 108.6963958740234 193.2840270996094 108.8401031494141 193.427734375 108.8401031494141 193.6050109863281 L 108.8401031494141 205.8031463623047 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d2tqrj =
    '<svg viewBox="3.5 0.0 13.2 14.4" ><path transform="translate(-268.47, -64.0)" d="M 283.5560913085938 64 L 272.6419982910156 64 C 272.2874145507812 64 272 64.28744506835938 272 64.64201354980469 C 272 64.99657440185547 272.2874145507812 65.28401947021484 272.6419982910156 65.28401947021484 L 283.5560913085938 65.28401947021484 C 283.7333679199219 65.28401947021484 283.8770751953125 65.427734375 283.8770751953125 65.60501861572266 L 283.8770751953125 77.80313110351562 C 283.8770751953125 78.15770721435547 284.1645202636719 78.44514465332031 284.5190734863281 78.44514465332031 C 284.8736572265625 78.44514465332031 285.1611022949219 78.15770721435547 285.1611022949219 77.80313110351562 L 285.1611022949219 65.60501861572266 C 285.1611022949219 64.7203369140625 284.44140625 64 283.5560913085938 64 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ljitw8 =
    '<svg viewBox="3.2 5.9 7.7 7.7" ><path transform="translate(-252.79, -354.06)" d="M 263.0620727539062 360 L 256.6420288085938 360 C 256.2874145507812 360 256 360.2874145507812 256 360.6419982910156 C 256 360.9965515136719 256.2874145507812 361.2839965820312 256.6420288085938 361.2839965820312 L 263.0620727539062 361.2839965820312 C 263.4166259765625 361.2839965820312 263.7040405273438 360.9965515136719 263.7040405273438 360.6419982910156 C 263.7040405273438 360.2874145507812 263.4166259765625 360 263.0620727539062 360 Z M 263.0620727539062 363.2100524902344 L 256.6420288085938 363.2100524902344 C 256.2874145507812 363.2100524902344 256 363.4974670410156 256 363.85205078125 C 256 364.2066040039062 256.2874145507812 364.4940490722656 256.6420288085938 364.4940490722656 L 263.0620727539062 364.4940490722656 C 263.4166259765625 364.4940490722656 263.7040405273438 364.2066040039062 263.7040405273438 363.85205078125 C 263.7040405273438 363.4974670410156 263.4166259765625 363.2100524902344 263.0620727539062 363.2100524902344 Z M 260.4940185546875 366.39306640625 L 256.6420288085938 366.39306640625 C 256.2874145507812 366.39306640625 256 366.6805114746094 256 367.0350952148438 C 256 367.3896789550781 256.2874145507812 367.6771240234375 256.6420288085938 367.6771240234375 L 260.4940185546875 367.6771240234375 C 260.8486328125 367.6771240234375 261.1360473632812 367.3896789550781 261.1360473632812 367.0350952148438 C 261.1360473632812 366.6805114746094 260.8486328125 366.39306640625 260.4940185546875 366.39306640625 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
