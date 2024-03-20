import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';

import '../../../../initclient.dart';

class QuizDetailController extends GetxController with StateMixin {
  final form = GlobalKey<FormState>();

  final question = TextEditingController();
  final additionalInformation = TextEditingController();
  Quiz? quiz;
  @override
  void onInit() async {
    await getQuiz();
    super.onInit();
  }

  Future<void> getQuiz() async {
    try {
      quiz = (await client.quiz.getQuiz(Get.arguments ?? quiz!.id!));
      if (quiz == null) {
        change(null, status: RxStatus.empty());
      } else {
        change(null, status: RxStatus.success());
      }
      log(quiz.toString(), name: "RESPONSE GET QUIZ BY ID : ");
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      Get.snackbar("Somthing wrong", "$e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void addQuestion() async {
    try {
      if (form.currentState!.validate()) {
        await client.question.createQuestion(
            quizId: quiz!.id!,
            point: 15,
            question: question.text,
            additionalInformation: additionalInformation.text);
        await getQuiz();
        question.clear();
        additionalInformation.clear();
        Get.back();
      }
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      Get.snackbar("Somthing wrong", "$e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void deleteQuestion(int id) async {
    try {
      await client.question.deleteQuestion(id);
      await getQuiz();
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      Get.snackbar("Somthing wrong", "$e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
