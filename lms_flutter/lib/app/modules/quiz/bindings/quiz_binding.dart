import 'package:get/get.dart';

import 'package:lms_flutter/app/modules/category/controllers/category_controller.dart';
import 'package:lms_flutter/app/modules/quiz/controllers/quiz_detail_controller.dart';

import '../controllers/quiz_controller.dart';

class QuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizDetailController>(
      () => QuizDetailController(),
      fenix: true,
    );
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
    Get.lazyPut<QuizController>(
      () => QuizController(),
    );
  }
}
