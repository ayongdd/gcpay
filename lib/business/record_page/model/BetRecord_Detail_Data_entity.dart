import 'package:json_annotation/json_annotation.dart';

part 'BetRecord_Detail_Data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class BetRecordDetailDataEntity {
  int? id;
  String? transactionId;
  String? name;
  String? symbol;
  String? address;
  int? decimals;
  String? valuePow;
  int? value;
  String? blockTime;
  int? playType;
  String? fromAddress;
  String? toAddress;
  String? type;
  bool? walletsolidty;
  bool? result;
  double? payout;
  String? payTransactionId;
  int? status;
  bool? payAward;
  int? userId;
  String? player_name;
  BetRecordDetailDataEntity(

      this.id,
      this.transactionId,
      this.name,
      this.symbol,
      this.address,
      this.decimals,
      this.valuePow,
      this.value,
      this.blockTime,
      this.playType,
      this.fromAddress,
      this.toAddress,
      this.type,
      this.walletsolidty,
      this.result,
      this.payout,
      this.payTransactionId,
      this.status,
      this.payAward,
      this.userId,
      this.player_name,
);

  factory BetRecordDetailDataEntity.fromJson(Map<String, dynamic> json) =>
      _$BetRecordDetailDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BetRecordDetailDataEntityToJson(this);
}
