import 'package:get/get.dart';


import '../../category/controllers/category_controller.dart';
import '../controllers/quiz_controller.dart';

class QuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
    Get.lazyPut<QuizController>(
      () => QuizController(),
    );
  }
}
