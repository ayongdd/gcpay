import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PendingOrderList_Data_entity.g.dart';

@JsonSerializable()
class PendingOrderListDataEntity extends Object {
  @JsonKey(name: 'updateDate')
  String? updateDate;

  @JsonKey(name: 'orderNo')
  String? orderNo;

  @JsonKey(name: 'tradeOrderNo')
  String? tradeOrderNo;

  @JsonKey(name: 'alipayPaymentId')
  int? alipayPaymentId;

  @JsonKey(name: 'sellerUserId')
  int? sellerUserId;

  @JsonKey(name: 'headPic')
  String? headPic;

  @JsonKey(name: 'sellType')
  int sellType;

  @JsonKey(name: 'gcAmountUsable')
  double? gcAmountUsable;

  @JsonKey(name: 'sellStatus')
  int? sellStatus;

  @JsonKey(name: 'weChatPaymentId')
  int? weChatPaymentId;

  @JsonKey(name: 'nickname')
  String? nickname;

  @JsonKey(name: 'payment')
  List<PendingOrderListPaymentEntity> payment;

  @JsonKey(name: 'gcAmounTotal')
  double? gcAmounTotal;

  @JsonKey(name: 'bankPaymentId')
  int? bankPaymentId;

  @JsonKey(name: 'createDate')
  String? createDate;

  @JsonKey(name: 'status')
  int? status;

  PendingOrderListDataEntity(
    this.updateDate,
    this.orderNo,
    this.tradeOrderNo,
    this.alipayPaymentId,
    this.sellerUserId,
    this.headPic,
    this.sellType,
    this.gcAmountUsable,
    this.sellStatus,
    this.weChatPaymentId,
    this.nickname,
    this.payment,
    this.gcAmounTotal,
    this.bankPaymentId,
    this.createDate,
    this.status,
  );

  factory PendingOrderListDataEntity.fromJson(Map<String, dynamic> srcJson) =>
      _$EntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EntityToJson(this);
}

@JsonSerializable()
class PendingOrderListPaymentEntity extends Object {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'umsUserId')
  int? umsUserId;

  @JsonKey(name: 'paymentType')
  int? paymentType;

  @JsonKey(name: 'realName')
  String? realName;

  @JsonKey(name: 'bankCard')
  String? bankCard;

  @JsonKey(name: 'bankName')
  String? bankName;

  @JsonKey(name: 'qrCode')
  String? qrCode;

  @JsonKey(name: 'remark')
  String? remark;

  @JsonKey(name: 'createDate')
  String? createDate;

  @JsonKey(name: 'updateDate')
  String? updateDate;

  @JsonKey(name: 'status')
  int? status;

  PendingOrderListPaymentEntity(
    this.id,
    this.umsUserId,
    this.paymentType,
    this.realName,
    this.bankCard,
    this.bankName,
    this.qrCode,
    this.remark,
    this.createDate,
    this.updateDate,
    this.status,
  );

  factory PendingOrderListPaymentEntity.fromJson(
          Map<String, dynamic> srcJson) =>
      _$PaymentFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
