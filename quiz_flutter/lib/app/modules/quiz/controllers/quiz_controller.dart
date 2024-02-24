import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_client/quiz_client.dart';

import '../../../../main.dart';

class QuizController extends GetxController with StateMixin {
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
        log(quizes.first.toString());
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
      await getQuizes();
      Get.back();
    } catch (e) {
      change(null,
          status: RxStatus.error("PROBLEM IN CHANGE QUIZ STATUS METHODE : $e"));
      log(e.toString());
    }
  }
}
