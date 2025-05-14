import 'package:get/get.dart';

class DHCarouselController extends GetxController {
  DHCarouselController();

  _initData() {
    update(["carousel"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
