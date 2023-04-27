 // GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BetRecord_AmountTotal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BetRecordAmountTotal _$BetRecordAmountTotalFromJson(Map<String, dynamic> json) =>
    BetRecordAmountTotal(
          agentNum: json['agentNum'] as num?,
          agentBetAmount: json['agentBetAmount'] as num?,
          agentBetBonus: json['agentBetBonus'] as num?,
          agentProfitAmount: json['agentProfitAmount'] as num?,
          today: json['today'] == null
          ? null
          : BetRecordAmountEntity.fromJson(json['today'] as Map<String, dynamic>),
          yesterday: json['yesterday'] == null
              ? null
              : BetRecordAmountEntity.fromJson(json['yesterday'] as Map<String, dynamic>),
          total: json['total'] == null
              ? null
              : BetRecordAmountEntity.fromJson(json['total'] as Map<String, dynamic>),

    );

Map<String, dynamic> _$BetRecordAmountTotalToJson(BetRecordAmountTotal instance) =>
    <String, dynamic>{
      'agentNum': instance.agentNum,
          'agentBetAmount': instance.agentBetAmount,
          'agentBetBonus': instance.agentBetBonus,
          'agentProfitAmount': instance.agentProfitAmount,
          'today': instance.today?.toJson(),
          'yesterday': instance.yesterday?.toJson(),
          'total': instance.total?.toJson(),

    };
