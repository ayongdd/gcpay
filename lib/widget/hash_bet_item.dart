import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../res/colors.dart';
import '../utils/create_image.dart';

/// Skeleton list item.
class HashBetItem extends StatelessWidget {
  /// Scrollable direction.
  final Axis direction;

  const HashBetItem({
    Key? key,
    this.direction = Axis.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey _globalKey = new GlobalKey();
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textScheme = themeData.textTheme;
    final backgroundColor = colorScheme.surfaceVariant;
    final foregroundColor = colorScheme.surface;
    return Center(
        child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    margin: const EdgeInsets.all(10),
    child: Card(
        elevation: 0,
        color: backgroundColor,
        margin: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              children: [
                Container(
                  height: 55,
                  margin: EdgeInsets.only(
                      left: 15.0, right: 15, top: 15, bottom: 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '投注地址-请使用【去中心化钱包】投注 \nTLneRBe5xNr79JuuVKd9j4nEKsxt9Pkjsc',
                          style: textScheme.labelMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        child: Container(
                          height: 55,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: colorScheme.secondary,
                          ),
                          child: Image.asset(
                            'assets/images/menuicon/qrcode.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        onTap: () {
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      // title
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          icon: const Icon(
                                              Icons.close_rounded),
                                          tooltip: '',
                                          onPressed: () {
                                            SmartDialog.dismiss();
                                          },
                                        ),
                                      ),
                                      RepaintBoundary(
                                        key: _globalKey,
                                        child: Container(
                                          width: 250,
                                          height: 250,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                color: colorScheme.primary,
                                                width: 10,
                                              ),
                                              borderRadius:
                                              BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                          ),
                                          margin: EdgeInsets.all(0),
                                          child:Container(),
                                        ),
                                      ),
                                      Container(
                                        height: 55,
                                        margin: EdgeInsets.only(
                                            left: 15.0,
                                            right: 15,
                                            top: 15,
                                            bottom: 15),
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          color: ColorStyle.color_272B33,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        child: Row(
                                          children: [
                                            const Expanded(
                                              child: Text(
                                                '投注地址\nTLneRBe5xNr79JuuVKd9j4nEKsxt9Pkjsc',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            InkWell(
                                              child: Container(
                                                height: 55,
                                                width: 45,
                                                alignment: Alignment.center,
                                                decoration:
                                                const BoxDecoration(
                                                  color: ColorStyle
                                                      .color_121923,
                                                  borderRadius:
                                                  BorderRadius.only(
                                                      bottomRight:
                                                      Radius
                                                          .circular(
                                                          10.0),
                                                      topRight: Radius
                                                          .circular(
                                                          10.0)),
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xFFfcefd9),
                                                        Color(0xFFf9dba9)
                                                      ],
                                                      begin: Alignment
                                                          .topCenter,
                                                      end: Alignment
                                                          .bottomCenter),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/menuicon/copypaste.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ),
                                              onTap: () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                      // button (only method of close the dialog)
                                      ElevatedButton(
                                        onPressed: () async {
                                          final qrcodeImage =
                                          await createImageFromRepaintBoundary(
                                              _globalKey);
                                          requestPermission();
                                          if (qrcodeImage != null) {
                                            final result =
                                            await ImageGallerySaver
                                                .saveImage(qrcodeImage);
                                            bool resultMap = result['isSuccess'];
                                            if(resultMap)
                                            {
                                              SmartDialog.showToast('savegallery'.tr);
                                            }

                                          }
                                          SmartDialog.dismiss();
                                        },
                                        child: Text('保存至相册'),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      InkWell(
                        child: Container(
                          height: 55,
                          width: 45,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)),
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xFFfcefd9),
                                  Color(0xFFf9dba9)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                          ),
                          child: Image.asset(
                            'assets/images/menuicon/copypaste.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 180,
                  margin: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/hashbet/game_lucky_luckynumber.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  margin: EdgeInsets.only(
                      left: 15.0, right: 15, top: 0, bottom: 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '  赔率:1赔1.95 转账限额:10-5000 USDT 100-50000 TRX\n低于限额平台扣除，高于限额扣除千1手续费返回\n转账整数部分参与抽奖，小数扣除，此游戏投注不返佣',
                        style: textScheme.labelMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(
                      left: 15.0, right: 15, top: 15, bottom: 0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: ColorStyle.color_272B33,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/hashbet/video_luckynumber.jpg"),
                        fit: BoxFit.fill,
                      )),
                  child: Row(
                    children: [],
                  ),
                ),
                Container(
                  height: 220,
                  margin: const EdgeInsets.only(
                      left: 15.0, right: 15, top: 15, bottom: 0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 200,
                        width: 160,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Column(
                          children: [
                            Container(height: 10),
                            const Text(
                              '示例一',
                              style: TextStyle(
                                  color: ColorStyle.color_EEB081,
                                  fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 0, top: 10, bottom: 0),
                              child: Text(
                                '您的转账金额为：1001\n该笔转账的区块哈希为：000*****9e\n区块哈希值最后两位3a为“数字+字母”组合\n结果中奖系统汇款金额为：\n1001*2.00=2002.00',
                                style: textScheme.labelMedium,
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 160,
                        width: 15,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(),
                      ),
                      Container(
                        height: 200,
                        width: 160,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Column(
                          children: [
                            Container(height: 10),
                            const Text(
                              '示例二',
                              style: TextStyle(
                                  color: ColorStyle.color_EEB081,
                                  fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10,
                                  top: 10,
                                  bottom: 0),
                              child: Text(
                                '您的转账金额为：1051\n该笔转账的区块哈希为：000*****ad\n区块哈希值最后两位3a为“字母+字母”组合\n结果未中奖不返还数字币',
                                style: textScheme.labelMedium,
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      )));
  }
}
