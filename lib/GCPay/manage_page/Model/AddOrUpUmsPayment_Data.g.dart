// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddOrUpUmsPayment_Data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrUpUmsPaymentData _$AddOrUpUmsPaymentFromJson(Map<String, dynamic> json) =>
    AddOrUpUmsPaymentData(
          Alipay.fromJson(json['Alipay'] as Map<String, dynamic>),
          WeChat.fromJson(json['WeChat'] as Map<String, dynamic>),
          Bank.fromJson(json['Bank'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddOrUpUmsPaymentToJson(AddOrUpUmsPaymentData instance) =>
    <String, dynamic>{
          'Alipay': instance.alipay,
          'WeChat': instance.weChat,
          'Bank': instance.bank,
    };

Alipay _$AlipayFromJson(Map<String, dynamic> json) => Alipay(
      json['paymentType'] as int,
      json['qrCode'] as String,
      json['account'] as String,
      json['remark'] as String,
);

Map<String, dynamic> _$AlipayToJson(Alipay instance) => <String, dynamic>{
      'paymentType': instance.paymentType,
      'qrCode': instance.qrCode,
      'account': instance.account,
      'remark': instance.remark,
};

WeChat _$WeChatFromJson(Map<String, dynamic> json) => WeChat(
      json['paymentType'] as int,
      json['qrCode'] as String,
      json['remark'] as String,
);

Map<String, dynamic> _$WeChatToJson(WeChat instance) => <String, dynamic>{
      'paymentType': instance.paymentType,
      'qrCode': instance.qrCode,
      'remark': instance.remark,
};

Bank _$BankFromJson(Map<String, dynamic> json) => Bank(
      json['bankCard'] as String,
      json['bankName'] as String,
      json['paymentType'] as int,
      json['realName'] as String,
      json['remark'] as String,
);

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'bankCard': instance.bankCard,
      'bankName': instance.bankName,
      'paymentType': instance.paymentType,
      'realName': instance.realName,
      'remark': instance.remark,
};
