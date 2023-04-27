import 'package:json_annotation/json_annotation.dart'; 
  
part 'buy_order_entity.g.dart';


@JsonSerializable()
  class buy_order_entity extends Object {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'orderNo')
  String? orderNo;

  @JsonKey(name: 'tradeOrderNo')
  String? tradeOrderNo;

  @JsonKey(name: 'sellerUserId')
  int? sellerUserId;

  @JsonKey(name: 'buyerUserId')
  int? buyerUserId;

  @JsonKey(name: 'buyerPayType')
  int? buyerPayType;

  @JsonKey(name: 'buyerPaymentId')
  int? buyerPaymentId;

  @JsonKey(name: 'gcAmount')
  double? gcAmount;

  @JsonKey(name: 'orderStatus')
  int? orderStatus;

  @JsonKey(name: 'tradeStatus')
  int? tradeStatus;

  @JsonKey(name: 'orderStartTime')
  String? orderStartTime;

  @JsonKey(name: 'createDate')
  String? createDate;

  @JsonKey(name: 'updateDate')
  String? updateDate;

  @JsonKey(name: 'status')
  int? status;

  buy_order_entity(this.id,this.orderNo,this.tradeOrderNo,this.sellerUserId,this.buyerUserId,this.buyerPayType,this.buyerPaymentId,this.gcAmount,this.orderStatus,this.tradeStatus,this.orderStartTime,this.createDate,this.updateDate,this.status,);

  factory buy_order_entity.fromJson(Map<String, dynamic> srcJson) => _$buy_order_entityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$buy_order_entityToJson(this);

}

  
