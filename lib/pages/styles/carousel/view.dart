import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class CarouselPage extends GetView<DHCarouselController> {
  const CarouselPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("CarouselPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DHCarouselController>(
      init: DHCarouselController(),
      id: "carousel",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("carousel")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
