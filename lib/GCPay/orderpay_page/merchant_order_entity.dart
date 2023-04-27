import 'package:json_annotation/json_annotation.dart'; 
  
part 'merchant_order_entity.g.dart';


@JsonSerializable()
  class merchant_order_entity extends Object {

  @JsonKey(name: 'tradeNo')
  String tradeNo;

  @JsonKey(name: 'gcAmount')
  double gcAmount;

  @JsonKey(name: 'merchantName')
  String merchantName;

  @JsonKey(name: 'appId')
  String appId;

  @JsonKey(name: 'createTime')
  String createTime;

  merchant_order_entity(this.tradeNo,this.gcAmount,this.merchantName,this.appId,this.createTime,);

  factory merchant_order_entity.fromJson(Map<String, dynamic> srcJson) => _$merchant_order_entityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$merchant_order_entityToJson(this);

}

  
