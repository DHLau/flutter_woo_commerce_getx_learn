import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/storage.dart';
import 'package:get/get.dart';
import 'common/index.dart';

class Global {
  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Future.wait([
      Get.putAsync<ConfigService>(() async => await ConfigService().init()),
    ]).then((value) => null);
    await Storage().init();
    Get.put<WPHttpService>(WPHttpService());
  }
}
