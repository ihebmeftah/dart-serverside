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
      body: controller.obx(
        (state) => ListView.separated(
          itemCount: controller.categoryQuizes.length,
          padding: EdgeInsets.all(20.w),
          separatorBuilder: (context, index) => 10.spaceH,
          itemBuilder: (context, index) => ListTile(
            onTap: () => Get.toNamed(Routes.QUIZ_PLAY),
            tileColor: ThemesApp.white,
            contentPadding: EdgeInsets.all(10.h),
            leading: Image.asset("boarding".toPng),
            title: Text(
              controller.categoryQuizes[index].name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: ThemesApp.secondary2,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "${controller.categoryQuizes[index].question?.length} Questions",
              style: TextStyle(
                  color: ThemesApp.secondary1,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        onEmpty: const Center(
          child: Text("Quizes for this category not found"),
        ),
        onError: (e) => Center(
          child: Text(e.toString()),
        ),
      ),
    );
  }
}
