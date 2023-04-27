import 'package:json_annotation/json_annotation.dart';

part 'RebateRecord_Data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class RebateRecordDataEntity {

  int? id;
  String? transactionId;
  String? transferId;
  String? name;
  String? symbol;
  String? address;
  int? decimals;
  String? valuePow;
  double? value;
  String? block_time;
  String? blockTime;
  int? play_type;
  String? from_address;
  String? toAddress;
  String? update_date;
  String? create_date;
  int? rebateType;
  int? userId;
  int? childUserId;
  String? childUserName;
  RebateRecordDataEntity(

      this.id,
      this.transactionId,
      this.transferId,
      this.name,
      this.symbol,
      this.address,
      this.decimals,
      this.valuePow,
      this.value,
      this.block_time,
      this.blockTime,
      this.play_type,
      this.from_address,
      this.toAddress,
      this.update_date,
      this.create_date,
      this.rebateType,
      this.userId,
      this.childUserId,
      this.childUserName,
      );

  factory RebateRecordDataEntity.fromJson(Map<String, dynamic> json) =>
      _$RebateRecordDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RebateRecordDataEntityToJson(this);
}

