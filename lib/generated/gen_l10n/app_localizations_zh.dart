


import 'app_localizations.dart';

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get homePage => 'Homepage';
}

/// The translations for Chinese, as used in China, using the Han script (`zh_Hans_CN`).
class AppLocalizationsZhHansCn extends AppLocalizationsZh {
  AppLocalizationsZhHansCn(): super('zh_Hans_CN');

  @override
  String get homePage => '主頁';
}

/// The translations for Chinese, as used in Taiwan, using the Han script (`zh_Hant_TW`).
class AppLocalizationsZhHantTw extends AppLocalizationsZh {
  AppLocalizationsZhHantTw(): super('zh_Hant_TW');

  @override
  String get homePage => '主頁';
}
