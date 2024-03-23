import 'dart:developer';

import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';

import '../../../../initclient.dart';

class QuizesCatController extends GetxController with StateMixin {
  final categoryQuizes = <Quiz>[].obs;
  @override
  void onInit() {
    getQuizesByCategeroy();
    super.onInit();
  }

  Future<void> getQuizesByCategeroy() async {
    try {
      categoryQuizes(await client.quiz
          .getQuizesByCategeroy(int.parse(Get.parameters['id']!)));
      if (categoryQuizes.isEmpty) {
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
