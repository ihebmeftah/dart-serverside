import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/component/appcard.dart';
import 'package:lms_flutter/app/component/appelevatedbutton.dart';
import 'package:lms_flutter/app/component/apptextformfield.dart';
import 'package:lms_flutter/app/core/extension/imageext.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';

import '../../../component/appcategorywidget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            GetPlatform.isWeb ? null : AppBar(title: const Text('Category')),
        body: GetPlatform.isWeb
            ? Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
                child: Row(
                  children: [
                    Expanded(
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
                                  title: "ADD ",
                                  onPressed: controller.createCategroy,
                                )
                              ],
                            )),
                      ),
                    ),
                    Expanded(
                      child: controller.obx(
                        (state) => ListView.builder(
                            itemCount: controller.categories.length,
                            itemBuilder: (context, index) => ListTile(
                                  title:
                                      Text(controller.categories[index].name),
                                  subtitle:
                                      Text(controller.categories[index].desc),
                                  trailing: IconButton(
                                    onPressed: () => controller.deleteCategory(
                                      controller.categories[index].id!,
                                    ),
                                    icon: const Icon(
                                      Icons.delete,
                                    ),
                                  ),
                                )),
                        onEmpty: const Center(child: Text("No category found")),
                        onError: (error) => Text(
                          error.toString(),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SafeArea(
                child: controller.obx(
                  (state) => GridView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    itemCount: controller.categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.w,
                      mainAxisSpacing: 15.w,
                    ),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => AppCard(
                        ontap: () => Get.toNamed(
                            "${Routes.QUIZES_CAT}/${controller.categories[index].id}"),
                        child: AppCategroyWidget(
                          img: "boarding".toPng,
                          title: controller.categories[index].name,
                          subtitle: "-- Quizzes",
                        )),
                  ),
                  onEmpty: const Center(child: Text("No category found")),
                  onError: (error) => Text(
                    error.toString(),
                  ),
                ),
              ));
  }
}
