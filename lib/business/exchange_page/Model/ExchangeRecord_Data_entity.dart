import 'package:json_annotation/json_annotation.dart';

part 'ExchangeRecord_Data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ExchangeRecordDataEntity {

  num? exchangeAmount;
  num? returnAmount;
  String? blockTime;
  String? transferId;



  ExchangeRecordDataEntity(

      this.exchangeAmount,
      this.returnAmount,
      this.blockTime,
      this.transferId,

      );

  factory ExchangeRecordDataEntity.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRecordDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRecordDataEntityToJson(this);
}

