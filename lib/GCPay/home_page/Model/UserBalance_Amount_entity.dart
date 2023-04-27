import 'package:json_annotation/json_annotation.dart';

part 'UserBalance_Amount_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class UserBalanceAmountEntity {
  double? tradeAmount;
  num? sellerAmount;
  num? gcBalance;
  num? gcTotal;
  String? serviceLink;
  num? authFlag;
  num? unreadNum;
  String? nickname;
  String? realName;

  UserBalanceAmountEntity(
    this.tradeAmount,
    this.sellerAmount,
    this.gcBalance,
    this.gcTotal,
      this.serviceLink,
      this.authFlag,
      this.unreadNum,
      this.nickname,
      this.realName,
  );

  factory UserBalanceAmountEntity.fromJson(Map<String, dynamic> json) =>
      _$UserBalanceAmountEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserBalanceAmountEntityToJson(this);
}
