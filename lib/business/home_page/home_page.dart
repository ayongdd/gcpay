import 'dart:convert';
import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:GCPay/adobexd/gameprocess_buy_page.dart';
import 'package:GCPay/adobexd/gameprocess_transfer_page.dart';
import 'package:GCPay/base/controller/base_controller.dart';
import 'package:GCPay/base/pageWidget/base_stateful_widget.dart';
import 'package:GCPay/business/home_page/childrenpage/rockpaperscissors_page.dart';
import 'package:GCPay/services/lang/localization_service.dart';
import 'package:GCPay/utils/log_utils.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';
import 'package:tab_container/tab_container.dart';

import '../../adobexd/game_help_page.dart';
import '../../adobexd/game_intro_page.dart';
import '../../adobexd/gameprocess_bingo_page.dart.dart';
import '../../adobexd/gameprocess_register_page.dart';
import '../../http/apiservice/gcpay_api.dart';
import '../../http/apiservice/haxi_api.dart';
import '../../services/cache_service.dart';
import 'childrenpage/hashniuniu_page.dart';
import 'childrenpage/luckybankerplayer_page.dart';
import 'childrenpage/luckyhash_page.dart';
import 'childrenpage/luckynumber_page.dart';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';

import 'model/BetAddressData.dart';

class HomePage extends BaseStatefulWidget<HomeController> {
  int _tabIndex = 0;
  int _listCount = 2;
  int _gridCount = 30;

  static final zh_CH = [
    'assets/images/hashbet/CH/homepage_banner1.png',
    'assets/images/hashbet/CH/homepage_banner2.png',
    'assets/images/hashbet/CH/homepage_banner3.png',
    'assets/images/hashbet/CH/homepage_banner4.png',
  ];

  static final en_US = [
    'assets/images/hashbet/EN/homepage_banner1.png',
    'assets/images/hashbet/EN/homepage_banner2.png',
    'assets/images/hashbet/EN/homepage_banner3.png',
    'assets/images/hashbet/EN/homepage_banner4.png',
  ];

  ///Image
  Widget _imageView(String image) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.all(
          Radius.circular(0.0),
        ),
      ),
    );
  }

  List<Widget> _getChildren4() => <Widget>[
        LuckyNumberPage(
          tagType: 'luckynumber',
        ),
        LuckyBankerPlayerPage(
          tagType: 'luckybankerplayer',
        ),
        HashNiuNiuPage(
          tagType: 'hashniuniu',
        ),
        LuckyHashPage(
          tagType: 'luckyhash',
        ),
        RockPaperScissorsPage(
          tagType: 'rockpaperscissors',
        ),
      ];

  List<String> _getTabs4() {
    return <String>[
      'luckynumber'.tr,
      'luckybankplayer'.tr,
      'hashniuniu'.tr,
      'luckyhash'.tr,
      'rockpaperscissors'.tr,
    ];
  }

  List<Widget> _getChildren3() => <Widget>[
        GameProcessRegisterPage(),
        GameProcessBuyPage(),
        GameProcessTransferPage(),
        GameProcessBingoPage(),
      ];

  List<String> _getTabs3() {
    return <String>[
      'gameprocess_register'.tr,
      'gameprocess_buy'.tr,
      'gameprocess_transfer'.tr,
      'gameprocess_bingo'.tr
    ];
  }

  @override
  bool showTitleBar() {
    // TODO: implement showTitleBar
    return false;
  }

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent

    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;
    final backgroundColor = colorScheme.surfaceVariant;
    final foregroundColor = colorScheme.surface;

    return Scaffold(
      primary: false,
      appBar: const EmptyAppBar(),
      body: ExtendedNestedScrollView(
        onlyOneScrollInBody: true,
        pinnedHeaderSliverHeightBuilder: () {
          return 0;
        },
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 240,
              pinned: false,
              backgroundColor: colorScheme.primary,
              flexibleSpace: FlexibleSpaceBar(
                background:
                    Obx(() => controller.cacheservice.rxLanguage.value == '1'
                        ? Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return Image.asset(
                                zh_CH[index],
                                fit: BoxFit.cover,
                              );
                            },
                            itemCount: 4,
                            autoplay: true,
                            pagination: SwiperPagination(),
                            //control: SwiperControl(),
                          )
                        : Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return Image.asset(
                                en_US[index],
                                fit: BoxFit.cover,
                              );
                            },
                            itemCount: 4,
                            autoplay: true,
                            pagination: SwiperPagination(),
                            //control: SwiperControl(),
                          )),
                centerTitle: false,
              ),
              bottom: PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                  ),
                  child: Material(
                    child: TabBar(
                      controller: controller.tabController,
                      labelColor: themeData.colorScheme.primary,
                      unselectedLabelColor:
                          themeData.colorScheme.surfaceVariant,
                      indicatorColor: themeData.colorScheme.primary,
                      labelPadding: EdgeInsets.symmetric(horizontal: 6.w),
                      indicatorWeight: 4.w,
                      indicatorPadding: EdgeInsets.symmetric(
                          vertical: 10.w, horizontal: 60.w),
                      onTap: (index) {
                        _tabIndex = index;
                      },
                      tabs: <Widget>[
                        Tab(
                          text: 'gameplay'.tr,
                        ),
                        Tab(
                          text: 'gameprocess'.tr,
                        ),
                        Tab(
                          text: 'gamecommon'.tr,
                        ),
                        Tab(
                          text: 'gameintroduce'.tr,
                        ),
                      ],
                    ),
                  ),
                ),
                preferredSize: const Size(double.infinity, 24.0),
              ),
            ),
          ];
        },
        body: Column(
          children: <Widget>[
            Expanded(
                child: TabBarView(
                    controller: controller.tabController,
                    children: <Widget>[
                  ExtendedVisibilityDetector(
                    uniqueKey: const Key('Tab0'),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TabContainer(
                          color: colorScheme.primary,
                          tabEdge: TabEdge.left,
                          tabStart: 0.10,
                          tabEnd: 0.7,
                          childPadding: const EdgeInsets.all(10.0),
                          children: _getChildren4(),
                          tabs: _getTabs4(),
                          selectedTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                          unselectedTextStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ExtendedVisibilityDetector(
                    uniqueKey: const Key('Tab1'),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.6,
                      padding: const EdgeInsets.all(5.0),
                      child: AspectRatio(
                        aspectRatio: 10 / 8,
                        child: TabContainer(
                          radius: 20,
                          tabEdge: TabEdge.top,
                          tabCurve: Curves.easeIn,
                          transitionBuilder: (child, animation) {
                            animation = CurvedAnimation(
                                curve: Curves.easeIn, parent: animation);
                            return SlideTransition(
                              position: Tween(
                                begin: const Offset(0.2, 0.0),
                                end: const Offset(0.0, 0.0),
                              ).animate(animation),
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                          color: colorScheme.secondaryContainer,
                          selectedTextStyle: textTheme.bodyText2?.copyWith(
                              color: colorScheme.primary, fontSize: 15.0),
                          unselectedTextStyle:
                              textTheme.bodyText2?.copyWith(fontSize: 12.0),
                          children: _getChildren3(),
                          tabs: _getTabs3(),
                        ),
                      ),
                    ),
                  ),
                  ExtendedVisibilityDetector(
                    uniqueKey: const Key('Tab2'),
                    child: EasyRefresh(
                      footer: ClassicFooter(
                        position: IndicatorPosition.locator,
                        dragText: 'Pull to load'.tr,
                        armedText: 'Release ready'.tr,
                        readyText: 'Loading...'.tr,
                        processingText: 'Loading...'.tr,
                        processedText: 'Succeeded'.tr,
                        noMoreText: 'No more'.tr,
                        failedText: 'Failed'.tr,
                        messageText: 'Last updated at %T'.tr,
                      ),
                      child: GameHelpPage(),
                    ),
                  ),
                  ExtendedVisibilityDetector(
                    uniqueKey: const Key('Tab3'),
                    child: EasyRefresh(
                      footer: ClassicFooter(
                        position: IndicatorPosition.locator,
                        dragText: 'Pull to load'.tr,
                        armedText: 'Release ready'.tr,
                        readyText: 'Loading...'.tr,
                        processingText: 'Loading...'.tr,
                        processedText: 'Succeeded'.tr,
                        noMoreText: 'No more'.tr,
                        failedText: 'Failed'.tr,
                        messageText: 'Last updated at %T'.tr,
                      ),
                      child: GameIntroPage(),
                    ),
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => const Size(0.0, 0.0);
}

class HomeController extends BaseController with GetTickerProviderStateMixin {
  final GCPayApi api;
  final CacheService cacheservice;

  HomeController(this.cacheservice, this.api);

  RxList<BetAddressData> betaddList = RxList<BetAddressData>();
  final List<String> tabList = ["幸运数字".tr, "幸运庄闲".tr, "哈希牛牛".tr, "幸运哈希".tr,];
  late TabController tabController;
  final PageController pagerController = PageController();
  final List<Widget> pagerList = [
    LuckyNumberPage(
      tagType: "luckynumber",
    ),
    LuckyBankerPlayerPage(
      tagType: "luckybankerplayer",
    ),
    HashNiuNiuPage(
      tagType: "hashniuniu",
    ),
    LuckyHashPage(
      tagType: "luckyhash",
    ),
    RockPaperScissorsPage(
      tagType: "rockpaperscissors",
    )
  ];

  @override
  void loadNet() {}

  @override
  void dispose() {}

  void onReady() {
    super.onReady();
    LogD("HomePage初始化onResume");
    tabController = TabController(length: tabList.length, vsync: this);
    betaddress();
    showSuccess();
  }

  Future<void> betaddress() async {
    try {
      var response;// = await api.getAccount();
      if (response.code == 401) {
        // Get.toNamed(Routes.LOGIN);
      }
      if (response.code == 200) {
        //return json.decode(response.body);
        List<BetAddressData>? betAddress = response.data;
        for (final betaddress in betAddress!) {
          if (betaddress != null) {
            betaddList.add(betaddress);
            if (betaddress.playId == 9) {
              cacheservice.saveExchangeTrc20Address(betaddress.address!);
            }
          }
        }
        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
      // var message = response.toString();
      //

      // log('${json.decode(response.body)}');
      // log('All ovens loaded successfully');
    } catch (err, _) {
      log('${err}');
      rethrow;
    }
  }

  getBetAddress() async {
    // make status to loading
    change(null, status: RxStatus.loading());
    log('loading betaddress success');
    // Code to get data
    await betaddress();
    log('load betaddress success');
    // if done, change status to success
    change(null, status: RxStatus.success());
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => HomeController(Get.put(CacheService()), Get.put(GCPayApi())));
  }
}
