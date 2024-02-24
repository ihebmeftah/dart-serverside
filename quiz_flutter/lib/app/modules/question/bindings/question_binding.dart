import 'package:get/get.dart';

import 'package:quiz_flutter/app/modules/question/controllers/addquestion_controller.dart';

import '../controllers/question_controller.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddquestionController>(
      () => AddquestionController(),
    );
    Get.lazyPut<QuestionController>(
      () => QuestionController(),
    );
  }
}
