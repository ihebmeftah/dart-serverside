import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizPlayController extends GetxController {
  final PageController pageController = PageController();
  int correct = 0;
  int? selectedAnswer;
  bool? isCorrect;

  onSelectedAnswer(int index) async {
    selectedAnswer = index;
    update([index]);
    await Future.delayed(const Duration(milliseconds: 800));
    if (selectedAnswer == correct) {
      isCorrect = true;
    } else {
      isCorrect = false;
    }
    update([index]);
    await Future.delayed(const Duration(milliseconds: 800));
    selectedAnswer = null;
    isCorrect = null;
    await pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
    update();
  }
}
