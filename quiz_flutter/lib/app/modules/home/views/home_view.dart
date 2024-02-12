import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_client/quiz_client.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
            child: Container(
          child: controller.obx(
            (state) => ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: controller.quizes.length,
              itemBuilder: (context, index) => Card(
                shape: const LinearBorder(),
                color: controller.quizes[index].status == Status.accepted
                    ? Colors.green.shade100
                    : controller.quizes[index].status == Status.pending
                        ? Colors.blue.shade100
                        : Colors.red.shade100,
                child: ListTile(
                  trailing: IconButton(
                      onPressed: () => controller.deleteQuiz(index),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                  onTap: () {
                    Get.bottomSheet(
                        Container(
                          width: Get.width,
                          margin: const EdgeInsets.all(20),
                          child: Wrap(
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.done_all),
                                title: const Text('Validate'),
                                onTap: () => controller.changeQuizStatus(
                                    index, Status.accepted),
                              ),
                              ListTile(
                                leading: const Icon(Icons.remove),
                                title: const Text('Reject'),
                                onTap: () => controller.changeQuizStatus(
                                    index, Status.rejected),
                              ),
                              ListTile(
                                leading: const Icon(Icons.pending),
                                title: const Text('Pending'),
                                onTap: () => controller.changeQuizStatus(
                                    index, Status.pending),
                              ),
                            ],
                          ),
                        ),
                        backgroundColor: Colors.white);
                  },
                  title: Row(
                    children: [
                      Text(controller.quizes[index].name),
                      const SizedBox(width: 5),
                      Text(
                        '(${controller.quizes[index].status.name.capitalizeFirst!})',
                        style: TextStyle(
                          color:
                              controller.quizes[index].status == Status.accepted
                                  ? Colors.green.shade700
                                  : controller.quizes[index].status ==
                                          Status.pending
                                      ? Colors.blue.shade700
                                      : Colors.red.shade700,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(controller.quizes[index].description),
                ),
              ),
            ),
            onEmpty: const Center(child: Text("You don't have quizes")),
            onError: (error) => Center(child: Text(error!)),
          ),
        )),
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.height / 4),
          color: Colors.teal,
          child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: controller.nameInput,
                    validator: (value) {
                      return value!.isEmpty ? "Field is required" : null;
                    },
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Add quiz name",
                        label: Text("Name")),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.descInput,
                    validator: (value) {
                      return value!.isEmpty ? "Field is required" : null;
                    },
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Add quiz description",
                        label: Text("Description")),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(Get.width, 55),
                          backgroundColor: Colors.blue),
                      onPressed: controller.createQuiz,
                      child: const Text(
                        'Add new quiz',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )),
        )),
      ],
    ));
  }
}
