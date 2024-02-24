import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'QuizView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
