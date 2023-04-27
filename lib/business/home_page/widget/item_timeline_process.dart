import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GCPay/res/colors.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../res/style.dart';

const kTileHeight = 50.0;

class TimelineProcessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = _data(0);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        margin: const EdgeInsets.all(10),
        child: Card(
          margin: EdgeInsets.all(0.0),
          color: colorScheme.surfaceVariant,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _DeliveryProcesses(processes: data.deliveryProcesses),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, bottom: 20, top: 0),
                child: _OnTimeBar(driver: data.driverInfo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrderTitle extends StatelessWidget {
  const _OrderTitle({
    Key? key,
    required this.orderInfo,
  }) : super(key: key);

  final _OrderInfo orderInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Delivery #${orderInfo.id}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text(
          '${orderInfo.date.day}/${orderInfo.date.month}/${orderInfo.date.year}',
          style: TextStyle(
            color: Color(0xffb6b2b2),
          ),
        ),
      ],
    );
  }
}

class _InnerTimeline extends StatelessWidget {
  const _InnerTimeline({
    required this.messages,
  });

  final List<_DeliveryMessage> messages;

  String getShortCutString(String strAddress) {
    String newStartStr = strAddress.substring(0, 5);
    String newEndStr =
        strAddress.substring(strAddress.length - 5, strAddress.length);
    return newStartStr + '......' + newEndStr;
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textScheme = themeData.textTheme;

    bool isEdgeIndex(int index) {
      return index == 0 || index == messages.length + 1;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
      child: FixedTimeline.tileBuilder(
        theme: TimelineTheme.of(context).copyWith(
          nodePosition: 0,
          connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
                thickness: 1.0,
              ),
          indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
                size: 10.0,
                position: 0.5,
              ),
        ),
        builder: TimelineTileBuilder(
          contentsBuilder: (_, index) {
            if (isEdgeIndex(index)) {
              return null;
            }
            if (messages[index - 1].type == '1') {
              return Padding(
                  padding: EdgeInsets.only(left: 0.0, top: 2, bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        messages[index - 1].iconPath(),
                        height: 60,
                      ),
                      InkWell(
                          child: Text(
                            messages[index - 1].name,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () =>
                              launchUrl(Uri.parse(messages[index - 1].url))),
                      Container(
                        height: 30,
                        child: OutlinedButton(
                          child: Text(
                            'tutorial'.tr,
                            style: TextStyle(color: ColorStyle.color_EEB081),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: 1.0, color: ColorStyle.color_EEB081),
                          ),
                          onPressed: () {
                            print('Pressed');
                          },
                        ),
                      )
                    ],
                  ));
            } else if (messages[index - 1].type == '2') {
              return Padding(
                  padding: EdgeInsets.only(left: 0.0, top: 0, bottom: 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            messages[index - 1].icon,
                            style: textScheme.subtitle2,
                          ),
                          Text(getShortCutString(messages[index - 1].name)),
                          Container(
                            height: 30,
                            child: OutlinedButton(
                              child: Text(
                                'tutorial'.tr,
                                style:
                                    TextStyle(color: ColorStyle.color_EEB081),
                              ),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    width: 1.0, color: ColorStyle.color_EEB081),
                              ),
                              onPressed: () {
                                print('Pressed');
                              },
                            ),
                          )
                        ],
                      ),
                      DividerStyle.divider1Half,
                    ],
                  ));
            }
          },
          itemExtentBuilder: (_, index) => isEdgeIndex(index) ? 10.0 : 35.0,
          nodeItemOverlapBuilder: (_, index) =>
              isEdgeIndex(index) ? true : null,
          itemCount: messages.length + 2,
        ),
      ),
    );
  }
}

class _DeliveryProcesses extends StatelessWidget {
  const _DeliveryProcesses({Key? key, required this.processes})
      : super(key: key);

  final List<_DeliveryProcess> processes;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textScheme = themeData.textTheme;
    return DefaultTextStyle(
      style: TextStyle(
        color: Color(0xff9b9b9b),
        fontSize: 12.5,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
        child: FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: Color(0xFFEEB081),
            indicatorTheme: const IndicatorThemeData(
              position: 0,
              size: 25.0,
            ),
            connectorTheme: const ConnectorThemeData(
              thickness: 0.8,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: processes.length,
            contentsBuilder: (_, index) {
              if (processes[index].isCompleted) {
                return Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Winning money back'.tr,
                        style: textScheme.titleMedium
                      ),
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          processes[index].name,
                          style: textScheme.titleMedium,
                        ),
                      ),
                      _InnerTimeline(messages: processes[index].messages),
                    ],
                  ),
                );
              }
            },
            indicatorBuilder: (_, index) {
              int intIndex = index + 1;
              return OutlinedDotIndicator(
                backgroundColor: Color(0xFFEEB081),
                borderWidth: 2.5,
                size: 30.0,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    intIndex.toString(),
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              );
            },
            connectorBuilder: (_, index, ___) => SolidLineConnector(
              color: processes[index].isCompleted
                  ? Color(0xFFEEB081)
                  : Color(0xFFEEB081),
            ),
          ),
        ),
      ),
    );
  }
}

class _OnTimeBar extends StatelessWidget {
  const _OnTimeBar({Key? key, required this.driver}) : super(key: key);

  final _DriverInfo driver;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 640,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        image: DecorationImage(
          image: AssetImage("assets/images/hashbet/progress_completebg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'return money'.tr,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Image.asset(
                'assets/images/hashbet/progress_complete10seconds.png',
                width: 90,
                height: 20,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'You can check the hash value on the official website of TRON'.tr,
                style: TextStyle(color: Colors.white, fontSize: 16),
                maxLines: 2,
              ),
              InkWell(
                  child: Text(
                    'tronscan.org',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: ColorStyle.color_EEB081
                    ),
                  ),
                  onTap: () =>
                      launchUrl(Uri.parse('https://tronscan.org/'))),
            ],
          )
        ],
      ),
    );
  }
}

_OrderInfo _data(int id) => _OrderInfo(
      id: id,
      date: DateTime.now(),
      driverInfo: const _DriverInfo(
        name: 'Philipe',
        thumbnailUrl:
            'https://i.pinimg.com/originals/08/45/81/084581e3155d339376bf1d0e17979dc6.jpg',
      ),
      deliveryProcesses: [
        const _DeliveryProcess(
          '注册钱包',
          messages: [
            _DeliveryMessage('platform_trustwallet.png', 'trustwallet.com',
                'https://www.trustwallet.com/', '1', '1'),
            _DeliveryMessage('platform_imtoken.png', 'token.im',
                'https://www.token.im/', '2', '1'),
            _DeliveryMessage('platform_ownbit.png', 'ownbit.io',
                'https://www.ownbit.io/', '3', '1'),
            _DeliveryMessage('platform_tronlink.png', 'tronlink.org',
                'https://www.tronlink.org/', '4', '1'),
            _DeliveryMessage('platform_bitpie.png', 'bitpie.com',
                'https://www.bitpie.com/', '5', '1'),
            _DeliveryMessage('platform_tokenpocket.png', 'tokenpocket.pro',
                'https://www.tokenpocket.pro/', '6', '1'),
          ],
        ),
        const _DeliveryProcess(
          '购买虚拟货币',
          messages: [
            _DeliveryMessage('platform_binance.png', 'binance.com',
                'https://www.binance.com/', '1', '1'),
            _DeliveryMessage('platform_okex.png', 'okx.com',
                'https://www.okx.com/', '2', '1'),
            _DeliveryMessage('platform_huobi.png', 'huobi.com',
                'https://www.huobi.com/', '3', '1'),
            _DeliveryMessage('platform_gate.png', 'gate.io',
                'https://www.gate.io/', '4', '1'),
            _DeliveryMessage('platform_bitpie.png', 'bitpie',
                'https://bitpie.com/', '5', '1'),
            _DeliveryMessage(
                'platform_zb.png', 'zb.com', 'https://www.zb.com/', '6', '1'),
          ],
        ),
        const _DeliveryProcess(
          '转账抽奖',
          messages: [
            _DeliveryMessage('幸运数字', 'TLneRBe5xNr79JuuVKd9j4nEKsxt9Pkjsc',
                'https://trustwallet.com/', '1', '2'),
            _DeliveryMessage('幸运庄闲', 'TXW7UNgbRdntaJKCMR4swGEdL9GCidWwWr',
                'https://token.im/', '2', '2'),
            _DeliveryMessage('哈希牛牛', 'TSRFE6vCH5LBeNtSHa3wLKBEmNR3NHebbb',
                'https://ownbit.io/', '3', '2'),
            _DeliveryMessage('幸运哈希', 'TY2ykukyZe7R2uCsNQqAa9thXmMG7wNHdi',
                'https://www.tronlink.org/', '4', '2'),
          ],
        ),
        _DeliveryProcess.complete(),
      ],
    );

class _OrderInfo {
  const _OrderInfo({
    required this.id,
    required this.date,
    required this.driverInfo,
    required this.deliveryProcesses,
  });

  final int id;
  final DateTime date;
  final _DriverInfo driverInfo;
  final List<_DeliveryProcess> deliveryProcesses;
}

class _DriverInfo {
  const _DriverInfo({
    required this.name,
    required this.thumbnailUrl,
  });

  final String name;
  final String thumbnailUrl;
}

class _DeliveryProcess {
  const _DeliveryProcess(
    this.name, {
    this.messages = const [],
  });

  const _DeliveryProcess.complete()
      : this.name = 'Done',
        this.messages = const [];

  final String name;
  final List<_DeliveryMessage> messages;

  bool get isCompleted => name == 'Done';
}

class _DeliveryMessage {
  const _DeliveryMessage(this.icon, this.name, this.url, this.tag, this.type);
  final String icon;
  final String name;
  final String url;
  final String tag;
  final String type;
  @override
  String toString() {
    return '$icon $url';
  }

  @override
  String iconPath() {
    return 'assets/images/hashbet/wallet/$icon';
  }
}
