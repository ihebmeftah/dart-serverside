import 'package:get/get.dart';
import 'package:lms_flutter/app/modules/category/controllers/category_controller.dart';

import '../controllers/player_controller.dart';

class PlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
    Get.lazyPut<PlayerController>(
      () => PlayerController(),
    );
  }
}
