import 'package:json_annotation/json_annotation.dart';

part 'UserRegistration_Data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class UserRegistrationDataEntity {


  String? captcha;
  String? deviceId;
  String? loginPassword;
  String? nickname;
  String? payPassword;


  UserRegistrationDataEntity(


      this.captcha,
      this.deviceId,
      this.loginPassword,
      this.nickname,
      this.payPassword,

 );

  factory UserRegistrationDataEntity.fromJson(Map<String, dynamic> json) =>
      _$UserRegistrationDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegistrationDataEntityToJson(this);
}

