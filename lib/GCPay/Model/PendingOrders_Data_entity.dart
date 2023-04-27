import 'package:json_annotation/json_annotation.dart';

part 'PendingOrders_Data_entity.g.dart';



@JsonSerializable(explicitToJson: true)
class PendingOrdersDataEntity {
  int? alipayPaymentId;
  int? bankPaymentId;
  num? gcAmounTotal;
  String? sellType;
  int? weChatPaymentId;

  PendingOrdersDataEntity(
      this.alipayPaymentId,
      this.bankPaymentId,
      this.gcAmounTotal,
      this.sellType,
      this.weChatPaymentId,
      );

  factory PendingOrdersDataEntity.fromJson(Map<String, dynamic> json) =>
      _$PendingOrdersDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PendingOrdersDataEntityToJson(this);
}
