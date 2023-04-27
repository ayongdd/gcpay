// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Promotion_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromotionEntity _$PromotionEntityFromJson(Map<String, dynamic> json) => PromotionEntity(
  agentNum: json['agentNum'] as num?,
  code: json['code'] as num?,
  trxTodayRebate: json['trxTodayRebate'] as num?,
  usdtTodayRebate: json['usdtTodayRebate'] as num?,
  trxTotalRebate: json['trxTotalRebate'] as num?,
  usdtTotalRebate: json['usdtTotalRebate'] as num?,
    );

Map<String, dynamic> _$PromotionEntityToJson(PromotionEntity instance) =>
    <String, dynamic>{
      'agentNum': instance.agentNum,
      'code': instance.code,
      'trxTodayRebate': instance.trxTodayRebate,
      'usdtTodayRebate': instance.usdtTodayRebate,
      'trxTotalRebate': instance.trxTotalRebate,
      'usdtTotalRebate': instance.usdtTotalRebate,
    };
