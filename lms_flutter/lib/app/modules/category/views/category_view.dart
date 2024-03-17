import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
              key: controller.form,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'field is required';
                      }
                      return null;
                    },
                    decoration:
                        const InputDecoration(hintText: "Category name"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.desc,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'field is required';
                      }
                      return null;
                    },
                    decoration:
                        const InputDecoration(hintText: "Category description"),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                      onPressed: controller.createCategory,
                      child: const Text("Add"))
                ],
              )),
        ),
        Expanded(
          child: controller.obx(
            (state) => ListView.builder(
              itemCount: controller.category.length,
              itemBuilder: (context, index) => ListTile(
                leading: Text(controller.category[index].id.toString()),
                title: Text(controller.category[index].name),
                subtitle: Text(controller.category[index].desc),
              ),
            ),
            onError: (error) => Text(error ?? "Somthing wrong"),
            onEmpty: const Center(child: Text("You don't have categroy")),
          ),
        )
      ],
    );
  }
}
