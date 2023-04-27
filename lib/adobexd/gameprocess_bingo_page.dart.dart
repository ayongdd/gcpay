import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class GameProcessBingoPage extends StatelessWidget {

  const GameProcessBingoPage({Key? key}) : super(key: key);
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
            Pin(size: 105.0, start: 140),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfe013428),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 240.0, start: 25.0),
                  Pin(size: 64.0, middle: 0.9000),
                  child: Text(
                    'Reward pool funds and betting rewards'.tr,
                    style: TextStyle(
                      fontFamily: 'PingFang SC',
                      fontSize: 11,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w600,
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 244.0, start: 25.0),
                  Pin(size: 22.0, middle: 0.153),
                  child: Text(
                    'You can check the hash value on the official website of TRON'.tr,
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
                  Pin(size: 41.0, end: 39.0),
                  Pin(size: 42.0, middle: 0.5079),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/process_bingo.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 105.0, start: 20.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfe013428),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 240.0, start: 25.0),
                  Pin(size: 54.0, middle: 0.6761),
                  child: Text(
                    'automatically return the prize'.tr,
                    style: TextStyle(
                      fontFamily: 'PingFang SC',
                      fontSize: 10,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w600,
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 41.2, end: 38.8),
                  Pin(size: 55.9, middle: 0.5313),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 27.0, end: 0.0),
                        child: SvgPicture.string(
                          _svg_aaekrl,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 1.4, end: 2.0),
                        Pin(size: 37.8, start: 0.0),
                        child: SvgPicture.string(
                          _svg_ryxbv5,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.009, 0.229),
                        child: SizedBox(
                          width: 18.0,
                          height: 9.0,
                          child: SvgPicture.string(
                            _svg_gs9q4,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.021, -0.427),
                        child: SizedBox(
                          width: 13.0,
                          height: 13.0,
                          child: SvgPicture.string(
                            _svg_nnltr,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 202.0, start: 25.0),
                  Pin(size: 22.0, middle: 0.153),
                  child: Text(
                    'win lottery'.tr,
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
        ],
      ),
    );
  }
}

const String _svg_aaekrl =
    '<svg viewBox="134.5 28.9 41.2 27.0" ><path transform="translate(0.0, -499.82)" d="M 167.5234375 549.07958984375 C 167.5234375 548.2286987304688 168.21240234375 547.5397338867188 169.0632781982422 547.5397338867188 L 175.0592651367188 547.5397338867188 C 175.3287658691406 547.5401611328125 175.5718994140625 547.3780517578125 175.6751098632812 547.129150390625 C 175.7782897949219 546.8801879882812 175.7211303710938 546.5935668945312 175.5303649902344 546.4032592773438 L 164.2449951171875 535.117919921875 L 159.7579498291016 530.6279296875 C 157.1858825683594 528.0560302734375 153.015869140625 528.0560302734375 150.4437866210938 530.6279296875 L 145.9567260742188 535.117919921875 L 134.67138671875 546.4032592773438 C 134.4805908203125 546.5935668945312 134.4234466552734 546.8801879882812 134.5266418457031 547.129150390625 C 134.6298217773438 547.3780517578125 134.8729858398438 547.5401611328125 135.1424560546875 547.5397338867188 L 141.1384582519531 547.5397338867188 C 141.9893493652344 547.5397338867188 142.6782989501953 548.2286987304688 142.6782989501953 549.07958984375 L 142.6782989501953 555.0755615234375 C 142.6782989501953 555.6702880859375 143.3952331542969 555.9676513671875 143.8162536621094 555.546630859375 L 155.1015930175781 544.2628173828125 L 166.3869476318359 555.548095703125 C 166.5774688720703 555.7391357421875 166.8644256591797 555.796142578125 167.1135101318359 555.692626953125 C 167.3625793457031 555.5889892578125 167.5244903564453 555.3453369140625 167.5234375 555.0755615234375 L 167.5234375 549.07958984375 Z" fill="#ed2061" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ryxbv5 =
    '<svg viewBox="135.9 0.0 37.8 37.8" ><path transform="translate(-24.65, 0.0)" d="M 198.366943359375 18.90656471252441 C 198.366943359375 29.3483829498291 189.9021911621094 37.81312942504883 179.4603576660156 37.81312942504883 C 169.02001953125 37.81312942504883 160.5552673339844 29.3483829498291 160.5552673339844 18.90656471252441 C 160.5552673339844 8.464748382568359 169.02001953125 0 179.4588928222656 0 C 189.9007110595703 0 198.3654479980469 8.464747428894043 198.3654479980469 18.90656471252441" fill="#f9d11f" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gs9q4 =
    '<svg viewBox="145.8 28.9 18.5 8.9" ><path transform="translate(-195.13, -499.82)" d="M 359.36962890625 535.1099243164062 L 354.8914184570312 530.6302490234375 C 352.31982421875 528.0584716796875 348.1502990722656 528.0584716796875 345.5787353515625 530.6302490234375 L 341.0916748046875 535.1202392578125 L 340.8870239257812 535.3248291015625 C 343.6633605957031 536.843017578125 346.7777709960938 537.636474609375 349.9421081542969 537.6317138671875 C 353.3780517578125 537.6317138671875 356.5961303710938 536.7086181640625 359.37109375 535.1099243164062" fill="#ff7e50" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nnltr =
    '<svg viewBox="148.1 12.2 13.5 13.5" ><path transform="translate(-235.36, -210.73)" d="M 396.8951110839844 229.6376800537109 C 396.8951110839844 233.3540649414062 393.8823852539062 236.3667907714844 390.166015625 236.3667907714844 C 386.4496459960938 236.3667907714844 383.4368896484375 233.3540649414062 383.4368896484375 229.6376800537109 C 383.4368896484375 225.9212951660156 386.4496459960938 222.9085693359375 390.166015625 222.9085693359375 C 393.8823852539062 222.9085693359375 396.8951110839844 225.9212951660156 396.8951110839844 229.6376800537109" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

class GameProcessBingoPageBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => TopicController());
  }
}