import 'package:json_annotation/json_annotation.dart';

part 'BuyerOrder_Data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class BuyerOrderDataEntity {
  int? buyerPayType;
  int? buyerPaymentId;
  int? buyerUserId;
  num? gcAmount;
  String? orderNo;
  int? sellerUserId;

  BuyerOrderDataEntity(
    this.buyerPayType,
    this.buyerPaymentId,
    this.buyerUserId,
    this.gcAmount,
    this.orderNo,
    this.sellerUserId,
  );

  factory BuyerOrderDataEntity.fromJson(Map<String, dynamic> json) =>
      _$BuyerOrderDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BuyerOrderDataEntityToJson(this);
}
