// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RebateRecord_Data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RebateRecordDataEntity _$RebateRecordDataEntityFromJson(Map<String, dynamic> json) =>
    RebateRecordDataEntity(

          json['id'] as int?,
          json['transactionId'] as String?,
          json['transferId'] as String?,
          json['name'] as String?,
          json['symbol'] as String?,
          json['address'] as String?,
          json['decimals'] as int?,
          json['valuePow'] as String?,
          json['value'] as double?,
          json['block_time'] as String?,
          json['blockTime'] as String?,
          json['play_type'] as int?,
          json['from_address'] as String?,
          json['toAddress'] as String?,
          json['update_date'] as String?,
          json['create_date'] as String?,
          json['rebateType'] as int?,
          json['userId'] as int?,
          json['childUserId'] as int?,
          json['childUserName'] as String?,
    );

Map<String, dynamic> _$RebateRecordDataEntityToJson(RebateRecordDataEntity instance) =>
    <String, dynamic>{

          'id': instance.id,
          'transactionId': instance.transactionId,
          'transferId': instance.transferId,
          'name': instance.name,
          'symbol': instance.symbol,
          'address': instance.address,
          'decimals': instance.decimals,
          'valuePow': instance.valuePow,
          'value': instance.value,
          'block_time': instance.block_time,
          'blockTime': instance.blockTime,
          'playType': instance.play_type,
          'fromAddress': instance.from_address,
          'toAddress': instance.toAddress,
          'updateDate': instance.update_date,
          'createDate': instance.create_date,
          'rebateType': instance.rebateType,
          'userId': instance.userId,
          'childUserId': instance.childUserId,
          'childUserName': instance.childUserName,
    };