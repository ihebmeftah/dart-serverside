import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';
import 'package:lms_flutter/app/modules/auth/controllers/auth_controller.dart';

import '../../../component/appelevatedbutton.dart';
import '../../../component/apptextformfield.dart';
import '../../../core/themes/themes.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemesApp.primary,
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Center(
          child: SizedBox(
            width: GetPlatform.isWeb ? Get.width / 2.2 : Get.width,
            child: Form(
              key: controller.registrekey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextFormField(
                    controller: controller.username,
                    label: "Username",
                    hint: "John Doe",
                  ),
                  AppTextFormField(
                    isEmail: true,
                    controller: controller.createemail,
                    label: "Email Address",
                    hint: "johndoe@email.com",
                  ),
                  10.spaceH,
                  AppTextFormField(
                    controller: controller.createpwd,
                    isPassword: true,
                    label: "Password",
                    hint: "***************",
                  ),
                  GetPlatform.isWeb ? 30.spaceH : 20.spaceH,
                  AppElevatedButton(
                      onPressed: controller.registre, title: "Create account"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
