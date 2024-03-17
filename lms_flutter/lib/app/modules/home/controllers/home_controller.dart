import 'package:get/get.dart';
import 'package:lms_flutter/app/routes/app_pages.dart';

import '../../../../initclient.dart';

class HomeController extends GetxController {
  var user = sessionManager.signedInUser;

  int currentScreen = 0;
  changeView(int i) {
    int oldScreen = currentScreen;
    currentScreen = i;
    update([oldScreen, currentScreen, "body"]);
    Get.back();
  }

  void logout() async {
    await sessionManager.signOut();
    Get.offAllNamed(Routes.AUTH);
  }
}
