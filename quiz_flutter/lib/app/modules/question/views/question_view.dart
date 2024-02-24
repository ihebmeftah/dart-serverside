import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/question_controller.dart';

class QuestionView extends GetView<QuestionController> {
  const QuestionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuestionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'QuestionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
