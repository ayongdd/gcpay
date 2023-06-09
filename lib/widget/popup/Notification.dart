import 'Camera.dart';
import 'popup.dart';

/// ![](https://raw.githubusercontent.com/jaweii/Flutter_beautiful_popup/master/img/bg/notification.png)
class TemplateNotification extends TemplateCamera {
  final BeautifulPopup options;
  TemplateNotification(this.options) : super(options);

  @override
  final illustrationPath = 'assets/images/popbk/notification.png';
}
