import 'package:get/get.dart';
import 'package:lms_flutter/app/routes/app_pages.dart';

import '../../../../initclient.dart';

class HomeController extends GetxController {
  var user = sessionManager.signedInUser;

  void logout() async {
    await sessionManager.signOut();
    Get.offAllNamed(Routes.AUTH);
  }
}
