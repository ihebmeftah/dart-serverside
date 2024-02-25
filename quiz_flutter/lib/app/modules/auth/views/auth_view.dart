import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_flutter/app/routes/app_pages.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

import '../../../../main.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthView'),
        centerTitle: true,
      ),
      body: Center(
        child: SignInWithEmailButton(
          caller: client.modules.auth,
          onSignedIn: () {
            Get.offAllNamed(Routes.QUIZ);
          },
        ),
      ),
    );
  }
}
