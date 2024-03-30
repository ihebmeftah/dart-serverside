import 'package:get/get.dart';
import 'package:lms_flutter/client_services.dart';

import '../../../routes/app_pages.dart';

class AdminController extends GetxController {
  final admin = ClientServices.session.signedInUser;
  int index = 0;

  void switchView(int i) {
    index = i;
    update();
  }

  void logout() async {
    await ClientServices.session.signOut();
    Get.offAllNamed(Routes.AUTH);
  }
}
