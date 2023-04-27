import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tobias/tobias.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../routes/app_routes.dart';
import '../../services/cache_service.dart';
import '../../services/lang/localization_service.dart';
import '../../utils/permission_handle.dart';
import 'models/models.dart';
import 'db_service.dart';
import 'extensions.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({
    super.key,
  });

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('scannerqrcode'.tr),
      ),
      body:Stack(
        children: <Widget>[

          ReaderWidget(
            onScan: (CodeResult result) async {
              addCode(result);
            },
          ),

          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
                heroTag: UniqueKey(),
                onPressed: getImage,
                backgroundColor: Colors.black26,
                child: Icon(FontAwesomeIcons.image)),
          ),
        ],
      ),
      /*
      FloatingActionButton(
        heroTag: UniqueKey(),
        onPressed: pickImage,
        child: const Icon(FontAwesomeIcons.image),
      ),
      */
    );
  }

  Future getImage() async {
    if (Platform.isIOS) {
      bool result = await permissionCheckAndRequest(
        Get.context!,
        Permission.photos,
        "相册",
      );
      if (!result) {
        return;
      };
    }
    else if(Platform.isAndroid)
    {
      bool result = await permissionCheckAndRequest(
        Get.context!,
        Permission.storage,
        "相册",
      );
      if (!result) {
        return;
      };
    }
    try {
      final currentLocale = await LocalizationService().getCurrentLocale();
      Language currentLanguage = Language.System;
      CacheService cacheService = Get.find<CacheService>();
      if(cacheService.rxLanguage.value == '1')
      {
        currentLanguage = Language.Chinese;
      }
      else
      {
        currentLanguage = Language.English;
      }
      List<Media>? res = await ImagesPicker.pick(
        count: 1,
        pickType: PickType.image,
        // when cropOpt isn't null, crop is enabled
        cropOpt: CropOption(
          aspectRatio: CropAspectRatio.custom,
          cropType: CropType.rect, // currently for android
        ),
        language:currentLanguage,
      );
      if (res != null&& res.length >0) {
        readCodeFromImage(res[0].path);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  Future<void> readCodeFromImage(String filePath) async {
    final CodeResult? result = await readBarcodeImagePathString(filePath);
    if (result != null && result.isValidBool) {
      addCode(result);
    } else {
      if (!mounted) {
        return;
      }
      context.showToast('No code found');
    }
  }

  Future<void> addCode(CodeResult result) async {
    final Code code = Code.fromCodeResult(result);
    DbService.instance.addCode(code);
    String strCode = code.text!;
    if(strCode.contains('GC'))
      {
        var ret = await Get.toNamed(AppRoutes.OrderPayPage,parameters: {'id':strCode});
        if(ret!=null)
          {
            if(ret)
              {
                Get.back();
              }
          }
      }
    else if(strCode.contains('alipay')||strCode.contains('ALIPAY'))
      {
        /// 支付宝支付
        void toAliPay(orderInfo) async {
          //检测是否安装支付宝
          var result = await isAliPayInstalled();
          if(result){
            String strQrcode = 'alipayqr://platformapi/startapp?saId=10000007&qrcode='+strCode;
            Uri alipayUri =Uri.parse(strQrcode);
            if (!await launchUrl(alipayUri)) {
              throw 'Could not launch $strCode';
            }
            /*
            var payResult = await aliPay(orderInfo);

            if (payResult['result'] != null) {
              if (payResult['resultStatus'] == '9000') {
                Fluttertoast.showToast(msg: "支付宝支付成功");
                Get.back(result: true);
              } else if (payResult['resultStatus'] == '6001') {
                Fluttertoast.showToast(msg:"支付宝支付失败");
              } else {
                Fluttertoast.showToast(msg:"未知错误");
              }
            }
            */

          } else {
            Fluttertoast.showToast(msg:"未安装支付宝");
          }
        }
      }
  }
}
