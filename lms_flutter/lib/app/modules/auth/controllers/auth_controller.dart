import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

import '../../../../initclient.dart';
import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  final authController = EmailAuthController(client.modules.auth);

  final loginkey = GlobalKey<FormState>();
  final registrekey = GlobalKey<FormState>();
  final verificationkey = GlobalKey<FormState>();

  final email = TextEditingController();
  final pwd = TextEditingController();

  final username = TextEditingController();
  final createemail = TextEditingController();
  final createpwd = TextEditingController();
  final verificationCode = TextEditingController();
  void login() async {
    try {
      if (loginkey.currentState!.validate()) {
        final user = await authController.signIn(email.text, pwd.text);
        if (user != null) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar("Error", "user not found");
        }
      }
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  Future<void> registre() async {
    if (registrekey.currentState!.validate()) {
      await authController.createAccountRequest(
          username.text, createemail.text, createpwd.text);
      Get.defaultDialog(
          barrierDismissible: false,
          title: "Verfication code",
          middleText: "Wrtie verification code",
          onConfirm: verifyAccount,
          content: Form(
              key: verificationkey,
              child: TextFormField(
                controller: verificationCode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field is required";
                  }
                  return null;
                },
              )));
    }
  }

  void verifyAccount() async {
    try {
      if (verificationkey.currentState!.validate()) {
        var user = await authController.validateAccount(
            createemail.text, verificationCode.text);
        if (user != null) {
          user = await authController.signIn(createemail.text, createpwd.text);
          final result = await client.users
              .createUsers(isAdmin: GetPlatform.isWeb, userId: user!.id!);
          Get.offAllNamed(Routes.HOME);
          Get.snackbar("Done", result);
        } else {
          Get.snackbar("Error", "verififcation code incorrect");
        }
      }
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }
}
