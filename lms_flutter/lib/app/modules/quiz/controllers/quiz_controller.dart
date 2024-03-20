import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';
import 'package:lms_flutter/app/modules/category/controllers/category_controller.dart';

import '../../../../initclient.dart';

class QuizController extends GetxController with StateMixin {
  final form = GlobalKey<FormState>();

  final name = TextEditingController();
  final desc = TextEditingController();
  final CategoryController categoryController = Get.find();

  final quizes = <Quiz>[].obs;

  Rx<Category?> selectedCategory = Rx(null);

  @override
  void onInit() async {
    await getQuizes();
    super.onInit();
  }

  Future<void> getQuizes() async {
    try {
      quizes(await client.quiz.getQuizes());
      if (quizes.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(null, status: RxStatus.success());
      }
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      Get.snackbar("Somthing wrong", "$e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> createQuiz() async {
    try {
      if (form.currentState!.validate()) {
        await client.quiz.createQuiz(
          categoryId: selectedCategory.value!.id!,
          name: name.text.trim(),
          desc: desc.text.trim(),
        );
        await getQuizes();
        name.clear();
        desc.clear();
        selectedCategory.update((val) {
          val = null;
        });
      }
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      Get.snackbar("Somthing wrong", "$e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void selectCategory(Category? v) {
    selectedCategory(v);
  }
}
