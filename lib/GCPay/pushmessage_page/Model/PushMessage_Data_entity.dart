import 'package:json_annotation/json_annotation.dart';

part 'PushMessage_Data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class PushMessageDataEntity {
  int? id;
  String? headline;
  String? content;
  String? remark;
  String? createDate;
  String? updateDate;
  int? status;

  PushMessageDataEntity(
    this.id,
    this.headline,
    this.content,
    this.remark,
    this.createDate,
    this.updateDate,
    this.status,
  );
  factory PushMessageDataEntity.fromJson(Map<String, dynamic> json) =>
      _$PushMessageDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PushMessageDataEntityToJson(this);
}
