// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BetRecord_Amount_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BetRecordAmountEntity _$BetRecordAmountEntityFromJson(Map<String, dynamic> json) =>
    BetRecordAmountEntity(

          json['betAmount'] as num?,
          json['betNum'] as num?,
          json['betBonus'] as num?,

    );

Map<String, dynamic> _$BetRecordAmountEntityToJson(BetRecordAmountEntity instance) =>
    <String, dynamic>{

          'betAmount': instance.betAmount,
          'betNum': instance.betNum,
          'betBonus': instance.betBonus,


    };