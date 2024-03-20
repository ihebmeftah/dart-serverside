import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';
import 'package:lms_flutter/app/core/themes/themes.dart';

import '../../../component/appelevatedbutton.dart';
import '../../../component/apptextformfield.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemesApp.primary,
        appBar: AppBar(
          backgroundColor: ThemesApp.primary,
          actions: [
            Expanded(
              child: Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Thuto',
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Edu',
                          style: TextStyle(color: ThemesApp.secondary2)),
                    ],
                  ),
                  style: TextStyle(
                      fontSize: GetPlatform.isWeb ? 8.sp : 36.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20.h),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Discover the world one quiz\nat a time",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: GetPlatform.isWeb ? 8.sp : 18.sp),
                ),
                20.spaceH,
                SizedBox(
                  width: GetPlatform.isWeb ? Get.width / 2.2 : Get.width,
                  child: Form(
                    key: controller.loginkey,
                    child: Column(
                      children: [
                        AppTextFormField(
                          isEmail: true,
                          controller: controller.email,
                          label: "Email Address",
                          hint: "you@email.com",
                        ),
                        10.spaceH,
                        AppTextFormField(
                          controller: controller.pwd,
                          isPassword: true,
                          label: "Password",
                          hint: "***************",
                        ),
                        GetPlatform.isWeb ? 30.spaceH : 20.spaceH,
                        AppElevatedButton(
                            onPressed: controller.login, title: "Login"),
                        GetPlatform.isWeb ? 10.spaceH : 5.spaceH,
                        TextButton(
                            onPressed: () {},
                            child: Text("Create Account",
                                style: TextStyle(
                                    fontSize:
                                        GetPlatform.isWeb ? 4.sp : 18.sp))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
