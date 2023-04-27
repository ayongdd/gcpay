import 'package:json_annotation/json_annotation.dart';

part 'BetRecord_Bonus_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class BetRecordBonusEntity {

  num? betBonus;
  String? day;



  BetRecordBonusEntity(
      this.betBonus,
      this.day,
      );

  factory BetRecordBonusEntity.fromJson(Map<String, dynamic> json) =>
      _$BetRecordBonusEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BetRecordBonusEntityToJson(this);
}

