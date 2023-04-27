import 'package:json_annotation/json_annotation.dart';

part 'ExchangeRate_Amount_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ExchangeRateAmountEntity {

  num? amount;



  ExchangeRateAmountEntity(

      this.amount,
      );

  factory ExchangeRateAmountEntity.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRateAmountEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRateAmountEntityToJson(this);
}
