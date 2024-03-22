import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class PlayerController extends GetxController {

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
