import 'package:json_annotation/json_annotation.dart';

part 'Wallet_History_entity.g.dart';

@JsonSerializable(explicitToJson: true)

class Wallet_Record_entity extends Object {

  @JsonKey(name: 'umsWalletRecord')
  List<WalletHistoryDataEntity> umsWalletRecord;


  Wallet_Record_entity(this.umsWalletRecord);

  factory Wallet_Record_entity.fromJson(Map<String, dynamic> srcJson) => _$Wallet_Record_entityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Wallet_Record_entityToJson(this);

}

class WalletHistoryDataEntity {
  int? id;
  int? umsUserId;
  String? updateDate;
  String? orderNo;
  num? gcChangeAmount;
  int? changeType;
  num? afterChange;
  num? beforeChange;
  num? fee;
  String? createDate;
  int? status;

  WalletHistoryDataEntity(
    this.id,
    this.umsUserId,
    this.updateDate,
    this.orderNo,
    this.gcChangeAmount,
    this.changeType,
    this.afterChange,
    this.beforeChange,
    this.fee,
    this.createDate,
    this.status,
  );
  factory WalletHistoryDataEntity.fromJson(Map<String, dynamic> json) =>
      _$WalletHistoryDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WalletHistoryDataEntityToJson(this);
}
