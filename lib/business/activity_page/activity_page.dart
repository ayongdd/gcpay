import 'package:GCPay/widget/skeleton_item.dart';
import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';

import '../../base/controller/base_controller.dart';
import '../../base/pageWidget/base_stateful_widget.dart';
import '../../routes/app_routes.dart';
import '../../services/cache_service.dart';
import 'activity_detail_page.dart';

class ActivityPage extends BaseStatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    throw UnimplementedError();
  }
}

class _ActivityPageState extends State<ActivityPage> {
  int _count = 3;
  late EasyRefreshController _controller;
  late CacheService cacheservice;

  @override
  void initState() {
    super.initState();
    cacheservice = Get.find<CacheService>();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final backgroundColor = themeData.colorScheme.surfaceVariant;
    final foregroundColor = themeData.colorScheme.surface;
    return Scaffold(
      appBar: AppBar(
        title: Text('activity'.tr),
      ),
      body: EasyRefresh(
        controller: _controller,
        header: ClassicHeader(
          dragText: 'Pull to refresh'.tr,
          armedText: 'Release ready'.tr,
          readyText: 'Refreshing...'.tr,
          processingText: 'Refreshing...'.tr,
          processedText: 'Succeeded'.tr,
          noMoreText: 'No more'.tr,
          failedText: 'Failed'.tr,
          messageText: 'Last updated at %T'.tr,
          safeArea: false,
        ),
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
        refreshOnStart: false,
        refreshOnStartHeader: BuilderHeader(
          triggerOffset: 70,
          clamping: true,
          position: IndicatorPosition.above,
          processedDuration: Duration.zero,
          builder: (ctx, state) {
            if (state.mode == IndicatorMode.inactive ||
                state.mode == IndicatorMode.done) {
              return const SizedBox();
            }
            return Container(
              padding: const EdgeInsets.only(bottom: 100),
              width: double.infinity,
              height: state.viewportDimension,
              alignment: Alignment.center,
            );
          },
        ),
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
          if (!mounted) {
            return;
          }
          setState(() {
            _count = 3;
          });
          _controller.finishRefresh();
          _controller.resetFooter();
        },
        onLoad: () async {
          await Future.delayed(const Duration(seconds: 2));
          if (!mounted) {
            return;
          }
          setState(() {
            _count = 3;
          });
          _controller.finishLoad(
              _count >= 3 ? IndicatorResult.noMore : IndicatorResult.success);
        },
        child: CustomScrollView(
          slivers: [
            Obx(() => cacheservice.rxLanguage.value == '1'
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return InkWell(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: 4, bottom: 4),
                            child: Card(
                              elevation: 0,
                              color: backgroundColor,
                              child: Container(
                                height: 150,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/hashbet/CH/activity_banner" +
                                            (index + 1).toString() +
                                            ".jpg"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Get.toNamed(AppRoutes.ActivityDetailPage,
                                arguments: (index + 1).toString());
                          },
                        );
                      },
                      childCount: _count,
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return InkWell(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: 4, bottom: 4),
                            child: Card(
                              elevation: 0,
                              color: backgroundColor,
                              child: Container(
                                height: 150,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/hashbet/EN/activity_banner" +
                                            (index + 1).toString() +
                                            ".jpg"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Get.toNamed(AppRoutes.ActivityDetailPage,
                                arguments: (index + 1).toString());
                          },
                        );
                      },
                      childCount: _count,
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}

class ActivityController extends BaseController {
  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
  }
}

class ActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityController());
  }
}
