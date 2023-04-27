// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BetAddress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BetAddress _$BetAddressFromJson(Map<String, dynamic> json) => BetAddress(
      code: json['code'] as int?,
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BetAddressData.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$BetAddressToJson(BetAddress instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
