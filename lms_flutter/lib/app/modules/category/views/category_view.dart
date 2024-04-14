import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/component/appcard.dart';
import 'package:lms_flutter/app/core/extension/imageext.dart';
import 'package:lms_flutter/client_services.dart';

import '../../../component/appcategorywidget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/category_controller.dart';
import 'category_form_view.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            GetPlatform.isWeb ? null : AppBar(title: const Text('Category')),
        floatingActionButton: GetPlatform.isWeb
            ? FloatingActionButton.extended(
                onPressed: () => Get.to(
                      () => const CategoryFormView(),
                    ),
                icon: const Icon(Icons.add),
                label: const Text("Add category"))
            : null,
        body: ClientServices.isAdmin
            ? controller.obx(
                (state) => ListView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0.w, vertical: 10.h),
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) => ListTile(
                          onTap: () {
                            Get.to(
                              () => const CategoryFormView(),
                              arguments: controller.categories[index].id as int,
                            );
                          },
                          title: Text(controller.categories[index].name),
                          subtitle: Text(controller.categories[index].desc),
                          trailing: const Icon(Icons.remove_red_eye),
                        )),
                onEmpty: const Center(child: Text("No category found")),
                onError: (error) => Text(
                  error.toString(),
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
                          subtitle:
                              "${controller.categories[index].nbQuiz ?? 0} Quizzes",
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
