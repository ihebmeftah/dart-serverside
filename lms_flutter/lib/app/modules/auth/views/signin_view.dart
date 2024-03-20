import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/imageext.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';
import 'package:lms_flutter/app/modules/auth/controllers/auth_controller.dart';

import '../../../core/themes/themes.dart';

class SigninView extends GetView<AuthController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemesApp.primary,
        appBar: AppBar(
          backgroundColor: ThemesApp.primary,
          title: Text.rich(
            TextSpan(
              text: 'Thuto',
              children: <TextSpan>[
                TextSpan(
                    text: 'Edu', style: TextStyle(color: ThemesApp.secondary2)),
              ],
            ),
            style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.h),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'boarding'.toPng,
                  height: 220.h,
                ),
                20.spaceH,
              ],
            ),
          ),
        ));
  }
}
