import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';

import '../../../../client_services.dart';

class QuizDetailsController extends GetxController with StateMixin {
  Rx<Quiz?> quiz = Rx(null);
  final form = GlobalKey<FormState>(), optionForm = GlobalKey<FormState>();
  final question = TextEditingController(),
      addInfo = TextEditingController(),
      optiontext = TextEditingController();

  bool isCorrect = false;
  final questions = <Question>[].obs;
  @override
  void onInit() async {
    await getQuiz();
    super.onInit();
  }

  Future<void> getQuiz() async {
    try {
      quiz(await ClientServices.client.quiz.getQuiz(int.parse(Get.parameters['id']!)));
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
      questions(await ClientServices.client.question.getQuestionsByQuiz(quiz.value!.id!));
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
        await ClientServices.client.question.createQuestion(
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
      await ClientServices.client.question.deleteQuestion(id);
      await getQuestionsByQuiz();
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> createOption(int questionId) async {
    try {
      if (optionForm.currentState!.validate()) {
        await ClientServices.client.option.createOption(
            questionId: questionId,
            text: optiontext.text,
            isCorrect: isCorrect);
        await getQuestionsByQuiz();
        optiontext.clear();
        isCorrect = false;
        update(["option"]);
      }
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> deleteOption(int id) async {
    try {
      await ClientServices.client.option.deleteOption(id);
      await getQuestionsByQuiz();
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  switchCorrect(bool b) {
    isCorrect = b;
    update(["option"]);
  }
}
