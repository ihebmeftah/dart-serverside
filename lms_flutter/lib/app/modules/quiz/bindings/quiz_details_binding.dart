import 'package:get/get.dart';

import 'package:lms_flutter/app/modules/quiz/controllers/quiz_details_controller.dart';

class QuizDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizDetailsController>(() => QuizDetailsController());
  }
}
