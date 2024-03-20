import 'package:get/get.dart';

import '../controllers/quizes_cat_controller.dart';

class QuizesCatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizesCatController>(
      () => QuizesCatController(),
    );
  }
}
