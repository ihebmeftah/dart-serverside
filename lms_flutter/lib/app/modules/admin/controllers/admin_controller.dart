import 'package:get/get.dart';
import 'package:lms_flutter/initclient.dart';

import '../../../routes/app_pages.dart';

class AdminController extends GetxController {
  final admin = sessionManager.signedInUser;
  int index = 0;

  void switchView(int i) {
    index = i;
    update();
  }

  void logout() async {
    await sessionManager.signOut();
    Get.offAllNamed(Routes.AUTH);
  }
}
