import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_client/quiz_client.dart';
import 'package:quiz_flutter/app/routes/app_pages.dart';

import '../../../../main.dart';

class QuizController extends GetxController with StateMixin {
  final quizes = <Quiz>[].obs;
  final formKey = GlobalKey<FormState>();
  final nameInput = TextEditingController();
  final descInput = TextEditingController();
  @override
  void onInit() async {
    log(sessionManager.signedInUser.toString());
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
        log(quizes.toString());
        change(null, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      log(e.toString());
    }
  }

  Future<void> changeQuizStatus(int index, Status status) async {
    try {
      await client.quiz
          .updateQuizStatus(quizId: quizes[index].id!, status: status);
      Get.back();
      quizes[index].status = status;
      update([index]);
    } catch (e) {
      change(null,
          status: RxStatus.error("PROBLEM IN CHANGE QUIZ STATUS METHODE : $e"));
      log(e.toString());
    }
  }

  Future<void> deleteQuiz(int index) async {
    try {
      change(null, status: RxStatus.loading());
      final int deletedId = await client.quiz.deleteQuiz(quizes[index]);
      Get.back();
      quizes.removeWhere((element) => element.id == deletedId);
      if (quizes.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        log(quizes.toString());
        change(null, status: RxStatus.success());
      }
    } catch (e) {
      change(null,
          status: RxStatus.error("PROBLEM IN DELETE QUIZ METHODE : $e"));
      log(e.toString());
    }
  }

  Future<void> createQuiz() async {
    try {
      if (formKey.currentState!.validate()) {
        change(null, status: RxStatus.loading());
        final Quiz createdQuiz = await client.quiz
            .createQuiz(name: nameInput.text, description: descInput.text);
        quizes.add(createdQuiz);
        change(null, status: RxStatus.success());
        Get.back();
      }
    } catch (e) {
      change(null,
          status: RxStatus.error("PROBLEM IN CREATE QUIZ METHODE : $e"));
      log(e.toString());
    }
  }

  void logout() async {
    await sessionManager.signOut();
    Get.offAllNamed(Routes.AUTH);
  }
}
