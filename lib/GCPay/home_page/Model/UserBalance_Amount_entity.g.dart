// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserBalance_Amount_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBalanceAmountEntity _$UserBalanceAmountEntityFromJson(Map<String, dynamic> json) =>
    UserBalanceAmountEntity(

      json['tradeAmount'] as double?,
      json['sellerAmount'] as num?,
      json['gcBalance'] as num?,
      json['gcTotal'] as num?,
      json['serviceLink'] as String?,
      json['authFlag'] as num?,
      json['unreadNum'] as num?,
      json['nickname'] as String?,
      json['realName'] as String?,
    );

Map<String, dynamic> _$UserBalanceAmountEntityToJson(UserBalanceAmountEntity instance) =>
    <String, dynamic>{
      'tradeAmount': instance.tradeAmount,
      'sellerAmount': instance.sellerAmount,
      'gcBalance': instance.gcBalance,
      'gcTotal': instance.gcTotal,
      'serviceLink': instance.serviceLink,
      'authFlag': instance.authFlag,
      'unreadNum': instance.unreadNum,
      'nickname': instance.nickname,
      'realName': instance.realName,
    };