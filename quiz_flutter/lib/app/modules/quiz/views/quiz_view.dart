import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_client/quiz_client.dart';
import 'package:quiz_flutter/app/routes/app_pages.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({super.key});
  @override
  Widget build(BuildContext context) {
    log("Build");
    return Scaffold(
        appBar: AppBar(title: const Text('Dashboard quizes')),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.bottomSheet(
                SizedBox(
                  height: Get.height / 1.4,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Write quiz name',
                              ),
                              controller: controller.nameInput,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Field required";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Write quiz descriptions',
                              ),
                              maxLines: 4,
                              controller: controller.descInput,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Field required";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                                onPressed: controller.createQuiz,
                                child: const Text('Added'))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                isScrollControlled: true,
                backgroundColor: Colors.white,
              ).whenComplete(() {
                controller.nameInput.clear();
                controller.descInput.clear();
              });
            },
            icon: const Icon(Icons.add),
            label: const Text("Add quiz")),
        body: controller.obx((state) {
          log("controller.obx Build ");
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 10),
            itemCount: controller.quizes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Wrap(
                          children: <Widget>[
                            ListTile(
                              title:
                                  const Text('Go add question for this quiz'),
                              onTap: () => Get.toNamed(
                                  '${Routes.QUESTION}/${controller.quizes[index].id}'),
                            ),
                            ListTile(
                              title: const Text('Accepted'),
                              onTap: () => controller.changeQuizStatus(
                                  index, Status.accepted),
                            ),
                            ListTile(
                              title: const Text('Pending'),
                              onTap: () => controller.changeQuizStatus(
                                  index, Status.pending),
                            ),
                            ListTile(
                              title: const Text('Rejected'),
                              onTap: () => controller.changeQuizStatus(
                                  index, Status.rejected),
                            ),
                            ListTile(
                              title: const Text('Delete'),
                              onTap: () => controller.deleteQuiz(index),
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: Colors.white);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GetBuilder<QuizController>(
                        id: index,
                        builder: (_) {
                          log("Getx build in listtile Build $index ");
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  radius: 22,
                                  backgroundColor:
                                      controller.quizes[index].status ==
                                              Status.accepted
                                          ? Colors.green.shade100
                                          : controller.quizes[index].status ==
                                                  Status.rejected
                                              ? Colors.red.shade100
                                              : Colors.blue.shade100,
                                  child: Text(
                                    controller.quizes[index].id.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Text(
                                controller.quizes[index].name.capitalize!,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ".${controller.quizes[index].status.name.toUpperCase()}.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  backgroundColor:
                                      controller.quizes[index].status ==
                                              Status.accepted
                                          ? Colors.green.shade900
                                          : controller.quizes[index].status ==
                                                  Status.rejected
                                              ? Colors.red.shade900
                                              : Colors.blue.shade900,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(controller.quizes[index].description),
                            ],
                          );
                        }),
                  ),
                ),
              );
            },
          );
        },
            onError: (error) => Text("$error"),
            onEmpty: const Center(child: Text("You don't have any quize"))));
  }
}
