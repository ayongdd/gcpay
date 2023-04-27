import 'package:json_annotation/json_annotation.dart';

part 'UploadPaymentPic_Data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class UploadPaymentPicDataEntity {
  int? id;
  String? name;
  String? path;
  String? mime;
  int? size;
  String? md5;
  String? sha1;
  int? createDate;
  String? url;

  UploadPaymentPicDataEntity(
      this.id,
      this.name,
      this.path,
      this.mime,
      this.size,
      this.md5,
      this.sha1,
      this.createDate,
      this.url,
  );


  factory UploadPaymentPicDataEntity.fromJson(Map<String, dynamic> json) =>
      _$UploadPaymentPicDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UploadPaymentPicDataEntityToJson(this);
}
