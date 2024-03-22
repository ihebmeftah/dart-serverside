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
          await navigateToNextRoute(user.scopeNames);
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

  Future<void> navigateToNextRoute(List<String> roles) async {
    if (GetPlatform.isWeb) {
      if (roles.contains(Roles.admin.name)) {
        Get.offAllNamed(Routes.ADMIN);
      } else if (roles.contains(Roles.player.name)) {
        await sessionManager.signOut();
        Get.snackbar("Error", "Only admin hava access to web platfrom");
      }
    } else if (GetPlatform.isAndroid ||
        GetPlatform.isIOS ||
        GetPlatform.isMobile) {
      if (roles.contains(Roles.player.name)) {
        Get.offAllNamed(Routes.PLAYER);
      } else if (roles.contains(Roles.admin.name)) {
        await sessionManager.signOut();
        Get.snackbar("Error", "Only player have access to mobile platfrom");
      }
    }
  }

  Future<void> registre() async {
    if (registrekey.currentState!.validate()) {
      final user = await authController.createAccountRequest(
          username.text, createemail.text, createpwd.text);
      if (user) {
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
      } else {
        Get.snackbar("Account exist", "this email is used in another account ");
      }
    }
  }

  void verifyAccount() async {
    try {
      if (verificationkey.currentState!.validate()) {
        var user = await authController.validateAccount(
            createemail.text, verificationCode.text);
        if (user != null) {
          user = await authController.signIn(createemail.text, createpwd.text);
          await client.users
              .createUsers(isAdmin: GetPlatform.isWeb, userId: user!.id!);
          await navigateToNextRoute(user.scopeNames);
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
