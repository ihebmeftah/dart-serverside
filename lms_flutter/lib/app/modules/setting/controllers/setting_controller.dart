import 'package:get/get.dart';
import 'package:lms_flutter/app/routes/app_pages.dart';
import 'package:lms_flutter/client_services.dart';

class SettingController extends GetxController {
  final userInfo = ClientServices.session.signedInUser;
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
    await ClientServices.session.signOut();
    Get.offAllNamed(Routes.AUTH);
  }
}
