// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExchangeRecord_Data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRecordDataEntity _$ExchangeRecordDataEntityFromJson(Map<String, dynamic> json) =>
    ExchangeRecordDataEntity(

      json['exchangeAmount'] as num?,
      json['returnAmount'] as num?,
      json['blockTime'] as String?,
      json['transferId'] as String?,

    );

Map<String, dynamic> _$ExchangeRecordDataEntityToJson(ExchangeRecordDataEntity instance) =>
    <String, dynamic>{

      'exchangeAmount': instance.exchangeAmount,
      'returnAmount': instance.returnAmount,
      'blockTime': instance.blockTime,
      'transferId': instance.transferId,

    };