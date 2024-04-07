import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';

import '../../../../client_services.dart';

class RankController extends GetxController with StateMixin {
  final form = GlobalKey<FormState>();
  final rankname = TextEditingController(),
      rankmin = TextEditingController(),
      rankmax = TextEditingController();
  final ranklevel = [1, 2, 3, 4, 5];
  int? selectedRankLevel;
  final ranks = <Rank>[].obs;

  @override
  void onInit() async {
    await getRanks();
    super.onInit();
  }

  Future<void> getRanks() async {
    try {
      ranks(await ClientServices.client.rank.getRanks());
      if (ranks.isEmpty) {
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

  void createRank() async {
    try {
      if (form.currentState!.validate()) {
        await ClientServices.client.rank.createRank(
            name: rankname.text,
            minpoints: int.parse(rankmin.text),
            maxpoints: int.parse(rankmax.text),
            level: selectedRankLevel!);
        await getRanks();
        rankname.clear();
        rankmin.clear();
        rankmax.clear();
        selectedRankLevel = null;
      }
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void deleteRank(int id) async {
    try {
      await ClientServices.client.rank.deleteRank(id);
      await getRanks();
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void selectLevel(int? v) {
    selectedRankLevel = v;
  }
}
