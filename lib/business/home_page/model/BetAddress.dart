import 'package:json_annotation/json_annotation.dart';

import 'BetAddressData.dart';

part 'BetAddress.g.dart';
@JsonSerializable(explicitToJson: true)
class BetAddress {
  BetAddress({
      int? code, 
      String? msg, 
      List<BetAddressData>? data,}){
    _code = code;
    _msg = msg;
    _data = data;
}

  BetAddress.fromJson(dynamic json) {
    _code = json['code'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BetAddressData.fromJson(v));
      });
    }
  }
  int? _code;
  String? _msg;
  List<BetAddressData>? _data;

  int? get code => _code;
  String? get msg => _msg;
  List<BetAddressData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}