import 'package:json_annotation/json_annotation.dart';

part 'BetRecord_Amount_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class BetRecordAmountEntity {

  num? betAmount;
  num? betNum;
  num? betBonus;



  BetRecordAmountEntity(

      this.betAmount,
      this.betNum,
      this.betBonus,
      );

  factory BetRecordAmountEntity.fromJson(Map<String, dynamic> json) =>
      _$BetRecordAmountEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BetRecordAmountEntityToJson(this);
}

