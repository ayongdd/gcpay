// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Wallet_History_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet_Record_entity _$Wallet_Record_entityFromJson(
    Map<String, dynamic> json) =>
    Wallet_Record_entity(
      (json['umsWalletRecord'] as List<dynamic>)
          .map((e) => WalletHistoryDataEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Wallet_Record_entityToJson(
    Wallet_Record_entity instance) =>
    <String, dynamic>{
      'umsWalletRecord': instance.umsWalletRecord,
    };


WalletHistoryDataEntity _$WalletHistoryDataEntityFromJson(Map<String, dynamic> json) =>
    WalletHistoryDataEntity(
      json['id'] as int?,
          json['umsUserId'] as int?,
      json['updateDate'] as String?,
      json['orderNo'] as String?,
      json['gcChangeAmount'] as num?,
      json['changeType'] as int?,
      json['afterChange'] as num?,
          json['beforeChange'] as num?,
      json['fee'] as num?,
          json['createDate'] as String?,
      json['status'] as int?,
    );

Map<String, dynamic> _$WalletHistoryDataEntityToJson(WalletHistoryDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
          'umsUserId': instance.umsUserId,
          'updateDate': instance.updateDate,
          'orderNo': instance.orderNo,
      'gcChangeAmount': instance.gcChangeAmount,
      'changeType': instance.changeType,
      'afterChange': instance.afterChange,
      'beforeChange': instance.beforeChange,
      'fee': instance.fee,
      'createDate': instance.createDate,
      'status': instance.status,
    };
