// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PendingOrders_Data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingOrdersDataEntity _$PendingOrdersDataEntityFromJson(Map<String, dynamic> json) =>
    PendingOrdersDataEntity(

      json['alipayPaymentId'] as int?,
      json['bankPaymentId'] as int?,
      json['gcAmounTotal'] as num?,
      json['sellType'] as String?,
      json['weChatPaymentId'] as int?,






    );

Map<String, dynamic> _$PendingOrdersDataEntityToJson(PendingOrdersDataEntity instance) =>
    <String, dynamic>{

      'alipayPaymentId': instance.alipayPaymentId,
      'bankPaymentId': instance.bankPaymentId,
      'gcAmounTotal': instance.gcAmounTotal,
      'sellType': instance.sellType,
      'weChatPaymentId': instance.weChatPaymentId,





    };