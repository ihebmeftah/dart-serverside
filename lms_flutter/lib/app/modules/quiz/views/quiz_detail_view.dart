import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/modules/quiz/controllers/quiz_detail_controller.dart';

class QuizDetailView extends GetView<QuizDetailController> {
  const QuizDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.bottomSheet(
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Form(
                      key: controller.form,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: controller.question,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'field is required';
                              }
                              return null;
                            },
                            decoration:
                                const InputDecoration(hintText: "Question"),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: controller.additionalInformation,
                            decoration: const InputDecoration(
                                hintText: "Additional Information"),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: controller.addQuestion,
                              child: const Text("Add"))
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: Colors.white);
            },
            label: const Text("Add questions")),
        body: controller.obx((state) => SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name  : ${controller.quiz?.name}"),
                    Text("Description  : ${controller.quiz?.desc ?? "--"}"),
                    Text(
                        "Total quiz point  : ${controller.quiz?.points ?? "--"}"),
                    const Text("Questions :"),
                    ...List.generate(
                      controller.quiz!.question!.length,
                      (index) => ListTile(
                        trailing: IconButton(
                            onPressed: () => controller.deleteQuestion(
                                controller.quiz!.question![index].id!),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                        title: Text(controller.quiz!.question![index].question),
                        subtitle: Text(controller
                            .quiz!.question![index].additionalInformation),
                      ),
                    )
                  ]),
            )));
  }
}
