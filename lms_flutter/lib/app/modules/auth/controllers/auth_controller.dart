import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_client/lms_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../../../initclient.dart';
import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
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
        final serverResponse =
            await client.users.login(email: email.text, password: pwd.text);
        if (serverResponse.success) {
          final sessionManager = await SessionManager.instance;

          await sessionManager.registerSignedInUser(
            serverResponse.userInfo!,
            serverResponse.keyId!,
            serverResponse.key!,
          );
          navigateToNextRoute(serverResponse.userInfo!.scopeNames);
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
    try {
      if (registrekey.currentState!.validate()) {
        final serverResponse = await client.users.register(
            isAdmin: GetPlatform.isWeb && GetPlatform.isMobile == false,
            name: username.text,
            email: createemail.text,
            password: createpwd.text);
        if (serverResponse.success) {
          final sessionManager = await SessionManager.instance;
          await sessionManager.registerSignedInUser(
            serverResponse.userInfo!,
            serverResponse.keyId!,
            serverResponse.key!,
          );
          navigateToNextRoute(serverResponse.userInfo!.scopeNames);
        }
      }
    } on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  void verifyAccount() async {
    try {} on AppException catch (e) {
      Get.snackbar(e.errorType.name, e.message);
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }
}
