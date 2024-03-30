import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';
import 'package:lms_flutter/app/modules/category/controllers/category_controller.dart';

import '../../../../client_services.dart';

class QuizController extends GetxController with StateMixin {
  CategoryController categoryController = Get.find();
  final form = GlobalKey<FormState>();
  final quizName = TextEditingController(), quizDesc = TextEditingController();
  final quizes = <Quiz>[].obs;
  Category? selectedCategroy;
  @override
  void onInit() {
    getQuizes();
    super.onInit();
  }

  Future<void> getQuizes() async {
    try {
      quizes(await ClientServices.client.quiz.getQuizes());
      if (quizes.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(null, status: RxStatus.success());
      }
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void createQuiz() async {
    try {
      if (form.currentState!.validate()) {
        await ClientServices.client.quiz.createQuiz(
            name: quizName.text,
            desc: quizDesc.text,
            categoryId: selectedCategroy!.id!);
        quizName.clear();
        quizDesc.clear();
        await getQuizes();
      }
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void deleteQuiz(int id) async {
    try {
      await ClientServices.client.quiz.deleteQuiz(id);
      await getQuizes();
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void selectCategory(c) {
    selectedCategroy = c;
  }
}
