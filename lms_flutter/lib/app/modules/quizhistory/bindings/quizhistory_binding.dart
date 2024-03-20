import 'package:get/get.dart';

import '../controllers/quizhistory_controller.dart';

class QuizhistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizhistoryController>(
      () => QuizhistoryController(),
    );
  }
}
