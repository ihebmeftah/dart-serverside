import 'package:get/get.dart';

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
}
