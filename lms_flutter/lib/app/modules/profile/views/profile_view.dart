import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/component/appdropdown.dart';
import 'package:lms_flutter/app/component/appelevatedbutton.dart';
import 'package:lms_flutter/app/component/apptextformfield.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';
import 'package:lms_flutter/app/core/themes/themes.dart';
import '../controllers/profile_controller.dart';
import 'password_view.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemesApp.primary,
        appBar: AppBar(
          backgroundColor: ThemesApp.primary,
          title: const Text('Profile'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 50.r,
                backgroundImage: controller.user!.imageUrl == null
                    ? null
                    : NetworkImage(controller.user!.imageUrl!),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  child: Column(
                    children: [
                      AppTextFormField(
                          controller: controller.username,
                          profileDecoration: true,
                          hint: "Nathaniel",
                          label: "First name"),
                      15.spaceH,
                      AppTextFormField(
                          isEmail: true,
                          controller: controller.email,
                          profileDecoration: true,
                          hint: "nathaniel.smith@gmail.com",
                          label: "Email Address"),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    const AppElevatedButton(title: 'Update'),
                    TextButton(
                        onPressed: () => Get.to(() => const PasswordView()),
                        child: Text(
                          'Change password',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
