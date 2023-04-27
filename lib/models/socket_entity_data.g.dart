// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket_entity_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocketEntityData _$SocketEntityDataFromJson(Map<String, dynamic> json) =>
    SocketEntityData(
      json['command'] as num?,
      json['msg'] as String?,
      json['tradeOrderNo'] as String?,
      json['nowTime'] as num?,
      json['sendTime'] as num?,
      json['userId'] as num?,
    );

Map<String, dynamic> _$SocketEntityDataToJson(SocketEntityData instance) =>
    <String, dynamic>{
      'command': instance.command,
      'msg': instance.msg,
      'tradeOrderNo': instance.tradeOrderNo,
      'nowTime': instance.nowTime,
      'sendTime': instance.sendTime,
      'userId': instance.userId,
    };
