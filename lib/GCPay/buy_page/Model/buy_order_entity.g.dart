// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

buy_order_entity _$buy_order_entityFromJson(Map<String, dynamic> json) =>
    buy_order_entity(
      json['id'] as int?,
      json['orderNo'] as String?,
      json['tradeOrderNo'] as String?,
      json['sellerUserId'] as int?,
      json['buyerUserId'] as int?,
      json['buyerPayType'] as int?,
      json['buyerPaymentId'] as int?,
      (json['gcAmount'] as num).toDouble(),
      json['orderStatus'] as int?,
      json['tradeStatus'] as int?,
      json['orderStartTime'] as String?,
      json['createDate'] as String?,
      json['updateDate'] as String?,
      json['status'] as int?,
    );

Map<String, dynamic> _$buy_order_entityToJson(buy_order_entity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNo': instance.orderNo,
      'tradeOrderNo': instance.tradeOrderNo,
      'sellerUserId': instance.sellerUserId,
      'buyerUserId': instance.buyerUserId,
      'buyerPayType': instance.buyerPayType,
      'buyerPaymentId': instance.buyerPaymentId,
      'gcAmount': instance.gcAmount,
      'orderStatus': instance.orderStatus,
      'tradeStatus': instance.tradeStatus,
      'orderStartTime': instance.orderStartTime,
      'createDate': instance.createDate,
      'updateDate': instance.updateDate,
      'status': instance.status,
    };
