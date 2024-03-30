import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';

import '../../../../client_services.dart';

class CategoryController extends GetxController with StateMixin {
  final form = GlobalKey<FormState>();
  final catName = TextEditingController(), catDesc = TextEditingController();
  final categories = <Category>[].obs;
  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    try {
      categories(await ClientServices.client.category.getCategory());
      if (categories.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(null, status: RxStatus.success());
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
        await ClientServices.client.category.createCategory(
          name: catName.text,
          desc: catDesc.text,
        );
        catName.clear();
        catDesc.clear();
        await getCategories();
      }
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void deleteCategory(int id) async {
    try {
      await ClientServices.client.category.deleteCategroy(id);
      await getCategories();
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
