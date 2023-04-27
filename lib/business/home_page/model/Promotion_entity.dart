import 'package:json_annotation/json_annotation.dart';
import 'IssueList.dart';

part 'Promotion_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class PromotionEntity {
  PromotionEntity({this.agentNum, this.code, this.trxTodayRebate, this.usdtTodayRebate,this.trxTotalRebate, this.usdtTotalRebate});

  num? agentNum;
  num? code;
  num? trxTodayRebate;
  num? usdtTodayRebate;
  num? trxTotalRebate;
  num? usdtTotalRebate;

  factory PromotionEntity.fromJson(Map<String, dynamic> json) =>
      _$PromotionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionEntityToJson(this);
}
