import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../business/home_page/widget/item_timeline_process.dart';
import '../res/colors.dart';
import '../utils/create_image.dart';

/// Skeleton list item.
class HashProcessItem extends StatelessWidget {
  /// Scrollable direction.
  final Axis direction;

  const HashProcessItem({
    Key? key,
    this.direction = Axis.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey _globalKey = new GlobalKey();
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textScheme = themeData.textTheme;
    final backgroundColor = themeData.colorScheme.surfaceVariant;
    final foregroundColor = themeData.colorScheme.surface;
    return SingleChildScrollView(child: TimelineProcessPage(),);
  }
}
