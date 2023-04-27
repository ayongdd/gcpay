// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PendingOrderList_Data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingOrderListDataEntity _$EntityFromJson(Map<String, dynamic> json) =>
    PendingOrderListDataEntity(
      json['updateDate'] as String?,
      json['orderNo'] as String?,
          json['tradeOrderNo'] as String?,
      json['alipayPaymentId'] as int?,
      json['sellerUserId'] as int?,
          json['headPic'] as String?,
      json['sellType'] as int,
      (json['gcAmountUsable'] as num).toDouble(),
      json['sellStatus'] as int?,
      json['weChatPaymentId'] as int?,
      json['nickname'] as String?,
      (json['payment'] as List<dynamic>)
          .map((e) =>
              PendingOrderListPaymentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['gcAmounTotal'] as num).toDouble(),
      json['bankPaymentId'] as int?,
      json['createDate'] as String?,
      json['status'] as int?,
    );

Map<String, dynamic> _$EntityToJson(PendingOrderListDataEntity instance) =>
    <String, dynamic>{
      'updateDate': instance.updateDate,
      'orderNo': instance.orderNo,
      'alipayPaymentId': instance.alipayPaymentId,
      'sellerUserId': instance.sellerUserId,
          'headPic': instance.headPic,
      'sellType': instance.sellType,
      'gcAmountUsable': instance.gcAmountUsable,
      'sellStatus': instance.sellStatus,
      'weChatPaymentId': instance.weChatPaymentId,
      'nickname': instance.nickname,
      'payment': instance.payment,
      'gcAmounTotal': instance.gcAmounTotal,
      'bankPaymentId': instance.bankPaymentId,
      'createDate': instance.createDate,
      'status': instance.status,
    };

PendingOrderListPaymentEntity _$PaymentFromJson(Map<String, dynamic> json) =>
    PendingOrderListPaymentEntity(
      json['id'] as int?,
      json['umsUserId'] as int?,
      json['paymentType'] as int?,
      json['realName'] as String?,
      json['bankCard'] as String?,
      json['bankName'] as String?,
          json['qrCode'] as String?,
      json['remark'] as String?,
      json['createDate'] as String?,
      json['updateDate'] as String?,
      json['status'] as int?,
    );

Map<String, dynamic> _$PaymentToJson(PendingOrderListPaymentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'umsUserId': instance.umsUserId,
      'paymentType': instance.paymentType,
      'realName': instance.realName,
      'bankCard': instance.bankCard,
      'bankName': instance.bankName,
          'qrCode': instance.qrCode,
      'remark': instance.remark,
      'createDate': instance.createDate,
      'updateDate': instance.updateDate,
      'status': instance.status,
    };
