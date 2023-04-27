import 'package:json_annotation/json_annotation.dart'; 
  
part 'socket_entity_data.g.dart';


@JsonSerializable()
  class SocketEntityData extends Object {

  @JsonKey(name: 'command')
  num? command;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'tradeOrderNo')
  String? tradeOrderNo;

  @JsonKey(name: 'nowTime')
  num? nowTime;

  @JsonKey(name: 'sendTime')
  num? sendTime;

  @JsonKey(name: 'userId')
  num? userId;

  SocketEntityData(this.command,this.msg,this.tradeOrderNo,this.nowTime,this.sendTime,this.userId,);

  factory SocketEntityData.fromJson(Map<String, dynamic> srcJson) => _$SocketEntityDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SocketEntityDataToJson(this);

}

  
