import 'package:json_annotation/json_annotation.dart';

part 'AddOrUpUmsPayment_Data.g.dart';


@JsonSerializable()
class AddOrUpUmsPaymentData extends Object {

  @JsonKey(name: 'Alipay')
  Alipay alipay;

  @JsonKey(name: 'WeChat')
  WeChat weChat;

  @JsonKey(name: 'Bank')
  Bank bank;

  AddOrUpUmsPaymentData(this.alipay,this.weChat,this.bank,);

  factory AddOrUpUmsPaymentData.fromJson(Map<String, dynamic> srcJson) => _$AddOrUpUmsPaymentFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AddOrUpUmsPaymentToJson(this);

}


@JsonSerializable()
class Alipay extends Object {

  @JsonKey(name: 'paymentType')
  int paymentType;

  @JsonKey(name: 'qrCode')
  String qrCode;

  @JsonKey(name: 'account')
  String account;

  @JsonKey(name: 'remark')
  String remark;

  Alipay(this.paymentType,this.qrCode,this.account,this.remark,);

  factory Alipay.fromJson(Map<String, dynamic> srcJson) => _$AlipayFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AlipayToJson(this);

}


@JsonSerializable()
class WeChat extends Object {

  @JsonKey(name: 'paymentType')
  int paymentType;

  @JsonKey(name: 'qrCode')
  String qrCode;

  @JsonKey(name: 'remark')
  String remark;

  WeChat(this.paymentType,this.qrCode,this.remark,);

  factory WeChat.fromJson(Map<String, dynamic> srcJson) => _$WeChatFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WeChatToJson(this);

}


@JsonSerializable()
class Bank extends Object {

  @JsonKey(name: 'bankCard')
  String bankCard;

  @JsonKey(name: 'bankName')
  String bankName;

  @JsonKey(name: 'paymentType')
  int paymentType;

  @JsonKey(name: 'realName')
  String realName;

  @JsonKey(name: 'remark')
  String remark;

  Bank(this.bankCard,this.bankName,this.paymentType,this.realName,this.remark,);

  factory Bank.fromJson(Map<String, dynamic> srcJson) => _$BankFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BankToJson(this);

}