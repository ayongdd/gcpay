// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

merchant_order_entity _$merchant_order_entityFromJson(
        Map<String, dynamic> json) =>
    merchant_order_entity(
      json['tradeNo'] as String,
      (json['gcAmount'] as num).toDouble(),
      json['merchantName'] as String,
      json['appId'] as String,
          json['createTime'] as String,
    );

Map<String, dynamic> _$merchant_order_entityToJson(
        merchant_order_entity instance) =>
    <String, dynamic>{
      'tradeNo': instance.tradeNo,
      'gcAmount': instance.gcAmount,
      'merchantName': instance.merchantName,
      'appId': instance.appId,
      'createTime': instance.createTime,
    };
