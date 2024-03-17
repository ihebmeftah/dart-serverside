import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';
import 'package:lms_flutter/initclient.dart';

class CategoryController extends GetxController with StateMixin {
  final category = <Category>[].obs;

  final name = TextEditingController();
  final desc = TextEditingController();

  final form = GlobalKey<FormState>();
  @override
  void onInit() async {
    await getCategroy();
    super.onInit();
  }

  Future<void> getCategroy() async {
    try {
      category(await client.category.getCategory());
      if (category.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(null, status: RxStatus.success());
      }
    } catch (e) {
      Get.snackbar("Somthing wrong", "$e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> createCategory() async {
    try {
      if (form.currentState!.validate()) {
        await client.category.createCategory(name: name.text, desc: desc.text);
        await getCategroy();
        name.clear();
        desc.clear();
      }
    } catch (e) {
      Get.snackbar("Somthing wrong", "$e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
