import 'package:get/get.dart';

import 'package:quiz_flutter/app/modules/quiz/controllers/addquiz_controller.dart';

import '../controllers/quiz_controller.dart';

class QuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddquizController>(
      () => AddquizController(),
    );
    Get.lazyPut<QuizController>(
      () => QuizController(),
    );
  }
}
