import 'package:get/get.dart';

import 'package:lms_flutter/app/modules/category/controllers/category_form_controller.dart';

import '../controllers/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryFormController>(() => CategoryFormController(),
        fenix: true);
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
  }
}
