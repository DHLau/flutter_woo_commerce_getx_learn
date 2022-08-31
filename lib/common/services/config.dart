import 'dart:ui';

import 'package:flutter_woo_commerce_getx_learn/common/utils/storage.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../index.dart';

class ConfigService extends GetxService {
  static ConfigService get to => Get.find();

  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';
  Locale locale = PlatformDispatcher.instance.locale;

  final RxBool _isDarkModel = Get.isDarkMode.obs;
  bool get isDarkMode => _isDarkModel.value;

  Future<ConfigService> init() async {
    await getPlatform();
    return this;
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // 初始语言
  void initLocale() {
    var langCode = Storage().getString(Constants.storageLanguageCode);
    if (langCode.isEmpty) return;
    var index = Translation.supportedLocales.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = Translation.supportedLocales[index];
  }

  // 更改语言
  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }

  Future<void> swichThemeModel() async {
    _isDarkModel.value = !_isDarkModel.value;
    Get.changeTheme(
        _isDarkModel.value == true ? AppTheme.dark : AppTheme.light);
    await Get.forceAppUpdate();
    await Storage().setString(Constants.storageThemeCode,
        _isDarkModel.value == true ? "dark" : "light");
  }

  initTheme() {
    var themCode = Storage().getString(Constants.storageThemeCode);
    _isDarkModel.value = themCode == "dark" ? true : false;
    Get.changeTheme(themCode == "dark" ? AppTheme.dark : AppTheme.light);
  }

  @override
  void onReady() {
    super.onReady();
    initLocale();
    initTheme();
  }
}
