import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';

import '../../../../initclient.dart';

class QuizDetailsController extends GetxController with StateMixin {
  Rx<Quiz?> quiz = Rx(null);
  final form = GlobalKey<FormState>();
  final question = TextEditingController(), addInfo = TextEditingController();
  final questions = <Question>[].obs;
  @override
  void onInit() async {
    await getQuiz();
    super.onInit();
  }

  Future<void> getQuiz() async {
    try {
      quiz(await client.quiz.getQuiz(int.parse(Get.parameters['id']!)));
      await getQuestionsByQuiz();
      if (quiz.value == null) {
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

  Future<void> getQuestionsByQuiz() async {
    try {
      questions(await client.question.getQuestionsByQuiz(quiz.value!.id!));
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> createQuestion() async {
    try {
      if (form.currentState!.validate()) {
        await client.question.createQuestion(
            quizId: quiz.value!.id!,
            question: question.text,
            additionalInformation: addInfo.text);
        await getQuestionsByQuiz();
      }
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> deleteQuestion(int id) async {
    try {
      await client.question.deleteQuestion(id);
      await getQuestionsByQuiz();
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
