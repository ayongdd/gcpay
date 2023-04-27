// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BetRecord_Detail_Data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BetRecordDetailDataEntity _$BetRecordDetailDataEntityFromJson(Map<String, dynamic> json) =>
    BetRecordDetailDataEntity(

          json['id'] as int?,
          json['transactionId'] as String?,
          json['name'] as String?,
          json['symbol'] as String?,
          json['address'] as String?,
          json['decimals'] as int?,
          json['valuePow'] as String?,
          json['value'] as int?,
          json['blockTime'] as String?,
          json['playType'] as int?,
          json['fromAddress'] as String?,
          json['toAddress'] as String?,
          json['type'] as String?,
          json['walletsolidty'] as bool?,
          json['result'] as bool?,
          json['payout'] as double?,
          json['payTransactionId'] as String?,
          json['status'] as int?,
          json['payAward'] as bool?,
          json['userId'] as int?,
          json['player_name'] as String?,
    );

Map<String, dynamic> _$BetRecordDetailDataEntityToJson(BetRecordDetailDataEntity instance) =>
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
          'play_type': instance.playType,
          'from_address': instance.fromAddress,
          'toAddress': instance.toAddress,
          'type': instance.type,
          'result': instance.result,
          'payout': instance.payout,
          'payTransactionId': instance.payTransactionId,
          'status': instance.status,
          'payAward': instance.payAward,
          'user_id': instance.userId,
          'player_name': instance.player_name,

    };
