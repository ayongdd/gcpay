import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pointycastle/asymmetric/api.dart';

import '../services/cache_service.dart';

/// Created by XieXin on 2021/8/13.
/// 加密工具类
class EncryptUtils {
  ///aes
  static late Key _keyAes;
  static late Encrypter _encryptAes;
  static String strNewKey = 'dx0DmDgTjVISThlU';
  static String strOldKey = 'NJlh9YuAxU4ZMmqO';
  static final IV _ivAes = IV.fromUtf8(strNewKey);
  static IV _ivAesold = IV.fromUtf8(strOldKey);
  ///rsa
  static late RSAPublicKey _publicKey;
  static late RSAPrivateKey _privateKey;
  static late Encrypter _encryptRsa;
  static late Signer _signer;
  static late String strVersion;

  /// Rsa加密最大长度
  static const int MAX_ENCRYPT_BLOCK = 117;

  /// Rsa解密最大长度
  static const int MAX_DECRYPT_BLOCK = 128;

  ///初始化AES加密启动时调用
  static Future<void> initAes(
      {
        mode = AESMode.cbc,
        padding = 'PKCS7',
      }) async {
    String strKey = '';
    await initVersion();
    if(haveNewVersion(strVersion,'1.2.2'))
    {
      strKey = strNewKey;
    }
    else
    {
      strKey = strOldKey;
    }

    if (strKey.length == 16 || strKey.length == 24 || strKey.length == 32) {
      _keyAes = Key.fromUtf8(strKey);
      _encryptAes = Encrypter(AES(_keyAes, mode: mode, padding: padding));
      return;
    }
    print("密钥长度为16/24/32位");
  }

  ///初始化RAS加密启动时调用
  static Future<void> initRsa(String publicPath, String privatePath) async {
    String publicKeyString = await rootBundle.loadString(publicPath);
    String privateKeyString = await rootBundle.loadString(privatePath);
    _publicKey = RSAKeyParser().parse(publicKeyString) as RSAPublicKey;
    _privateKey = RSAKeyParser().parse(privateKeyString) as RSAPrivateKey;

    _encryptRsa = Encrypter(
      RSA(publicKey: _publicKey, privateKey: _privateKey),
    );
    _signer = Signer(RSASigner(RSASignDigest.SHA256,
        publicKey: _publicKey, privateKey: _privateKey));
  }

  ///Aes加密
  static String encryptAes(String context) {
    return _encryptAes.encrypt(context, iv: _ivAes).base64;
  }

  static Future<void> initVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    strVersion = version;
    final box = GetStorage();
    await box.write(CacheManagerKey.VERSIONAME.toString(), strVersion);
  }

  static bool haveNewVersion(String newVersion, String old) {
    bool haveNewVersion = false;
    if (newVersion == null || newVersion.isEmpty || old == null || old.isEmpty)
      return false;
    int newVersionInt, oldVersion;
    var newList = newVersion.split('.');
    var oldList = old.split('.');
    if (newList.length == 0 || oldList.length == 0) {
      return false;
    }
    for (int i = 0; i < newList.length; i++) {
      newVersionInt = int.parse(newList[i]);
      oldVersion = int.parse(oldList[i]);
      if (newVersionInt > oldVersion) {
        return true;
      } else if (newVersionInt < oldVersion) {
        return false;
      }
    }
    return haveNewVersion;
  }

  ///Aes解密
  static String decryptAes(String context) {
    if(haveNewVersion(strVersion,'1.2.2'))
      {
        return _encryptAes.decrypt(Encrypted.fromBase64(context), iv:_ivAes);
      }
    else
      {
        return _encryptAes.decrypt(Encrypted.fromBase64(context), iv: _ivAesold);
      }

  }

  ///公钥Rsa加密
  static String encryptRsa(String context) {
    // 原始字符串转成字节数组
    List<int> sourceBytes = utf8.encode(context);
    // 数据长度
    int inputLen = sourceBytes.length;
    // 缓存数组
    List<int> cache = [];
    // 分段加密 步长为MAX_ENCRYPT_BLOCK
    for (var i = 0; i < inputLen; i += MAX_ENCRYPT_BLOCK) {
      // 剩余长度
      int endLen = inputLen - i;
      List<int> item;
      if (endLen > MAX_ENCRYPT_BLOCK) {
        item = sourceBytes.sublist(i, i + MAX_ENCRYPT_BLOCK);
      } else {
        item = sourceBytes.sublist(i, i + endLen);
      }
      // 加密后对象转换成数组存放到缓存
      cache.addAll(_encryptRsa.encryptBytes(item).bytes);
    }
    // 加密后数组转换成base64编码并返回
    String en = base64.encode(cache);
    return en;
  }

  ///私钥Rsa解密
  static String decryptRsa(String data) {
    // 原始字符串转成字节数组
    Uint8List sourceBytes = base64.decode(data);
    // 数据长度
    int inputLen = sourceBytes.length;
    // 缓存数组
    List<int> cache = [];
    // 分段解密 步长为MAX_DECRYPT_BLOCK
    for (var i = 0; i < inputLen; i += MAX_DECRYPT_BLOCK) {
      // 剩余长度
      int endLen = inputLen - i;
      Uint8List item;
      if (endLen > MAX_DECRYPT_BLOCK) {
        item = sourceBytes.sublist(i, i + MAX_DECRYPT_BLOCK);
      } else {
        item = sourceBytes.sublist(i, i + endLen);
      }
      // 解密后存放到缓存
      cache.addAll(_encryptRsa.decryptBytes(Encrypted(item)));
    }
    // 解密后数组解码并返回
    String decode = utf8.decode(cache);
    return decode;
  }

  ///用私钥对信息生成数字签名
  static String sign(String data) {
    return _signer.sign(data).base64;
  }

  ///校验数字签名
  static bool verify(String data, String sign) {
    return _signer.verify64(data, sign);
  }
}
