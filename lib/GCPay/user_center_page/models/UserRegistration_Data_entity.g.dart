// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserRegistration_Data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegistrationDataEntity _$UserRegistrationDataEntityFromJson(Map<String, dynamic> json) =>
    UserRegistrationDataEntity(

      json['captcha'] as String?,
      json['deviceId'] as String?,
      json['loginPassword'] as String?,
      json['nickname'] as String?,
      json['payPassword'] as String?,




    );

Map<String, dynamic> _$UserRegistrationDataEntityToJson(UserRegistrationDataEntity instance) =>
    <String, dynamic>{

      'captcha': instance.captcha,
      'deviceId': instance.deviceId,
      'loginPassword': instance.loginPassword,
      'nickname': instance.nickname,
      'payPassword': instance.payPassword,



    };