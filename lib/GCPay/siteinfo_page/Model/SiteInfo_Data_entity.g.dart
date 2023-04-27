// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SiteInfo_Data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteInfoDataEntity _$SiteInfoDataEntityFromJson(Map<String, dynamic> json) =>
    SiteInfoDataEntity(
      json['id'] as int?,
      json['headline'] as String?,
      json['content'] as String?,
      json['remark'] as String?,
      json['createDate'] as String?,
      json['updateDate'] as String?,
      json['status'] as int?,
    );

Map<String, dynamic> _$SiteInfoDataEntityToJson(SiteInfoDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'headline': instance.headline,
      'content': instance.content,
      'remark': instance.remark,
      'createDate': instance.createDate,
      'updateDate': instance.updateDate,
      'status': instance.status,
    };
