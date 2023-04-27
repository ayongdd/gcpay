// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BuyerOrder_Data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyerOrderDataEntity _$BuyerOrderDataEntityFromJson(
        Map<String, dynamic> json) =>
    BuyerOrderDataEntity(
      json['buyerPayType'] as int?,
      json['buyerPaymentId'] as int?,
      json['buyerUserId'] as int?,
      json['gcAmount'] as num?,
      json['orderNo'] as String?,
      json['sellerUserId'] as int?,
    );

Map<String, dynamic> _$BuyerOrderDataEntityToJson(
        BuyerOrderDataEntity instance) =>
    <String, dynamic>{
      'buyerPayType': instance.buyerPayType,
      'buyerPaymentId': instance.buyerPaymentId,
      'buyerUserId': instance.buyerUserId,
      'gcAmount': instance.gcAmount,
      'orderNo': instance.orderNo,
      'sellerUserId': instance.sellerUserId,
    };
