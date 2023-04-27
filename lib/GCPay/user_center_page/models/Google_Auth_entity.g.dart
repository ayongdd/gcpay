// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Google_Auth_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleAuthDataEntity _$GoogleAuthDataEntityFromJson(Map<String, dynamic> json) =>
    GoogleAuthDataEntity(
      json['secretKey'] as String?,
      json['qrBarcodeUrl'] as String?,
      json['googleAuthFlag'] as int?,
    );

Map<String, dynamic> _$GoogleAuthDataEntityToJson(GoogleAuthDataEntity instance) =>
    <String, dynamic>{
      'secretKey': instance.secretKey,
      'qrBarcodeUrl': instance.qrBarcodeUrl,
      'googleAuthFlag': instance.googleAuthFlag,
    };
