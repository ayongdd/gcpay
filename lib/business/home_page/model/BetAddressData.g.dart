// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BetAddressData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BetAddressData _$BetAddressDataFromJson(Map<String, dynamic> json) =>
    BetAddressData(
      playId: json['playId'] as int?,
      playName: json['playName'] as String?,
      address: json['address'] as String?,
      noLotteryAddress: json['noLotteryAddress'] as String?,
      playType: json['playType'] as int?,
      trxBalance: (json['trxBalance'] as num?)?.toDouble(),
      usdtBalance: json['usdtBalance'] as int?,
      updateDate: json['updateDate'] as String?,
      createDate: json['createDate'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$BetAddressDataToJson(BetAddressData instance) =>
    <String, dynamic>{
      'playId': instance.playId,
      'playName': instance.playName,
      'address': instance.address,
      'noLotteryAddress': instance.noLotteryAddress,
      'playType': instance.playType,
      'trxBalance': instance.trxBalance,
      'usdtBalance': instance.usdtBalance,
      'updateDate': instance.updateDate,
      'createDate': instance.createDate,
      'status': instance.status,
    };
