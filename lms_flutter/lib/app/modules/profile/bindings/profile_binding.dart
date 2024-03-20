import 'package:get/get.dart';

import 'package:lms_flutter/app/modules/profile/controllers/password_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordController>(() => PasswordController(), fenix: true);
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
