import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({Key? key}) : super(key: key);
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
