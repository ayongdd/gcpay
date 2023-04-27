import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class GameProcessTransferPage extends StatelessWidget {

  const GameProcessTransferPage({Key? key}) : super(key: key);

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
            Pin(size: 80.0, start: 20.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfe013428),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 38.0, start: 25.0),
                  Pin(size: 53.0, middle: 0.5185),
                  child: Text(
                    '01',
                    style: TextStyle(
                      fontFamily: 'PingFang SC',
                      fontSize: 38,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w600,
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(0.634, 0.043),
                  child: SizedBox(
                    width: 220.0,
                    height: 50.0,
                    child: Text(
                      'you want to play'.tr,
                      style: TextStyle(
                        fontFamily: 'PingFang SC',
                        fontSize: 10.7,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.523, 0.065),
                  child: SizedBox(
                    width: 1.0,
                    height: 34.0,
                    child: SvgPicture.string(
                      _svg_ag3m,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 80.0, start: 111.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfe013428),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 46.0, start: 25.0),
                  Pin(size: 53.0, middle: 0.5185),
                  child: Text(
                    '02',
                    style: TextStyle(
                      fontFamily: 'PingFang SC',
                      fontSize: 38,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w600,
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(0.64, 0.053),
                  child: SizedBox(
                    width: 220.0,
                    height: 50.0,
                    child: Text(
                      'cold wallet to transfer money'.tr,
                      style: TextStyle(
                        fontFamily: 'PingFang SC',
                        fontSize: 10.5,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.523, 0.0),
                  child: SizedBox(
                    width: 1.0,
                    height: 34.0,
                    child: SvgPicture.string(
                      _svg_diu1a0,
                      allowDrawingOutsideViewBox: true,
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

const String _svg_ag3m =
    '<svg viewBox="94.5 338.5 1.0 34.0" ><path transform="translate(94.5, 338.5)" d="M 0 0 L 0 34" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_diu1a0 =
    '<svg viewBox="94.5 428.0 1.0 34.0" ><path transform="translate(94.5, 428.0)" d="M 0 0 L 0 34" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

class GameProcessTransferPageBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => TopicController());
  }
}