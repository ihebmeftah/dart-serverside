import 'package:get/get.dart';
import 'package:lms_flutter/app/modules/category/controllers/category_controller.dart';

import '../../../routes/app_pages.dart';

class PlayerController extends GetxController {
  CategoryController categoryController = Get.find<CategoryController>();
  void changeNav(int i) {
    switch (i) {
      case 1:
        Get.toNamed(Routes.QUIZHISTORY);
        break;
      default:
    }
  }
}
