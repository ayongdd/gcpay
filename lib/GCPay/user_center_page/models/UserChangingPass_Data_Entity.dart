import 'package:json_annotation/json_annotation.dart';

part 'UserChangingPass_Data_Entity.g.dart';


@JsonSerializable(explicitToJson: true)
class UserChangingPassDataEntity {

  String? confirm;
  String? original;
  String? password;

  UserChangingPassDataEntity(


      this.confirm,
      this.original,
      this.password

  );



  factory UserChangingPassDataEntity.fromJson(Map<String, dynamic> json) =>
      _$UserChangingPassDataEntityFromJson(json);


  Map<String, dynamic> toJson() => _$UserChangingPassDataEntityToJson(this);

}