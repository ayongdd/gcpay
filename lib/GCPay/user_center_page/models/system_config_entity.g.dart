// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_config_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

system_config_entity _$system_config_entityFromJson(
        Map<String, dynamic> json) =>
    system_config_entity(
      App.fromJson(json['app'] as Map<String, dynamic>),
      json['serviceLink'] as String?,
      json['downloadLink'] as String?,
          json['helpLink'] as String?,
          json['bankList'] as String?,
          json['domain'] as String?,
      json['iosVersion'] as String?,
      json['androidVersion'] as String?,
    );

Map<String, dynamic> _$system_config_entityToJson(
        system_config_entity instance) =>
    <String, dynamic>{
      'app': instance.app,
      'serviceLink': instance.serviceLink,
      'downloadLink': instance.downloadLink,
          'helpLink': instance.serviceLink,
          'bankList': instance.serviceLink,
          'domain': instance.serviceLink,
      'iosVersion': instance.iosVersion,
      'androidVersion': instance.androidVersion,
    };

App _$AppFromJson(Map<String, dynamic> json) => App(
      json['id'] as int?,
      json['headline'] as String?,
      json['type'] as int?,
      json['content'] as String?,
      json['remark'] as String?,
      json['createDate'] as String?,
      json['updateDate'] as String?,
      json['status'] as int,
    );

Map<String, dynamic> _$AppToJson(App instance) => <String, dynamic>{
      'id': instance.id,
      'headline': instance.headline,
      'type': instance.type,
      'content': instance.content,
      'remark': instance.remark,
      'createDate': instance.createDate,
      'updateDate': instance.updateDate,
      'status': instance.status,
    };
