/// code : 200
/// msg : "修改成功"
/// data : [{"id":1,"address":"TSmtU69Rm86rqQjm1jPKLAMzWJkEdhZbzN","noLotteryAddress":"TJgrhcuoWwjyNk7izYoW98cbjjUA47b58x","playType":1,"trxBalance":0.0001,"usdtBalance":0.0052,"updateDate":"2022-07-09T18:13:42.000+0800","createDate":"2022-04-30T14:57:40.000+0800","status":1},{"id":4,"address":"TA1PqmCbte458MZAZJyKVJbGkra9dHfuNb","noLotteryAddress":"TJgrhcuoWwjyNk7izYoW98cbjjUA47b58x","playType":3,"trxBalance":0,"usdtBalance":0.0024,"updateDate":"2022-06-09T01:51:53.000+0800","createDate":"2022-05-03T21:50:13.000+0800","status":1},{"id":5,"address":"TLRr1Vy5YMUFY1p1nzBbLiPv3b2Npte2Kw","noLotteryAddress":"TJgrhcuoWwjyNk7izYoW98cbjjUA47b58x","playType":2,"trxBalance":0.0001,"usdtBalance":130.0039,"updateDate":"2022-07-13T14:13:41.000+0800","createDate":"2022-06-10T22:11:13.000+0800","status":1},{"id":6,"address":"TK3PJWByNAUc1rYCmnnDMjFVVDYKw1fhJB","noLotteryAddress":"0000000","playType":4,"trxBalance":null,"usdtBalance":null,"updateDate":"2022-07-12T20:07:49.000+0800","createDate":"2022-07-12T20:07:49.000+0800","status":1},{"id":7,"address":"TMiJcAq3oogGgsQGj15DoSRQCZoPCzwrFj","noLotteryAddress":"0000000","playType":5,"trxBalance":null,"usdtBalance":null,"updateDate":"2022-07-12T20:08:28.000+0800","createDate":"2022-07-12T20:08:28.000+0800","status":1},{"id":8,"address":"TPQ3Ke1vA22pD9iuRZiD1ojJGbysDEFXAu","noLotteryAddress":"0000000","playType":6,"trxBalance":null,"usdtBalance":null,"updateDate":"2022-07-12T20:08:55.000+0800","createDate":"2022-07-12T20:08:55.000+0800","status":1}]

class BetaddressModel {
  BetaddressModel({int? code, String? msg, List<Data>? data,}) {
    _code = code;
    _msg = msg;
    _data = data;
  }

  BetaddressModel.fromJson(dynamic json) {
    _code = json['code'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  int? _code;
  String? _msg;
  List<Data>? _data;
  BetaddressModel copyWith({
    int? code,
    String? msg,
    List<Data>? data,
  }) =>
      BetaddressModel(
        code: code ?? _code,
        msg: msg ?? _msg,
        data: data ?? _data,
      );
  int? get code => _code;
  String? get msg => _msg;
  List<Data>? get data => _data;

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

/// id : 1
/// address : "TSmtU69Rm86rqQjm1jPKLAMzWJkEdhZbzN"
/// noLotteryAddress : "TJgrhcuoWwjyNk7izYoW98cbjjUA47b58x"
/// playType : 1
/// trxBalance : 0.0001
/// usdtBalance : 0.0052
/// updateDate : "2022-07-09T18:13:42.000+0800"
/// createDate : "2022-04-30T14:57:40.000+0800"
/// status : 1

class Data {
  Data({
    int? id,
    String? address,
    String? noLotteryAddress,
    int? playType,
    double? trxBalance,
    double? usdtBalance,
    String? updateDate,
    String? createDate,
    int? status,
  }) {
    _id = id;
    _address = address;
    _noLotteryAddress = noLotteryAddress;
    _playType = playType;
    _trxBalance = trxBalance;
    _usdtBalance = usdtBalance;
    _updateDate = updateDate;
    _createDate = createDate;
    _status = status;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _address = json['address'];
    _noLotteryAddress = json['noLotteryAddress'];
    _playType = json['playType'];
    _trxBalance = json['trxBalance'];
    _usdtBalance = json['usdtBalance'];
    _updateDate = json['updateDate'];
    _createDate = json['createDate'];
    _status = json['status'];
  }
  int? _id;
  String? _address;
  String? _noLotteryAddress;
  int? _playType;
  double? _trxBalance;
  double? _usdtBalance;
  String? _updateDate;
  String? _createDate;
  int? _status;
  Data copyWith({
    int? id,
    String? address,
    String? noLotteryAddress,
    int? playType,
    double? trxBalance,
    double? usdtBalance,
    String? updateDate,
    String? createDate,
    int? status,
  }) =>
      Data(
        id: id ?? _id,
        address: address ?? _address,
        noLotteryAddress: noLotteryAddress ?? _noLotteryAddress,
        playType: playType ?? _playType,
        trxBalance: trxBalance ?? _trxBalance,
        usdtBalance: usdtBalance ?? _usdtBalance,
        updateDate: updateDate ?? _updateDate,
        createDate: createDate ?? _createDate,
        status: status ?? _status,
      );
  int? get id => _id;
  String? get address => _address;
  String? get noLotteryAddress => _noLotteryAddress;
  int? get playType => _playType;
  double? get trxBalance => _trxBalance;
  double? get usdtBalance => _usdtBalance;
  String? get updateDate => _updateDate;
  String? get createDate => _createDate;
  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['address'] = _address;
    map['noLotteryAddress'] = _noLotteryAddress;
    map['playType'] = _playType;
    map['trxBalance'] = _trxBalance;
    map['usdtBalance'] = _usdtBalance;
    map['updateDate'] = _updateDate;
    map['createDate'] = _createDate;
    map['status'] = _status;
    return map;
  }
}
