import 'package:json_annotation/json_annotation.dart';

part 'BetRecord_Data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class BetRecordDataEntity {
  int? id;
  String? transactionId;
  String? name;
  String? symbol;
  String? address;
  int? decimals;
  String? valuePow;
  num? value;
  String? blockTime;
  int? playType;
  String? fromAddress;
  String? toAddress;
  String? type;
  bool? walletsolidty;
  bool? result;
  num? payout;
  String? payTransactionId;
  String? updateDate;
  String? createDate;
  int? status;
  bool? payAward;
  int? userId;

  BetRecordDataEntity(

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
      this.updateDate,
      this.createDate,
      this.status,
      this.payAward,
      this.userId,

);

  factory BetRecordDataEntity.fromJson(Map<String, dynamic> json) =>
      _$BetRecordDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BetRecordDataEntityToJson(this);
}
