import 'dart:developer';

import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';

import '../../../../client_services.dart';

class CategoryController extends GetxController with StateMixin {
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


}
