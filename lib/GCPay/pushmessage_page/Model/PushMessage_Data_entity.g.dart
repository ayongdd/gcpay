// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PushMessage_Data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushMessageDataEntity _$PushMessageDataEntityFromJson(Map<String, dynamic> json) =>
    PushMessageDataEntity(
      json['id'] as int?,
      json['headline'] as String?,
      json['content'] as String?,
      json['remark'] as String?,
      json['createDate'] as String?,
      json['updateDate'] as String?,
      json['status'] as int?,
    );

Map<String, dynamic> _$PushMessageDataEntityToJson(PushMessageDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'headline': instance.headline,
      'content': instance.content,
      'remark': instance.remark,
      'createDate': instance.createDate,
      'updateDate': instance.updateDate,
      'status': instance.status,
    };
