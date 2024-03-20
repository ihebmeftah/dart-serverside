import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';
import 'package:lms_flutter/app/modules/profile/controllers/password_controller.dart';

import '../../../component/appelevatedbutton.dart';
import '../../../component/apptextformfield.dart';
import '../../../core/themes/themes.dart';

class PasswordView extends GetView<PasswordController> {
  const PasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemesApp.primary,
        appBar: AppBar(
          backgroundColor: ThemesApp.primary,
          title: const Text('Password'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Material(
            color: ThemesApp.primary,
            textStyle: TextStyle(color: ThemesApp.secondary1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    "Please create a password that meets the following requirements :"),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("- Must be at least 8 characters long"),
                      Text(
                          "- Must contain at least one uppercase letter , one lowercase letter , and one number"),
                      Text("- Can contain special characters such as !?#*%1\$"),
                      Text(
                          "- Should not include your username or any personal information"),
                      Text(
                          "- Avoid using commonly used passwords, such as 'password' or '123456'"),
                    ],
                  ),
                ),
                20.spaceH,
                Column(
                  children: [
                    AppTextFormField(
                      controller: controller.currPwd,
                      label: "Current password",
                      hint: "Current password",
                      isPassword: true,
                      onChange: controller.writePwd,
                    ),
                    10.spaceH,
                    AppTextFormField(
                      controller: controller.newPwd,
                      label: "New password",
                      hint: "New password",
                      isPassword: true,
                      onChange: controller.writePwd,
                    ),
                    10.spaceH,
                    AppTextFormField(
                      controller: controller.reenterPwd,
                      label: "Re-enter password",
                      hint: "Re-enter password",
                      isPassword: true,
                      onChange: controller.writePwd,
                    ),
                    40.spaceH,
                    GetBuilder<PasswordController>(
                        id: "button",
                        builder: (_) {
                          return AppElevatedButton(
                            title: "Update",
                            onPressed: controller.buttonStatus ? () {} : null,
                          );
                        })
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
