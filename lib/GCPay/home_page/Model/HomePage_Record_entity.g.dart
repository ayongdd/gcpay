// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomePage_Record_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePage_Record_entity _$HomePage_Record_entityFromJson(
        Map<String, dynamic> json) =>
    HomePage_Record_entity(
      (json['tmsSellOrder'] as List<dynamic>)
          .map((e) => TmsSellOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['tmsTradeOrder'] as List<dynamic>)
          .map((e) => TmsTradeOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomePage_Record_entityToJson(
        HomePage_Record_entity instance) =>
    <String, dynamic>{
      'tmsSellOrder': instance.tmsSellOrder,
      'tmsTradeOrder': instance.tmsTradeOrder,
    };

TmsSellOrder _$TmsSellOrderFromJson(Map<String, dynamic> json) => TmsSellOrder(
      json['updateDate'] as String?,
      json['orderNo'] as String?,
      json['tradeOrderNo'] as String?,
      json['alipayPaymentId'] as int?,
      json['sellerUserId'] as int?,
      json['realName'] as String?,
      json['sellType'] as int?,
      json['gcAmountUsable'] as double?,
      json['sellStatus'] as int?,
      json['weChatPaymentId'] as int?,
      json['nickname'] as String?,
      (json['payment'] as List<dynamic>)
          .map((e) => Payment.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['gcAmounTotal'] as double?,
      json['createDate'] as String?,
      json['status'] as int?,
    );

Map<String, dynamic> _$TmsSellOrderToJson(TmsSellOrder instance) =>
    <String, dynamic>{
      'updateDate': instance.updateDate,
      'orderNo': instance.orderNo,
      'alipayPaymentId': instance.alipayPaymentId,
      'sellerUserId': instance.sellerUserId,
      'sellType': instance.sellType,
      'gcAmountUsable': instance.gcAmountUsable,
      'sellStatus': instance.sellStatus,
      'weChatPaymentId': instance.weChatPaymentId,
      'nickname': instance.nickname,
      'payment': instance.payment,
      'gcAmounTotal': instance.gcAmounTotal,
      'createDate': instance.createDate,
      'status': instance.status,
    };

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      json['id'] as int?,
      json['umsUserId'] as int?,
      json['paymentType'] as int?,
      json['realName'] as String?,
      json['bankCard'] as String?,
      json['bankName'] as String?,
      json['remark'] as String?,
      json['qrCode'] as String?,
      json['createDate'] as String?,
      json['updateDate'] as String?,
      json['status'] as int?,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'umsUserId': instance.umsUserId,
      'paymentType': instance.paymentType,
      'realName': instance.realName,
      'bankCard': instance.bankCard,
      'bankName': instance.bankName,
      'remark': instance.remark,
      'createDate': instance.createDate,
      'updateDate': instance.updateDate,
      'status': instance.status,
    };

TmsTradeOrder _$TmsTradeOrderFromJson(Map<String, dynamic> json) =>
    TmsTradeOrder(
      json['sellerPaymentId'] as int?,
          json['sellType'] as int?,
      json['updateDate'] as String?,
      json['buyerPayType'] as int?,
      json['orderNo'] as String?,
        json['paymentPic'] as String?,
          json['tradeOrderNo'] as String?,
      json['orderStatus'] as int?,
      json['sellerNickname'] as String?,
          json['buyerNickname'] as String?,
          json['sellerRealName'] as String?,
          json['buyerRealName'] as String?,
      json['sellerUserId'] as int?,
      json['sellerAgreeTime'] as String?,
      json['buyerTransferTime'] as String?,
      json['sellerOutGcTime'] as String?,
      UmsPaymentBuyer.fromJson(json['umsPaymentBuyer'] as Map<String, dynamic>),
      UmsPaymentSell.fromJson(json['umsPaymentSell'] as Map<String, dynamic>),
      json['gcAmount'] as double?,
      json['buyerPaymentId'] as int?,
      json['tradeStatus'] as int?,
      json['buyerUserId'] as int?,
      json['id'] as int?,
      json['orderStartTime'] as String?,
          json['nowTime'] as int?,
      json['createDate'] as String?,
      json['status'] as int?,
      json['buyerPay'] as String?,
    );

Map<String, dynamic> _$TmsTradeOrderToJson(TmsTradeOrder instance) =>
    <String, dynamic>{
      'sellerPaymentId': instance.sellerPaymentId,
      'updateDate': instance.updateDate,
      'buyerPayType': instance.buyerPayType,
      'orderNo': instance.orderNo,
      'orderStatus': instance.orderStatus,
      'sellerNickname': instance.sellerNickname,
          'buyerNickname': instance.buyerNickname,
          'sellerRealName': instance.sellerRealName,
          'buyerRealName': instance.buyerRealName,
      'sellerUserId': instance.sellerUserId,
      'sellerAgreeTime': instance.sellerAgreeTime,
      'buyerTransferTime': instance.buyerTransferTime,
      'sellerOutGcTime': instance.sellerOutGcTime,
      'umsPaymentBuyer': instance.umsPaymentBuyer,
      'umsPaymentSell': instance.umsPaymentSell,
      'gcAmount': instance.gcAmount,
      'buyerPaymentId': instance.buyerPaymentId,
      'tradeStatus': instance.tradeStatus,
      'buyerUserId': instance.buyerUserId,
      'id': instance.id,
      'orderStartTime': instance.orderStartTime,
          'nowTime': instance.nowTime,
      'createDate': instance.createDate,
      'status': instance.status,
      'buyerPay': instance.buyerPay,
    };

UmsPaymentBuyer _$UmsPaymentBuyerFromJson(Map<String, dynamic> json) =>
    UmsPaymentBuyer(
      json['id'] as int?,
      json['umsUserId'] as int?,
      json['paymentType'] as int?,
      json['realName'] as String?,
          json['userName'] as String?,
      json['bankCard'] as String?,
      json['bankName'] as String?,
      json['qrCode'] as String?,
      json['account'] as String?,
      json['remark'] as String?,
      json['createDate'] as String?,
      json['updateDate'] as String?,
      json['status'] as int?,
    );

Map<String, dynamic> _$UmsPaymentBuyerToJson(UmsPaymentBuyer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'umsUserId': instance.umsUserId,
      'paymentType': instance.paymentType,
      'realName': instance.realName,
          'userName': instance.userName,
      'bankCard': instance.bankCard,
      'bankName': instance.bankName,
      'qrCode': instance.qrCode,
      'account': instance.account,
      'remark': instance.remark,
      'createDate': instance.createDate,
      'updateDate': instance.updateDate,
      'status': instance.status,
    };

UmsPaymentSell _$UmsPaymentSellFromJson(Map<String, dynamic> json) =>
    UmsPaymentSell(
      json['id'] as int?,
      json['umsUserId'] as int,
      json['paymentType'] as int,
      json['realName'] as String?,
          json['userName'] as String?,
      json['bankCard'] as String?,
      json['bankName'] as String?,
      json['qrCode'] as String?,
      json['account'] as String?,
      json['remark'] as String?,
      json['createDate'] as String?,
      json['updateDate'] as String?,
      json['status'] as int,
    );

Map<String, dynamic> _$UmsPaymentSellToJson(UmsPaymentSell instance) =>
    <String, dynamic>{
      'id': instance.id,
      'umsUserId': instance.umsUserId,
      'paymentType': instance.paymentType,
      'realName': instance.realName,
      'bankCard': instance.bankCard,
      'bankName': instance.bankName,
      'qrCode': instance.qrCode,
      'account': instance.account,
      'remark': instance.remark,
      'createDate': instance.createDate,
      'updateDate': instance.updateDate,
      'status': instance.status,
    };
