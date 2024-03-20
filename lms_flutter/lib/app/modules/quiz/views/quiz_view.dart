import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/modules/quiz/views/quiz_detail_view.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
                key: controller.form,
                child: Column(
                  children: [
                    GetX<QuizController>(builder: (c) {
                      return DropdownButtonFormField(
                          value: controller.selectedCategory.value,
                          decoration: const InputDecoration(
                              hintText: "Select quiz category"),
                          items: controller.categoryController.category
                              .map((element) => DropdownMenuItem(
                                  value: element, child: Text(element.name)))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'field is required';
                            }
                            return null;
                          },
                          onChanged: controller.selectCategory);
                    }),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'field is required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(hintText: "Quiz name"),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.desc,
                      decoration:
                          const InputDecoration(hintText: "Quiz description"),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: controller.createQuiz,
                        child: const Text("Add"))
                  ],
                )),
          ),
          Expanded(
            child: controller.obx(
              (state) => ListView.builder(
                itemCount: controller.quizes.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () => Get.to(() => const QuizDetailView(),
                      arguments: controller.quizes[index].id!),
                  trailing: IconButton(
                      onPressed: () =>
                          controller.deleteQuiz(controller.quizes[index].id!),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                  title: Text(controller.quizes[index].name),
                  subtitle: Text(controller.quizes[index].desc ?? '--'),
                ),
              ),
              onError: (error) => Text(error ?? "Somthing wrong"),
              onEmpty: const Center(child: Text("You don't have categroy")),
            ),
          )
        ],
      ),
    );
  }
}
