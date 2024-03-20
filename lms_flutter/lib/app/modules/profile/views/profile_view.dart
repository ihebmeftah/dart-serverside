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
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              CircleAvatar(radius: 40.r),
              10.spaceH,
              Text(
                "Nathaniel Smith",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: ThemesApp.secondary1),
              ),
              Text(
                "nathaniel.smith@gmail.com",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: ThemesApp.secondary2),
              ),
              20.spaceH,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: AppTextFormField(
                              profileDecoration: true,
                              hint: "Nathaniel",
                              label: "First name"),
                        ),
                        15.spaceW,
                        const Expanded(
                          child: AppTextFormField(
                              profileDecoration: true,
                              hint: "smith",
                              label: "Last name"),
                        ),
                      ],
                    ),
                    15.spaceH,
                    AppDropdown(
                        value: "1",
                        items: ["1", "2", "3", "4"]
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        profileDecoration: true,
                        onChange: (value) {},
                        hint: "Select grade level",
                        label: "Select grade level"),
                    15.spaceH,
                    AppDropdown(
                        value: "tunisia",
                        items: ["tunisia", "south africa", "Algeria"]
                            .map((e) => DropdownMenuItem(
                                value: e, child: Text(e.capitalizeFirst!)))
                            .toList(),
                        profileDecoration: true,
                        onChange: (value) {},
                        hint: "Select Country/Region",
                        label: "Select Country/Region"),
                    15.spaceH,
                    const AppTextFormField(
                        profileDecoration: true,
                        hint: "nathaniel.smith@gmail.com",
                        label: "Email Address"),
                  ],
                ),
              ),
              15.spaceH,
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
