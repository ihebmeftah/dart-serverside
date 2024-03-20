import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/imageext.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';
import 'package:lms_flutter/app/routes/app_pages.dart';

import '../../../core/themes/themes.dart';
import '../controllers/quizes_cat_controller.dart';

class QuizesCatView extends GetView<QuizesCatController> {
  const QuizesCatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemesApp.primary,
        appBar: AppBar(
          backgroundColor: ThemesApp.primary,
          title: const Text('Quizes'),
        ),
        body: ListView.separated(
          itemCount: 5,
          padding: EdgeInsets.all(20.w),
          separatorBuilder: (context, index) => 10.spaceH,
          itemBuilder: (context, index) => ListTile(
            onTap: () => Get.toNamed(Routes.QUIZ_PLAY),
            tileColor: ThemesApp.white,
            contentPadding: EdgeInsets.all(10.h),
            leading: Image.asset("boarding".toPng),
            title: Text(
              "World capitals",
              style: TextStyle(
                  color: ThemesApp.secondary2,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "15 Questions",
              style: TextStyle(
                  color: ThemesApp.secondary1,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }
}
