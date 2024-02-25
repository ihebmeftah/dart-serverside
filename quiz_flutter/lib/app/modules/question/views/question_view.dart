import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/question_controller.dart';

class QuestionView extends GetView<QuestionController> {
  const QuestionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: controller.obx((state) => Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            "Quiz : ",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              controller.quiz.value!.name,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          controller.quiz.value!.description,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Form(
                      key: controller.formKey,
                      child: TextFormField(
                        controller: controller.questInput,
                        decoration: InputDecoration(
                            filled: true,
                            hintText: "Write your question...",
                            suffixIcon: GetBuilder<QuestionController>(
                                id: "addbutton",
                                builder: (_) {
                                  return IconButton(
                                      onPressed: !controller.enablebutton
                                          ? null
                                          : controller.addQuestionToQuiz,
                                      icon: Icon(
                                        Icons.add_box,
                                        color: controller.enablebutton
                                            ? Colors.blue
                                            : Colors.grey,
                                      ));
                                })),
                        onChanged: controller.changeEnableButtin,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field required";
                          }
                          return null;
                        },
                      )),
                  Expanded(child: GetX<QuestionController>(builder: (_) {
                    return controller.quiz.value!.questions!.isEmpty
                        ? const Center(
                            child: Text("This quiz don't have any question"),
                          )
                        : ListView.builder(
                            itemCount: controller.quiz.value?.questions?.length,
                            itemBuilder: (context, index) => Card(
                              child: ExpansionTile(
                                title: Text(
                                    "${index + 1} - ${controller.quiz.value!.questions![index].question}"),
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text('Add option')),
                                  TextButton.icon(
                                      style: TextButton.styleFrom(
                                          foregroundColor: Colors.red),
                                      onPressed: () =>
                                          controller.deleteQuestion(index),
                                      icon: const Icon(Icons.delete),
                                      label: const Text('Delete question'))
                                ],
                              ),
                            ),
                          );
                  }))
                ],
              ),
            )));
  }
}
