import 'package:flutter_woo_commerce_getx_learn/pages/system/login/index.dart';
import 'package:flutter_woo_commerce_getx_learn/pages/system/splash/view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static var list = <GetPage>[
    GetPage(
        name: "/",
        binding: LoginBinding(),
        page: () {
          return const LoginPage();
        }),
    GetPage(
        name: "/spalsh",
        page: () {
          return const SplashPage();
        })
  ];
}
