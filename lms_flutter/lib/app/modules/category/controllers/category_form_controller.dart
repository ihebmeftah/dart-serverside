import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';
import 'package:lms_flutter/app/modules/category/controllers/category_controller.dart';

import '../../../../client_services.dart';

class CategoryFormController extends GetxController with StateMixin {
  final form = GlobalKey<FormState>();
  final catName = TextEditingController(), catDesc = TextEditingController();
  Rx<Category?> category = Rx<Category?>(null);
  final int? id = Get.arguments as int?;

  @override
  void onInit() async {
    await getCategoryById();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> getCategoryById() async {
    try {
      if (id != null) {
        category(await ClientServices.client.category.getCategoryById(id!));
        catName.text = category.value!.name;
        catDesc.text = category.value!.desc;
      }
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void createCategroy() async {
    try {
      if (form.currentState!.validate()) {
        if (id == null) {
          await ClientServices.client.category.createCategory(
            name: catName.text,
            desc: catDesc.text,
          );
        } else {
          await ClientServices.client.category.updateCategory(
            id: id!,
            name: catName.text,
            desc: catDesc.text,
          );
        }
        await Get.find<CategoryController>().getCategories();
        catName.clear();
        catDesc.clear();
        Get.back();
        Get.snackbar(
          "Done",
          "Category ${id == null ? "created" : "updated"} successfully",
        );
      }
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void deleteCategory() async {
    try {
      if (id != null) {
        await ClientServices.client.category.deleteCategroy(id!);
        await Get.find<CategoryController>().getCategories();
      }
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
