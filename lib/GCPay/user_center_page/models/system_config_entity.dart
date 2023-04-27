import 'package:json_annotation/json_annotation.dart'; 
  
part 'system_config_entity.g.dart';


@JsonSerializable()
  class system_config_entity extends Object {

  @JsonKey(name: 'app')
  App app;

  @JsonKey(name: 'serviceLink')
  String? serviceLink;

  @JsonKey(name: 'downloadLink')
  String? downloadLink;

  @JsonKey(name: 'helpLink')
  String? helpLink;

  @JsonKey(name: 'bankList')
  String? bankList;

  @JsonKey(name: 'domain')
  String? domain;

  @JsonKey(name: 'iosVersion')
  String? iosVersion;

  @JsonKey(name: 'androidVersion')
  String? androidVersion;

  system_config_entity(this.app,this.serviceLink,this.downloadLink,this.helpLink,this.bankList,this.domain,this.iosVersion,this.androidVersion);

  factory system_config_entity.fromJson(Map<String, dynamic> srcJson) => _$system_config_entityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$system_config_entityToJson(this);

}

  
@JsonSerializable()
  class App extends Object {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'headline')
  String? headline;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'content')
  String? content;

  @JsonKey(name: 'remark')
  String? remark;

  @JsonKey(name: 'createDate')
  String? createDate;

  @JsonKey(name: 'updateDate')
  String? updateDate;

  @JsonKey(name: 'status')
  int? status;

  App(this.id,this.headline,this.type,this.content,this.remark,this.createDate,this.updateDate,this.status,);

  factory App.fromJson(Map<String, dynamic> srcJson) => _$AppFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AppToJson(this);

}

  
