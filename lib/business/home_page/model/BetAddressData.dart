import 'package:json_annotation/json_annotation.dart';

part 'BetAddressData.g.dart';

@JsonSerializable()
class BetAddressData {
  BetAddressData({
      int? playId,
      String? playName,
      String? address, 
      String? noLotteryAddress, 
      int? playType, 
      double? trxBalance, 
      int? usdtBalance, 
      String? updateDate, 
      String? createDate, 
      int? status,}){
    _playId = playId;
    _playName = playName;
    _address = address;
    _noLotteryAddress = noLotteryAddress;
    _playType = playType;
    _trxBalance = trxBalance;
    _usdtBalance = usdtBalance;
    _updateDate = updateDate;
    _createDate = createDate;
    _status = status;
}

  BetAddressData.fromJson(dynamic json) {
    _playId = json['playId'];
    _playName = json['playName'];
    _address = json['address'];
    _noLotteryAddress = json['noLotteryAddress'];
    _playType = json['playType'];
    _trxBalance = json['trxBalance'];
    _usdtBalance = json['usdtBalance'];
    _updateDate = json['updateDate'];
    _createDate = json['createDate'];
    _status = json['status'];
  }
  int? _playId;
  String? _playName;
  String? _address;
  String? _noLotteryAddress;
  int? _playType;
  double? _trxBalance;
  int? _usdtBalance;
  String? _updateDate;
  String? _createDate;
  int? _status;

  int? get playId => _playId;
  String? get playName => _playName;
  String? get address => _address;
  String? get noLotteryAddress => _noLotteryAddress;
  int? get playType => _playType;
  double? get trxBalance => _trxBalance;
  int? get usdtBalance => _usdtBalance;
  String? get updateDate => _updateDate;
  String? get createDate => _createDate;
  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['playId'] = _playId;
    map['playName'] = _playName;
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