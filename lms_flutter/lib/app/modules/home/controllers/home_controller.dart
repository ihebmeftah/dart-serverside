import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';
import 'package:lms_flutter/app/routes/app_pages.dart';

import '../../../../initclient.dart';

class HomeController extends GetxController with StateMixin {
  var user = sessionManager.signedInUser;
  int nbPlayer = 0, nbAdmins = 0;
  int currentScreen = 0;
  @override
  void onInit() async {
    await getUsersnb();
    super.onInit();
  }

  Future<void> getUsersnb() async {
    try {
      List usernb = await client.users.getUsersNumber();
      nbAdmins = usernb.first;
      nbPlayer = usernb.last;
      change(null, status: RxStatus.success());
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      Get.snackbar("Somthing wrong", "$e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }

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
