// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserChangingPass_Data_Entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************



UserChangingPassDataEntity _$UserChangingPassDataEntityFromJson(Map<String, dynamic> json) =>
    UserChangingPassDataEntity(

      json['confirm'] as String?,
      json['original'] as String?,
      json['password'] as String?,




    );

Map<String, dynamic> _$UserChangingPassDataEntityToJson(UserChangingPassDataEntity instance) =>
    <String, dynamic>{

        'confirm': instance.confirm,
        'original': instance.original,
        'password': instance.password,
      // 'captcha': instance.captcha,
      // 'deviceId': instance.deviceId,
      // 'loginPassword': instance.loginPassword,
      // 'nickname': instance.nickname,
      // 'payPassword': instance.payPassword,



    };