import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:GCPay/services/cache_service.dart';
import 'package:GCPay/services/lang/storage_prefs.dart';
import 'package:get/get.dart';
import 'es_ES.dart';
import 'en_US.dart';
import 'bt_BR.dart';
import 'zh_CH.dart';

class LocalizationService extends Translations {
  final prefs = StoragePrefs();
  // Default locale
  static final locale = Locale('zh', 'CH');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('zh', 'CH');

  // Supported languages
  // Needs to be same order with locales
  static final langs = ['Español', 'English', 'Portugués', 'Chinese'];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('es', 'ES'),
    Locale('en', 'US'),
    Locale('pt', 'BR'),
    Locale('zh', 'CH'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'es_ES': esES, // lang/es_ES.dart
        'en_US': enUS, // lang/en_us.dart
        'pt_BR': btBR, // lang/pt_BR.dart
        'zh_CH': zhCH, // lang/zh_CH.dart
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = getLocaleFromLanguage(lang);

    prefs.language = lang;

    Get.updateLocale(locale!);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }


  Future<Locale> getCurrentLocale() async {
    Locale defaultLocale;

    if (prefs.language != '') {
      final locale =
          LocalizationService().getLocaleFromLanguage(prefs.language);

      defaultLocale = locale!;
    } else {
      List? languageList = await Devicelocale.preferredLanguages;
      String? languageCode;
      if(languageList!.length > 0)
        {
          languageCode = languageList[0];
        }
      else
        {
          languageCode = await Devicelocale.currentLocale;
        }
      CacheService cacheservice = Get.find<CacheService>();

      if(languageCode!.contains("zh") )
        {
          cacheservice.rxLanguage.value = "1";
          cacheservice.saveLanguage("1");
          defaultLocale = Locale(
            'zh',
            'CH',
          );
        }
      else
        {
          cacheservice.rxLanguage.value = "0";
          cacheservice.saveLanguage("0");
          defaultLocale = Locale(
            'en',
            'US',
          );
        }

    }

    return defaultLocale;
  }

  // String getCurrentLang() {
  //   return prefs.language != '' ? prefs.language : "Chinese";
  // }
}
















