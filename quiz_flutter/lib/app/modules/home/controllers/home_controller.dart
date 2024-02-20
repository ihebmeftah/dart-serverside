import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz_client/quiz_client.dart';
import 'package:quiz_flutter/main.dart';

class HomeController extends GetxController with StateMixin {
  final quizes = <Quiz>[].obs;
  final formKey = GlobalKey<FormState>();
  final nameInput = TextEditingController();
  final descInput = TextEditingController();
  @override
  void onInit() async {
    await getQuizes();
    super.onInit();
  }

  Future<void> getQuizes() async {
    try {
      change(null, status: RxStatus.loading());
      quizes(await client.quiz.getQuizes());
      if (quizes.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        log(quizes.first.questions.toString());
        change(null, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      log(e.toString());
    }
  }

  Future<void> createQuiz() async {
    try {
      if (formKey.currentState!.validate()) {
        await client.quiz
            .createQuiz(name: nameInput.text, description: descInput.text);
        await getQuizes();
        client.question.addQuestionToQuiz(question: "question 1 ", quizId: 1);

        nameInput.clear();
        descInput.clear();
      }
    } catch (e) {
      change(null,
          status: RxStatus.error("PROBLEM IN CREATE QUIZ METHODE : $e"));
      log(e.toString());
    }
  }

  Future<void> changeQuizStatus(int index, Status status) async {
    try {
      await client.quiz
          .updateQuizStatus(quizId: quizes[index].id!, status: status);
      await getQuizes();
      Get.back();
    } catch (e) {
      change(null,
          status: RxStatus.error("PROBLEM IN CHANGE QUIZ STATUS METHODE : $e"));
      log(e.toString());
    }
  }

  Future<void> deleteQuiz(int index) async {
    try {
      await client.quiz.deleteQuiz(quizes[index]);
      await getQuizes();
    } catch (e) {
      change(null,
          status: RxStatus.error("PROBLEM IN DELETE QUIZ METHODE : $e"));
      log(e.toString());
    }
  }
}
