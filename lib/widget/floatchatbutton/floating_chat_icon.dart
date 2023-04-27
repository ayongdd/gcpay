import 'package:GCPay/utils/lib_navigator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloatingChatIcon extends StatelessWidget {
  final Function(BuildContext)? onTap;
  final bool isTop;
  final bool isRight;
  final String? message;
  final bool shouldShowMessage;
  final bool shouldPutWidgetInCircle;
  final Widget? chatIconWidget;
  final Color? chatIconColor;
  final Color? chatIconBackgroundColor;
  final double? chatIconSize;
  final double? chatIconWidgetHeight;
  final double? chatIconWidgetWidth;
  final Color chatIconBorderColor;
  final double chatIconBorderWidth;
  final Duration? messageCrossFadeTime;
  final double messageVerticalSpacing;
  final Widget? messageWidget;
  final Color? messageBackgroundColor;
  final TextStyle? messageTextStyle;
  final Widget? messageTextWidget;
  final double messageMaxWidth;
  final double? messageBorderWidth;
  final Color? messageBorderColor;

  FloatingChatIcon({
    this.onTap,
    required this.isTop,
    required this.isRight,
    this.message,
    this.shouldShowMessage = false,
    this.shouldPutWidgetInCircle = true,
    this.chatIconWidget,
    this.chatIconColor,
    this.chatIconBackgroundColor,
    this.chatIconSize,
    this.chatIconWidgetHeight,
    this.chatIconWidgetWidth,
    required this.chatIconBorderColor,
    required this.chatIconBorderWidth,
    this.messageCrossFadeTime,
    this.messageVerticalSpacing = 10,
    this.messageWidget,
    this.messageBackgroundColor,
    this.messageTextStyle,
    this.messageTextWidget,
    this.messageBorderWidth,
    this.messageBorderColor,
    required this.messageMaxWidth,
  })  : assert(chatIconWidget == null ||
            (chatIconSize == null &&
                chatIconWidgetHeight == null &&
                chatIconWidgetWidth == null)),
        assert(messageWidget == null ||
            (messageBackgroundColor == null && messageTextWidget == null)),
        assert(messageTextWidget == null || (messageTextStyle == null));

  static const double defaultChatWidgetImageWidth = 160;
  static const double defaultChatWidgetImageHeight = 80;
  static const double defaultChatIconSize = 20;
  static const int defaultMessageCrossFadeTimeMilliseconds = 250;
  static const double messageBorderRadius = 10;
  static const double messageTextSize = 20;
  static const double messageTextPadding = 10;

  Widget _getChatWidgetImage(BuildContext context) {
    if (chatIconWidget != null) {
      return chatIconWidget!;
    } else {
      return Container(height: 20,width: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 3,
            backgroundColor: const Color(0xffe2b443),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)),
            //////// HERE
          ),
          onPressed: () {
            if (onTap != null) {
              onTap!(context);
            }
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(
            "immediateprocessing".tr,
            style: TextStyle(
              fontFamily: 'Helvetica Neue',
              fontSize: 12,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w500,
            ),
          ), const Icon(size:16,FontAwesomeIcons.caretRight)],) ),);
    }
  }

  Widget _getChatCircleWidget(BuildContext context) {
    if (shouldPutWidgetInCircle) {
      return Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
                color: chatIconBorderColor, width: chatIconBorderWidth)),
        color: chatIconBackgroundColor ?? Colors.blue,
        child: InkWell(
            child: Container(
              height: 40,
              width: 120,
              margin: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '您的订单有新状态',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 12,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  _getChatWidgetImage(context)
                ],
              ),
            ),
            onTap: () {
              if (onTap != null) {
                onTap!(context);
              }
            }),
      );
    } else {
      return _getChatWidgetImage(context);
    }
  }

  Widget _getMessageAnimatedSwitcher(BuildContext context) {
    return AnimatedSwitcher(
      duration: messageCrossFadeTime ??
          const Duration(milliseconds: defaultMessageCrossFadeTimeMilliseconds),
      child: shouldShowMessage
          ? Padding(
              padding: EdgeInsets.fromLTRB(
                  0,
                  ((isTop) ? messageVerticalSpacing : 0),
                  0,
                  ((isTop) ? 0 : messageVerticalSpacing)),
              child: _getMessageWidget())
          : const SizedBox.shrink(),
    );
  }

  Widget _getMessageWidget() {
    Widget? unboundMessageWidget;
    if (messageWidget == null && messageTextWidget == null && message == null) {
      return Container();
    }
    if (messageWidget != null) {
      unboundMessageWidget = messageWidget!;
    } else {
      unboundMessageWidget = Container(
        decoration: BoxDecoration(
            color: messageBackgroundColor ?? Colors.blue,
            borderRadius:
                const BorderRadius.all(Radius.circular(messageBorderRadius)),
            border: (messageBorderWidth == null)
                ? null
                : Border.all(
                    color: messageBorderColor ?? Colors.white,
                    width: messageBorderWidth!)),
        child: Padding(
          padding: const EdgeInsets.all(messageTextPadding),
          child: messageTextWidget ??
              Text(
                message ?? "",
                style: messageTextStyle ??
                    const TextStyle(
                        fontSize: messageTextSize, color: Colors.white),
              ),
        ),
      );
    }
    return Material(
      type: MaterialType.transparency,
      child: Container(
        constraints: BoxConstraints(maxWidth: messageMaxWidth),
        child: unboundMessageWidget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          (isRight ? CrossAxisAlignment.end : CrossAxisAlignment.start),
      children: [
        if (!isTop) _getMessageAnimatedSwitcher(context),
        _getChatCircleWidget(context),
        if (isTop) _getMessageAnimatedSwitcher(context),
      ],
    );
  }
}
