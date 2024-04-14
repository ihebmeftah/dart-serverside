import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';

import '../../../component/appelevatedbutton.dart';
import '../../../component/apptextformfield.dart';
import '../controllers/category_form_controller.dart';

class CategoryFormView extends GetView<CategoryFormController> {
  const CategoryFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx((state) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
            child: Center(
              child: Form(
                  key: controller.form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppTextFormField(
                          controller: controller.catName,
                          label: "Category name",
                          hint: "Sport, Music, ..."),
                      20.spaceH,
                      AppTextFormField(
                          controller: controller.catDesc,
                          maxLine: 4,
                          label: "Category description",
                          hint: "This is sport category"),
                      40.spaceH,
                      AppElevatedButton(
                        title: Get.arguments == null ? "ADD " : "UPDATE ",
                        onPressed: controller.createCategroy,
                      )
                    ],
                  )),
            ),
          )),
    );
  }
}
