import 'package:json_annotation/json_annotation.dart';

part 'SiteInfo_Data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SiteInfoDataEntity {
  int? id;
  String? headline;
  String? content;
  String? remark;
  String? createDate;
  String? updateDate;
  int? status;

  SiteInfoDataEntity(
    this.id,
    this.headline,
    this.content,
    this.remark,
    this.createDate,
    this.updateDate,
    this.status,
  );
  factory SiteInfoDataEntity.fromJson(Map<String, dynamic> json) =>
      _$SiteInfoDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SiteInfoDataEntityToJson(this);
}
