import 'package:json_annotation/json_annotation.dart'; 
  
part 'HomePage_Record_entity.g.dart';


@JsonSerializable()
  class HomePage_Record_entity extends Object {

  @JsonKey(name: 'tmsSellOrder')
  List<TmsSellOrder> tmsSellOrder;

  @JsonKey(name: 'tmsTradeOrder')
  List<TmsTradeOrder> tmsTradeOrder;

  HomePage_Record_entity(this.tmsSellOrder,this.tmsTradeOrder,);

  factory HomePage_Record_entity.fromJson(Map<String, dynamic> srcJson) => _$HomePage_Record_entityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomePage_Record_entityToJson(this);

}

  
@JsonSerializable()
  class TmsSellOrder extends Object {

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

  @JsonKey(name: 'realName')
  String? realName;

  @JsonKey(name: 'sellType')
  int? sellType;

  @JsonKey(name: 'gcAmountUsable')
  double? gcAmountUsable;

  @JsonKey(name: 'sellStatus')
  int? sellStatus;

  @JsonKey(name: 'weChatPaymentId')
  int? weChatPaymentId;

  @JsonKey(name: 'nickname')
  String? nickname;

  @JsonKey(name: 'payment')
  List<Payment> payment;

  @JsonKey(name: 'gcAmounTotal')
  double? gcAmounTotal;

  @JsonKey(name: 'createDate')
  String? createDate;

  @JsonKey(name: 'status')
  int? status;

  TmsSellOrder(this.updateDate,this.orderNo,this.tradeOrderNo,this.alipayPaymentId,this.sellerUserId,this.realName,this.sellType,this.gcAmountUsable,this.sellStatus,this.weChatPaymentId,this.nickname,this.payment,this.gcAmounTotal,this.createDate,this.status,);

  factory TmsSellOrder.fromJson(Map<String, dynamic> srcJson) => _$TmsSellOrderFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TmsSellOrderToJson(this);

}

  
@JsonSerializable()
  class Payment extends Object {

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

  @JsonKey(name: 'remark')
  String? remark;

  @JsonKey(name: 'qrCode')
  String? qrCode;

  @JsonKey(name: 'createDate')
  String? createDate;

  @JsonKey(name: 'updateDate')
  String? updateDate;

  @JsonKey(name: 'status')
  int? status;

  Payment(this.id,this.umsUserId,this.paymentType,this.realName,this.bankCard,this.bankName,this.remark,this.qrCode,this.createDate,this.updateDate,this.status,);

  factory Payment.fromJson(Map<String, dynamic> srcJson) => _$PaymentFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);

}

  
@JsonSerializable()
  class TmsTradeOrder extends Object {

  @JsonKey(name: 'sellerPaymentId')
  int? sellerPaymentId;

  @JsonKey(name: 'sellType')
  int? sellType;

  @JsonKey(name: 'updateDate')
  String? updateDate;

  @JsonKey(name: 'buyerPayType')
  int? buyerPayType;

  @JsonKey(name: 'orderNo')
  String? orderNo;

  @JsonKey(name: 'paymentPic')
  String? paymentPic;

  @JsonKey(name: 'tradeOrderNo')
  String? tradeOrderNo;

  @JsonKey(name: 'orderStatus')
  int? orderStatus;

  @JsonKey(name: 'sellerNickname')
  String? sellerNickname;

  @JsonKey(name: 'buyerNickname')
  String? buyerNickname;

  @JsonKey(name: 'sellerRealName')
  String? sellerRealName;

  @JsonKey(name: 'buyerRealName')
  String? buyerRealName;

  @JsonKey(name: 'sellerUserId')
  int? sellerUserId;

  @JsonKey(name: 'sellerAgreeTime')
  String? sellerAgreeTime;

  @JsonKey(name: 'buyerTransferTime')
  String? buyerTransferTime;

  @JsonKey(name: 'sellerOutGcTime')
  String? sellerOutGcTime;

  @JsonKey(name: 'umsPaymentBuyer')
  UmsPaymentBuyer? umsPaymentBuyer;

  @JsonKey(name: 'umsPaymentSell')
  UmsPaymentSell? umsPaymentSell;

  @JsonKey(name: 'gcAmount')
  double? gcAmount;

  @JsonKey(name: 'buyerPaymentId')
  int? buyerPaymentId;

  @JsonKey(name: 'tradeStatus')
  int? tradeStatus;

  @JsonKey(name: 'buyerUserId')
  int? buyerUserId;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'orderStartTime')
  String? orderStartTime;

  @JsonKey(name: 'nowTime')
  int? nowTime;

  @JsonKey(name: 'createDate')
  String? createDate;

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'buyerPay')
  String? buyerPay;

  TmsTradeOrder(this.sellerPaymentId,this.sellType,this.updateDate,this.buyerPayType,this.orderNo,this.paymentPic,this.tradeOrderNo,this.orderStatus,this.sellerNickname,this.buyerNickname,this.sellerRealName,this.buyerRealName,this.sellerUserId,this.sellerAgreeTime,this.buyerTransferTime,this.sellerOutGcTime,this.umsPaymentBuyer,this.umsPaymentSell,this.gcAmount,this.buyerPaymentId,this.tradeStatus,this.buyerUserId,this.id,this.orderStartTime,this.nowTime,this.createDate,this.status,this.buyerPay,);

  factory TmsTradeOrder.fromJson(Map<String, dynamic> srcJson) => _$TmsTradeOrderFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TmsTradeOrderToJson(this);

}

  
@JsonSerializable()
  class UmsPaymentBuyer extends Object {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'umsUserId')
  int? umsUserId;

  @JsonKey(name: 'paymentType')
  int? paymentType;

  @JsonKey(name: 'realName')
  String? realName;

  @JsonKey(name: 'userName')
  String? userName;

  @JsonKey(name: 'bankCard')
  String? bankCard;

  @JsonKey(name: 'bankName')
  String? bankName;

  @JsonKey(name: 'qrCode')
  String? qrCode;

  @JsonKey(name: 'account')
  String? account;

  @JsonKey(name: 'remark')
  String? remark;

  @JsonKey(name: 'createDate')
  String? createDate;

  @JsonKey(name: 'updateDate')
  String? updateDate;

  @JsonKey(name: 'status')
  int? status;

  UmsPaymentBuyer(this.id,this.umsUserId,this.paymentType,this.realName,this.userName,this.bankCard,this.bankName,this.qrCode,this.account,this.remark,this.createDate,this.updateDate,this.status,);

  factory UmsPaymentBuyer.fromJson(Map<String, dynamic> srcJson) => _$UmsPaymentBuyerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UmsPaymentBuyerToJson(this);

}

  
@JsonSerializable()
  class UmsPaymentSell extends Object {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'umsUserId')
  int? umsUserId;

  @JsonKey(name: 'paymentType')
  int? paymentType;

  @JsonKey(name: 'realName')
  String? realName;

  @JsonKey(name: 'userName')
  String? userName;

  @JsonKey(name: 'bankCard')
  String? bankCard;

  @JsonKey(name: 'bankName')
  String? bankName;

  @JsonKey(name: 'qrCode')
  String? qrCode;

  @JsonKey(name: 'account')
  String? account;

  @JsonKey(name: 'remark')
  String? remark;

  @JsonKey(name: 'createDate')
  String? createDate;

  @JsonKey(name: 'updateDate')
  String? updateDate;

  @JsonKey(name: 'status')
  int? status;

  UmsPaymentSell(this.id,this.umsUserId,this.paymentType,this.realName,this.userName,this.bankCard,this.bankName,this.qrCode,this.account,this.remark,this.createDate,this.updateDate,this.status,);

  factory UmsPaymentSell.fromJson(Map<String, dynamic> srcJson) => _$UmsPaymentSellFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UmsPaymentSellToJson(this);

}

  
