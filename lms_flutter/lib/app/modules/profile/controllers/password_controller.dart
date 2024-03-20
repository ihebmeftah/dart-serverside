import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
   final TextEditingController currPwd = TextEditingController(),
      newPwd = TextEditingController(),
      reenterPwd = TextEditingController();

  bool buttonStatus = false;

  void writePwd(String? v) {
    if (newPwd.text.isNotEmpty &&
        currPwd.text.isNotEmpty &&
        reenterPwd.text.isNotEmpty) {
      buttonStatus = true;
    } else {
      buttonStatus = false;
    }
    update(["button"]);
  }
}
