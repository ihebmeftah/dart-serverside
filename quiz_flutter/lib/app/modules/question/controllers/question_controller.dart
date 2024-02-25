import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_client/quiz_client.dart';

import '../../../../main.dart';

class QuestionController extends GetxController with StateMixin {
  final int quizId = int.parse(Get.parameters["quizId"]!);
  Rx<Quiz?> quiz = Rx(null);
  final questInput = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool enablebutton = false;
  @override
  void onInit() async {
    await getOneQuiz();
    super.onInit();
  }

  Future<void> getOneQuiz() async {
    try {
      change(null, status: RxStatus.loading());
      quiz(await client.quiz.getOneQuiz(id: quizId));
      log(quiz.toString());
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      log(e.toString());
    }
  }

  Future<void> deleteQuestion(int index) async {
    try {
      await client.question.deleteQuestion(quiz.value!.questions![index]);
      quiz.update((val) {
        val!.questions!.removeAt(index);
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      log(e.toString());
    }
  }

  Future<void> addQuestionToQuiz() async {
    try {
      if (formKey.currentState!.validate()) {
        final Question createdQuestion = await client.question
            .addQuestionToQuiz(question: questInput.text, quizId: quizId);
        quiz.update((val) {
          val!.questions!.add(createdQuestion);
        });
      }
      log(quiz.toString());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      log(e.toString());
    }
  }

  changeEnableButtin(String v) {
    if (v.isEmpty) {
      enablebutton = false;
    } else {
      enablebutton = true;
    }
    update(['addbutton']);
  }
}
