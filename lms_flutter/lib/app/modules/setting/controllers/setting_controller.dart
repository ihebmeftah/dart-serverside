import 'package:get/get.dart';
import 'package:lms_flutter/app/routes/app_pages.dart';
import 'package:lms_flutter/initclient.dart';

class SettingController extends GetxController {
  bool soundStatus = false;
  bool notificationStatus = false;

  void changeSound(bool v) {
    soundStatus = v;
    update(["sound"]);
  }

  void changeNotification(bool v) {
    notificationStatus = v;
    update(["notification"]);
  }

  void logout() async {
    await sessionManager.signOut();
    Get.offAllNamed(Routes.AUTH);
  }
}
