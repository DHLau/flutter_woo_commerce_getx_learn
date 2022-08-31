import 'dart:developer';

import 'package:flutter_woo_commerce_getx_learn/common/routers/names.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'common/index.dart';
import 'global.dart';

void main(List<String> args) async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ConfigService.to.isDarkMode ? AppTheme.dark : AppTheme.light,
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.stylesStylesIndex,
      getPages: RoutePages.list,
      navigatorObservers: [RoutePages.observer],
      translations: Translation(),
      localizationsDelegates: Translation.localizationsDelegates,
      supportedLocales: Translation.supportedLocales,
      locale: ConfigService.to.locale,
      fallbackLocale: Translation.fallbackLocale,
    );
  }
}
