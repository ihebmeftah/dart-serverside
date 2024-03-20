import 'package:get/get.dart';
import 'package:lms_flutter/app/routes/app_pages.dart';

class HomeController extends GetxController {
  int category = 8;
  void changeNav(int i) {
    switch (i) {
      case 1:
        Get.toNamed(Routes.QUIZHISTORY);
        break;
      default:
    }
  }
}
