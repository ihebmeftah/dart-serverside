import 'package:get/get.dart';

import '../controllers/quiz_play_controller.dart';

class QuizPlayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizPlayController>(
      () => QuizPlayController(),
    );
  }
}
