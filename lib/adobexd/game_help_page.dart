import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class GameHelpPage extends StatefulWidget {
  GameHelpPage({
    Key? key,
  }) : super(key: key);

  @override
  _GameHelpPageState createState() => _GameHelpPageState();
}

class _GameHelpPageState extends State<GameHelpPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final textScheme = theme.textTheme;
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 15.0,bottom: 10.0),
              child: ReadMoreText(
                'whatishashblock'.tr,
                trimLines: 2,
                style: textScheme.bodyMedium?.copyWith(color: colorScheme.primary),
                colorClickableText: colorScheme.primary,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Expand'.tr,
                trimExpandedText: 'Collapse'.tr,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 5.0),
              child: ReadMoreText(
                'whatishashblockanswer'.tr,
                trimLines: 2,
                style: textScheme.bodySmall,
                colorClickableText: colorScheme.primary,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Expand'.tr,
                trimExpandedText: 'Collapse'.tr,
              ),
            ),
            Divider(
              color: colorScheme.primary,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ReadMoreText(
                'whatisblockchain'.tr,
                trimLines: 3,
                style: textScheme.bodyMedium?.copyWith(color: colorScheme.primary),
                colorClickableText: colorScheme.primary,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Expand'.tr,
                trimExpandedText: 'Collapse'.tr,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 5.0),
              child: ReadMoreText(
                'whatisblockchainanswer'.tr,
                trimLines: 2,
                style: textScheme.bodySmall,
                colorClickableText: colorScheme.primary,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Expand'.tr,
                trimExpandedText: 'Collapse'.tr,
              ),
            ),
            Divider(
              color: colorScheme.primary,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ReadMoreText(
                'whatisdecentralwallet'.tr,
                trimLines: 3,
                style: textScheme.bodyMedium?.copyWith(color: colorScheme.primary),
                colorClickableText: colorScheme.primary,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Expand'.tr,
                trimExpandedText: 'Collapse'.tr,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 5.0),
              child: ReadMoreText(
                'whatisdecentralwalletanswer'.tr,
                trimLines: 2,
                style: textScheme.bodySmall,
                colorClickableText: colorScheme.primary,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Expand'.tr,
                trimExpandedText: 'Collapse'.tr,
              ),
            ),
            Divider(
              color: colorScheme.primary,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ReadMoreText(
                'whybingo'.tr,
                trimLines: 3,
                style: textScheme.bodyMedium?.copyWith(color: colorScheme.primary),
                colorClickableText: colorScheme.primary,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Expand'.tr,
                trimExpandedText: 'Collapse'.tr,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 5.0),
              child: ReadMoreText(
                'whybingoanswer'.tr,
                trimLines: 2,
                style:textScheme.bodySmall,
                colorClickableText: colorScheme.primary,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Expand'.tr,
                trimExpandedText: 'Collapse'.tr,
              ),
            ),
            Divider(
              color: colorScheme.primary,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ReadMoreText(
                'whydelay'.tr,
                trimLines: 3,
                style: textScheme.bodyMedium?.copyWith(color: colorScheme.primary),
                colorClickableText: colorScheme.primary,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Expand'.tr,
                trimExpandedText: 'Collapse'.tr,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 5.0),
              child: ReadMoreText(
                'whydelayanswer'.tr,
                trimLines: 2,
                style: textScheme.bodySmall,
                colorClickableText: colorScheme.primary,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Expand'.tr,
                trimExpandedText: 'Collapse'.tr,
              ),
            ),
            Divider(
              color: colorScheme.primary,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ReadMoreText(
                'chainoptions'.tr,
                trimLines: 3,
                style: textScheme.bodyMedium?.copyWith(color: colorScheme.primary),
                colorClickableText: colorScheme.primary,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Expand'.tr,
                trimExpandedText: 'Collapse'.tr,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 5.0),
              child: ReadMoreText(
                'chainoptionsanswer'.tr,
                trimLines: 2,
                style: textScheme.bodySmall,
                colorClickableText: colorScheme.primary,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Expand'.tr,
                trimExpandedText: 'Collapse'.tr,
              ),
            ),
            Divider(
              color: colorScheme.primary,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ReadMoreText(
                'wrongtransfer'.tr,
                trimLines: 3,
                style: textScheme.bodyMedium?.copyWith(color: colorScheme.primary),
                colorClickableText: colorScheme.primary,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Expand'.tr,
                trimExpandedText: 'Collapse'.tr,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 0.0,bottom: 5.0),
              child: ReadMoreText(
                'wrongtransferanswer'.tr,
                trimLines: 2,
                style: textScheme.bodySmall,
                colorClickableText: colorScheme.primary,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Expand'.tr,
                trimExpandedText: 'Collapse'.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }


}

