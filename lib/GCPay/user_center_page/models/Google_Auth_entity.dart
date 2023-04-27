import 'package:json_annotation/json_annotation.dart';

part 'Google_Auth_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class GoogleAuthDataEntity {
  String? secretKey;
  String? qrBarcodeUrl;
  int? googleAuthFlag;


  GoogleAuthDataEntity(
    this.secretKey,
    this.qrBarcodeUrl,
    this.googleAuthFlag,
  );
  factory GoogleAuthDataEntity.fromJson(Map<String, dynamic> json) =>
      _$GoogleAuthDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleAuthDataEntityToJson(this);
}
