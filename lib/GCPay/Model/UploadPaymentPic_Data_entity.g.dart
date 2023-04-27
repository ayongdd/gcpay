// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UploadPaymentPic_Data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadPaymentPicDataEntity _$UploadPaymentPicDataEntityFromJson(
        Map<String, dynamic> json) =>
    UploadPaymentPicDataEntity(
      json['id'] as int?,
      json['name'] as String?,
      json['path'] as String?,
      json['mime'] as String?,
      json['size'] as int?,
      json['md5'] as String?,
      json['sha1'] as String?,
      json['createDate'] as int?,
      json['url'] as String?
    );

Map<String, dynamic> _$UploadPaymentPicDataEntityToJson(
        UploadPaymentPicDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'mime': instance.mime,
      'size': instance.size,
      'md5': instance.md5,
      'sha1': instance.sha1,
      'createDate': instance.createDate,
      'url': instance.url,
    };
