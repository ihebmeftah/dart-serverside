import 'dart:developer';

import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';
import 'package:lms_flutter/initclient.dart';

class UsersController extends GetxController with StateMixin {
  final players = <Player>[].obs;
  final admins = <Admin>[].obs;

  @override
  void onInit() async {
    await getPlayers();
    await getAdmins();
    if (players.isEmpty && admins.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(null, status: RxStatus.success());
    }
    super.onInit();
  }

  Future getPlayers() async {
    try {
      players(await client.users.getPlayers());
      log(players.toString());
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      Get.snackbar("Somthing wrong", "$e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future getAdmins() async {
    try {
      admins(await client.users.getAdmins());
      log(admins.toString());
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      Get.snackbar("Somthing wrong", "$e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
