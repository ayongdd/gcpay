import 'dart:developer';
import 'dart:ui';

import 'package:GCPay/business/home_page/model/Login_entity.dart';
import 'package:GCPay/config/config_api.dart';
import 'package:GCPay/mixins/helper_mixin.dart';
import 'package:GCPay/models/token_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../GCPay/home_page/Model/HomePage_Record_entity.dart';
import '../GCPay/home_page/Model/PendingOrderList_Data_entity.dart';

import '../GCPay/siteinfo_page/Model/SiteInfo_Data_entity.dart';
import 'lang/localization_service.dart';

class CacheService extends GetxService with HelperMixin {
  String? token;
  String? cacheuserId;
  String? cacheuserImToken;
  String? cacheuserImSessionId;
  String? strCoolDownOrderPayId = '';
  String? strOrderPayId = '';
  RxString userNameString = "".obs;
  RxString userNickNameString = "".obs;
  RxString userBonusString = "".obs;
  RxString userTrc20AddressString = "".obs;
  RxString exchangeTrc20AddressString = "".obs;
  RxString rxLanguage = "".obs;
  RxString rxDeviceid = "".obs;
  RxString rxProfilePath = "".obs;
  RxString rxHelpLink = "".obs;
  RxString rxBankList = "".obs;
  RxString rxDOMAINS = "".obs;
  RxString rxVersionName = "".obs;
  RxString rxPushAlias = "".obs;
  RxString rxServiceLink = "".obs;
  RxString rxDownloadLink = "".obs;
  RxInt rxAuthFlag = 0.obs;
  int intPopup = 0;
  RxList<UmsPaymentSell> paymentmethods = <UmsPaymentSell>[].obs;
  late PendingOrderListDataEntity orderEntity;
  late TmsSellOrder mySellOrderEntity;
  late TmsTradeOrder myTradeOrderEntity;
  late UmsPaymentSell paymentManagerEntity;
  late SiteInfoDataEntity siteInfoData;
  RxString rxNoticeTitle = ''.obs;
  RxString rxNoticeContent = ''.obs;
  RxString rxNoticeTime = ''.obs;
  @override
  onInit() async {
    token = loadToken();
    var getLocal = await LocalizationService().getCurrentLocale();
    if(getLocal == Locale('zh', 'CH',))
      {
        rxLanguage.value = "1";
      }
    else
      {
        rxLanguage.value = "0";
      }

    cacheuserId = loadUserId().toString();
    cacheuserImToken = loadUserImToken.toString();
    userNameString.value = loadUserName().toString();
    userNickNameString.value = loadUserNickName().toString();
    userTrc20AddressString.value = loadUserTrc20Address().toString();
    exchangeTrc20AddressString.value = loadUserTrc20Address().toString();
    rxDeviceid.value = loadUserTrc20Address().toString();
    rxProfilePath.value = loadProfilePath().toString();
    rxServiceLink.value = loadServiceLink().toString();
    rxHelpLink.value = loadHelpLink().toString();
    rxBankList.value = loadBankList().toString();
    rxDOMAINS.value = loadDomains().toString();
    rxVersionName.value = loadVersionName().toString();
    rxDownloadLink.value = loadDownloadLink().toString();
    String strAuthFlag = loadAuthFlag()!;
    if(strAuthFlag.length > 0)
      {
        rxAuthFlag.value = int.parse(strAuthFlag) ;
      }

    super.onInit();
  }

  void logOut() {
    token = null;
    removeToken();
    removeUsdtBonus();
    removeTrxBonus();
    removeUsername();
    removeUserid();
    removeUserImToken();
    removeUserTrc20Address();
    removeDeviceId();
    removeProfilePath();
    removeServiceLink();
    removeAuthFlag();
    removePushAlias();
  }

  void login(String token) async {
    this.token = token;
    //Token is cached
    await saveToken(token);
    // await saveBonus(bonus);
    // await saveUserName(userName);
  }

  Future<bool> saveToken(String token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  Future<bool> saveUsdtBonus(num bonus) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USDTBONUS.toString(), bonus);
    userBonusString.value = "USDT:"+loadUsdtBonus()!.toStringAsFixed(2);
    return true;
  }

  Future<bool> saveTrxBonus(num bonus) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TRXBONUS.toString(), bonus);
    userBonusString.value = "USDT:"+loadUsdtBonus()!.toStringAsFixed(2) + "/TRX:"+loadTrxBonus()!.toStringAsFixed(2);
    return true;
  }

  Future<bool> saveUserName(String userName) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USERNAME.toString(), userName);
    userNameString.value = userName;
    return true;
  }

  Future<bool> saveUserNickName(String userName) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USERNICKNAME.toString(), userName);
    userNickNameString.value = userName;
    return true;
  }

  Future<bool> saveUserId(String userId) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USERID.toString(), userId);
    cacheuserId = userId;
    return true;
  }

  Future<bool> saveUserIMToken(String userIMToken) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USERIMTOKEN.toString(), userIMToken);
    cacheuserImToken = userIMToken;
    return true;
  }

  Future<bool> saveUserIMSessionId(String userIMSessionId) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USERIMSESSION.toString(), userIMSessionId);
    cacheuserImSessionId = userIMSessionId;
    return true;
  }

  Future<bool> saveUserTrc20Address(String userTrc20Address) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.UserTRC20Address.toString(), userTrc20Address);
    userTrc20AddressString.value = userTrc20Address;
    return true;
  }

  Future<bool> saveExchangeTrc20Address(String exchangeTrc20Address) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.ExchangeTRC20Address.toString(), exchangeTrc20Address);
    exchangeTrc20AddressString.value = exchangeTrc20Address;
    return true;
  }

  Future<bool> saveLanguage(String strlanguage) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.ENVLANGUAGE.toString(), strlanguage);
    rxLanguage.value = strlanguage;
    return true;
  }

  Future<bool> saveDeviceId(String strDeviceId) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.DEVICEID.toString(), strDeviceId);
    rxDeviceid.value = strDeviceId;
    return true;
  }

  Future<bool> saveProfilePath(String strProfilePath) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.PROFILEPATH.toString(), strProfilePath);
    rxProfilePath.value = strProfilePath;
    return true;
  }

  Future<bool> saveServiceLink(String strServiceLink) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.SERVICELINK.toString(), strServiceLink);
    rxServiceLink.value = strServiceLink;
    return true;
  }

  Future<bool> saveHelpLink(String strServiceLink) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.HELPLINK.toString(), strServiceLink);
    rxHelpLink.value = strServiceLink;
    return true;
  }

  Future<bool> saveBankList(String strServiceLink) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.BANKLIST.toString(), strServiceLink);
    rxBankList.value = strServiceLink;
    return true;
  }

  Future<bool> saveDomain(String strServiceLink) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.DOMAINS.toString(), strServiceLink);
    rxDOMAINS.value = strServiceLink;
    return true;
  }

  Future<bool> saveVersionName(String strVersionName) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.VERSIONAME.toString(), strVersionName);
    rxVersionName.value = strVersionName;
    return true;
  }

  Future<bool> saveDownLoadLink(String strDownLoadLink) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.DOWNLOADLINK.toString(), strDownLoadLink);
    rxDownloadLink.value = strDownLoadLink;
    return true;
  }

  Future<bool> savePushAlias(String strServiceLink) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.PUSHALIAS.toString(), strServiceLink);
    rxPushAlias.value = strServiceLink;
    return true;
  }

  Future<bool> saveAuthFlag(String strAuthFlag) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.AUTHFLAG.toString(), strAuthFlag);
    rxAuthFlag.value = int.parse(strAuthFlag);
    return true;
  }

  Future<bool> saveOrderPayId(String orderPayId) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.ORDERPAYID.toString(), orderPayId);
    strOrderPayId = orderPayId;
    return true;
  }

  Future<bool> saveCoolDownOrderPayId(String orderPayId) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.COOLORDERPAYID.toString(), orderPayId);
    strCoolDownOrderPayId = orderPayId;
    return true;
  }

  Future<bool> saveNotice(String strNoticeTitle,String strNoticeContent,String strNoticeTime) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.NOTICETITLE.toString(), strNoticeTitle);
    await box.write(CacheManagerKey.NOTICECONTENT.toString(), strNoticeContent);
    await box.write(CacheManagerKey.NOTICETIME.toString(), strNoticeTime);
    rxNoticeTitle.value = strNoticeTitle;
    rxNoticeContent.value = strNoticeContent;
    rxNoticeTime.value = strNoticeTime;
    return true;
  }

  String? loadToken() {
    final box = GetStorage();
    var jsonToken = box.read(CacheManagerKey.TOKEN.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    return jsonToken;
  }

  String? loadUserName() {
    final box = GetStorage();
    var jsonUserName = box.read(CacheManagerKey.USERNAME.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonUserName == 'null' || jsonUserName == null)
      {
        return '';
      }
    return jsonUserName;
  }

  String? loadUserNickName() {
    final box = GetStorage();
    var jsonUserNickName = box.read(CacheManagerKey.USERNICKNAME.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonUserNickName == 'null' ||jsonUserNickName == null)
    {
      return '';
    }
    return jsonUserNickName;
  }

  String? loadUserId() {
    final box = GetStorage();
    var jsonUserId = box.read(CacheManagerKey.USERID.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonUserId == 'null' || jsonUserId == null)
      {
        return '';
      }
    return jsonUserId;
  }

  String? loadUserImToken() {
    final box = GetStorage();
    var jsonUserImToken = box.read(CacheManagerKey.USERIMTOKEN.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonUserImToken == 'null' || jsonUserImToken == null)
    {
      return '';
    }
    return jsonUserImToken;
  }

  String? loadUserImSession() {
    final box = GetStorage();
    var jsonUserImSession = box.read(CacheManagerKey.USERIMSESSION.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonUserImSession == 'null' || jsonUserImSession == null)
    {
      return '';
    }
    return jsonUserImSession;
  }

  num? loadUsdtBonus() {
    final box = GetStorage();
    var jsonUsdtBonues = box.read(CacheManagerKey.USDTBONUS.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonUsdtBonues == null)
    {
      return 0;
    }
    return jsonUsdtBonues;
  }

  num? loadTrxBonus() {
    final box = GetStorage();
    var jsonToken = box.read(CacheManagerKey.TRXBONUS.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    return jsonToken;
  }

  String? loadUserTrc20Address() {
    final box = GetStorage();
    var jsonToken = box.read(CacheManagerKey.UserTRC20Address.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    return jsonToken;
  }

  String? loadExchangeTrc20Address() {
    final box = GetStorage();
    var jsonToken = box.read(CacheManagerKey.ExchangeTRC20Address.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    return jsonToken;
  }

  String? loadLanguage() {
    final box = GetStorage();
    var jsonLanguage = box.read(CacheManagerKey.ENVLANGUAGE.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonLanguage== 'null' || jsonLanguage==null)
    {
      return '';
    }
    return jsonLanguage;
  }

  String? loadDevieId() {
    final box = GetStorage();
    var jsonDeviceId = box.read(CacheManagerKey.DEVICEID.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonDeviceId=='null' || jsonDeviceId==null)
    {
      return '';
    }
    return jsonDeviceId;
  }

  String? loadProfilePath() {
    final box = GetStorage();
    var jsonProfilePath = box.read(CacheManagerKey.PROFILEPATH.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonProfilePath==null)
      {
        return '';
      }
    return jsonProfilePath;
  }

  String? loadServiceLink() {
    final box = GetStorage();
    var jsonServiceLink = box.read(CacheManagerKey.SERVICELINK.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonServiceLink=='null' || jsonServiceLink==null)
    {
      return '';
    }
    return jsonServiceLink;
  }

  String? loadVersionName() {
    final box = GetStorage();
    var jsonVersionName = box.read(CacheManagerKey.VERSIONAME.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonVersionName=='null' || jsonVersionName==null)
    {
      return '';
    }
    return jsonVersionName;
  }

  String? loadDownloadLink() {
    final box = GetStorage();
    var jsonDownloadLink = box.read(CacheManagerKey.DOWNLOADLINK.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonDownloadLink=='null' || jsonDownloadLink==null)
    {
      return '';
    }
    return jsonDownloadLink;
  }

  String? loadHelpLink() {
    final box = GetStorage();
    var jsonHelpLink = box.read(CacheManagerKey.HELPLINK.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonHelpLink=='null' || jsonHelpLink==null)
    {
      return '';
    }
    return jsonHelpLink;
  }

  String? loadBankList() {
    final box = GetStorage();
    var jsonBankList = box.read(CacheManagerKey.BANKLIST.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonBankList=='null' || jsonBankList==null)
    {
      return '';
    }
    return jsonBankList;
  }

  String? loadDomains() {
    final box = GetStorage();
    var jsonDomains = box.read(CacheManagerKey.DOMAINS.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonDomains=='null' || jsonDomains==null)
    {
      return '';
    }
    return jsonDomains;
  }

  String? loadAuthFlag() {
    final box = GetStorage();
    var jsonAuthFlag = box.read(CacheManagerKey.AUTHFLAG.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonAuthFlag=='null' || jsonAuthFlag==null)
    {
      return '0';
    }
    return jsonAuthFlag;
  }

  String? loadOrderPayId() {
    final box = GetStorage();
    var jsonOrderPayId = box.read(CacheManagerKey.ORDERPAYID.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonOrderPayId=='null' || jsonOrderPayId==null)
    {
      return '';
    }
    return jsonOrderPayId;
  }

  String? loadCoolDownOrderPayId() {
    final box = GetStorage();
    var jsonCoolDownOrderPayId = box.read(CacheManagerKey.COOLORDERPAYID.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonCoolDownOrderPayId=='null' || jsonCoolDownOrderPayId==null)
    {
      return '';
    }
    return jsonCoolDownOrderPayId;
  }

  String? loadPushAlias() {
    final box = GetStorage();
    var jsonPushAlias = box.read(CacheManagerKey.PUSHALIAS.toString());
    // log('-----------------${jsonToken['expires_in']}----------');
    if(jsonPushAlias=='null' || jsonPushAlias==null)
    {
      return '';
    }
    return jsonPushAlias;
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeUsdtBonus() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.USDTBONUS.toString());
  }

  Future<void> removeTrxBonus() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TRXBONUS.toString());
  }

  Future<void> removeUsername() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.USERNAME.toString());
  }

  Future<void> removeUserNickname() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.USERNICKNAME.toString());
  }

  Future<void> removeUserid() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.USERID.toString());
  }

  Future<void> removeUserImToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.USERIMTOKEN.toString());
  }


  Future<void> removeUserTrc20Address() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.UserTRC20Address.toString());
  }

  Future<void> removeExchangeTrc20Address() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.ExchangeTRC20Address.toString());
  }

  Future<void> removeDeviceId() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.DEVICEID.toString());
  }

  Future<void> removeProfilePath() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.PROFILEPATH.toString());
  }

  Future<void> removeServiceLink() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.SERVICELINK.toString());
  }

  Future<void> removeHelpLink() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.HELPLINK.toString());
  }

  Future<void> removeBankList() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.BANKLIST.toString());
  }

  Future<void> removeDomains() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.DOMAINS.toString());
  }

  Future<void> removeVersionName() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.VERSIONAME.toString());
  }

  Future<void> removeDownloadLink() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.DOWNLOADLINK.toString());
  }

  Future<void> removeAuthFlag() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.AUTHFLAG.toString());
  }

  Future<void> removeOrderPayId() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.ORDERPAYID.toString());
  }

  Future<void> removeCoolOrderPayId() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.COOLORDERPAYID.toString());
  }

  Future<void> removePushAlias() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.PUSHALIAS.toString());
  }

  Future<bool> saveUserInfo(LoginEntity userInfo) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USERINFO.toString(), userInfo);
    return true;
  }

  bool isLogin() {
    if (token == null) return false;
    return true;
  }

  bool sessionIsExpired() {
    if (token == null) return true;

    // int currentTimestamp = HelperMixin.getTimestamp();
    // bool isExceeded = (token!.timestamp +
    //         token!.expiresIn -
    //         ConfigAPI.sessionTimeoutThreshold -
    //         currentTimestamp) <=
    //     0;
    //
    // // log('${DateTime.now().microsecondsSinceEpoch / 1000}');
    // printInfo(
    //     info:
    //         'Expired in: ${token != null ? (token!.timestamp + token!.expiresIn - currentTimestamp) / 60 : 0} mins -- isExceeded: ${isExceeded.toString()}');
    return false;
  }
}

enum CacheManagerKey { TOKEN,USERINFO,USERNAME,USERNICKNAME,USERID,USERIMTOKEN,USERIMSESSION,USDTBONUS,TRXBONUS,ExchangeTRC20Address,UserTRC20Address,ENVLANGUAGE,DEVICEID,PROFILEPATH,SERVICELINK,HELPLINK,BANKLIST,DOMAINS,PUSHALIAS,AUTHFLAG,NOTICETITLE,NOTICECONTENT,NOTICETIME,VERSIONAME,DOWNLOADLINK,ORDERPAYID,COOLORDERPAYID}
