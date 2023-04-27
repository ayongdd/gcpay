// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BetRecord_Data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BetRecordDataEntity _$BetRecordDataEntityFromJson(Map<String, dynamic> json) =>
    BetRecordDataEntity(

          json['id'] as int?,
          json['transactionId'] as String?,
          json['name'] as String?,
          json['symbol'] as String?,
          json['address'] as String?,
          json['decimals'] as int?,
          json['valuePow'] as String?,
          json['value'] as num?,
          json['blockTime'] as String?,
          json['playType'] as int?,
          json['fromAddress'] as String?,
          json['toAddress'] as String?,
          json['type'] as String?,
          json['walletsolidty'] as bool?,
          json['result'] as bool?,
          json['payout'] as num?,
          json['payTransactionId'] as String?,
          json['updateDate'] as String?,
          json['createDate'] as String?,
          json['status'] as int?,
          json['payAward'] as bool?,
          json['userId'] as int?,

    );

Map<String, dynamic> _$BetRecordDataEntityToJson(BetRecordDataEntity instance) =>
    <String, dynamic>{

          'id': instance.id,
          'transactionId': instance.transactionId,
          'name': instance.name,
          'symbol': instance.symbol,
          'address': instance.address,
          'decimals': instance.decimals,
          'valuePow': instance.valuePow,
          'value': instance.value,
          'blockTime': instance.blockTime,
          'playType': instance.playType,
          'fromAddress': instance.fromAddress,
          'toAddress': instance.toAddress,
          'type': instance.type,
          'result': instance.result,
          'payout': instance.payout,
          'payTransactionId': instance.payTransactionId,
          'updateDate': instance.updateDate,
          'createDate': instance.createDate,
          'status': instance.status,
          'payAward': instance.payAward,
          'userId': instance.userId,

    };
