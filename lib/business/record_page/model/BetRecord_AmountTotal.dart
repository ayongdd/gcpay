import 'package:json_annotation/json_annotation.dart';
import 'package:GCPay/business/activity_page/model/Focus_Data_entity.dart';

import 'BetRecord_Amount_entity.dart';
import 'BetRecord_Data_entity.dart';

part 'BetRecord_AmountTotal.g.dart';
@JsonSerializable(explicitToJson: true)
class BetRecordAmountTotal {
  BetRecordAmountTotal({
    this.today,
    this.yesterday,
    this.total,
    this.agentNum,
    this.agentBetAmount,
    this.agentBetBonus,
    this.agentProfitAmount,
  });

  BetRecordAmountEntity? today;
  BetRecordAmountEntity? yesterday;
  BetRecordAmountEntity? total;
  num? agentNum;
  num? agentBetAmount;
  num? agentBetBonus;
  num? agentProfitAmount;

factory BetRecordAmountTotal.fromJson(Map<String, dynamic> json) => _$BetRecordAmountTotalFromJson(json);

Map<String, dynamic> toJson() => _$BetRecordAmountTotalToJson(this);
}
