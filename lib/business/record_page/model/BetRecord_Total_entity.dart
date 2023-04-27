import 'package:json_annotation/json_annotation.dart';

part 'BetRecord_Total_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class BetRecordTotalEntity {

  num? betAmount;
  String? day;



  BetRecordTotalEntity(
      this.betAmount,
      this.day,
      );

  factory BetRecordTotalEntity.fromJson(Map<String, dynamic> json) =>
      _$BetRecordTotalEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BetRecordTotalEntityToJson(this);
}

