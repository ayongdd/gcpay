import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_feedback_entity.g.dart';

@JsonSerializable()
class MyFeedbackEntity {
  MyFeedbackEntity({
    this.id,
    this.type,
    this.content,
    this.contentType,
    this.questionTime,
  });

  int? id;
  int? type;
  String? content;
  int? contentType;
  String? questionTime;

  factory MyFeedbackEntity.fromJson(Map<String, dynamic> json) =>
      _$MyFeedbackEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MyFeedbackEntityToJson(this);

  String getContentTypeString() {
    if (type == 0) {
      return "Feature suggestion".tr;
    } else if (type == 1) {
      return "Abnormal function".tr;
    } else {
      return "other feedback".tr;
    }
  }

  String getDateString() {
    var split = questionTime?.split("T");
    if (split != null) {
      return split[0];
    } else {
      return "";
    }
  }
}
