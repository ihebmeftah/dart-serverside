import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/core/extension/imageext.dart';
import 'package:lms_flutter/app/core/extension/spacing.dart';
import 'package:lms_flutter/app/core/themes/themes.dart';
import 'package:lms_flutter/app/modules/category/views/category_view.dart';
import 'package:lms_flutter/app/modules/quiz/views/quiz_view.dart';
import 'package:lms_flutter/app/modules/rank/views/rank_view.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 2.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100.h,
                child: Center(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25.r,
                        backgroundImage: AssetImage("logo".toPng),
                      ),
                      5.spaceW,
                      Get.width < 1013
                          ? const SizedBox()
                          : Text(
                              "Thuto\nDashboard",
                              style: TextStyle(
                                fontSize: 6.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<AdminController>(builder: (_) {
                    return ListTile(
                      onTap: () => controller.switchView(0),
                      selected: controller.index == 0,
                      selectedTileColor: ThemesApp.primary,
                      selectedColor: ThemesApp.secondary2,
                      leading: const Icon(Icons.home),
                      title: Get.width < 1013
                          ? const SizedBox()
                          : Text(
                              "Dashboard",
                              style: TextStyle(
                                  fontSize: 4.sp, fontWeight: FontWeight.w500),
                            ),
                    );
                  }),
                  20.spaceH,
                  GetBuilder<AdminController>(builder: (_) {
                    return ListTile(
                      onTap: () => controller.switchView(1),
                      selected: controller.index == 1,
                      selectedTileColor: ThemesApp.primary,
                      selectedColor: ThemesApp.secondary2,
                      leading: const Icon(Icons.category),
                      title: Get.width < 1013
                          ? const SizedBox()
                          : Text(
                              "Category",
                              style: TextStyle(
                                  fontSize: 4.sp, fontWeight: FontWeight.w500),
                            ),
                    );
                  }),
                  20.spaceH,
                  GetBuilder<AdminController>(builder: (_) {
                    return ListTile(
                      onTap: () => controller.switchView(2),
                      selected: controller.index == 2,
                      selectedTileColor: ThemesApp.primary,
                      selectedColor: ThemesApp.secondary2,
                      leading: const Icon(Icons.quiz),
                      title: Get.width < 1013
                          ? const SizedBox()
                          : Text(
                              "Quizes",
                              style: TextStyle(
                                  fontSize: 4.sp, fontWeight: FontWeight.w500),
                            ),
                    );
                  }),
                  20.spaceH,
                  GetBuilder<AdminController>(builder: (_) {
                    return ListTile(
                      onTap: () => controller.switchView(3),
                      selected: controller.index == 3,
                      selectedTileColor: ThemesApp.primary,
                      selectedColor: ThemesApp.secondary2,
                      leading: const Icon(Icons.account_box),
                      title: Get.width < 1013
                          ? const SizedBox()
                          : Text(
                              "Users",
                              style: TextStyle(
                                  fontSize: 4.sp, fontWeight: FontWeight.w500),
                            ),
                    );
                  }),
                  20.spaceH,
                  GetBuilder<AdminController>(builder: (_) {
                    return ListTile(
                      onTap: () => controller.switchView(4),
                      selected: controller.index == 4,
                      selectedTileColor: ThemesApp.primary,
                      selectedColor: ThemesApp.secondary2,
                      leading: const Icon(Icons.grade),
                      title: Get.width < 1013
                          ? const SizedBox()
                          : Text(
                              "Rankings",
                              style: TextStyle(
                                  fontSize: 4.sp, fontWeight: FontWeight.w500),
                            ),
                    );
                  }),
                  20.spaceH,
                  GetBuilder<AdminController>(builder: (_) {
                    return ListTile(
                      onTap: () => controller.switchView(5),
                      selected: controller.index == 5,
                      selectedTileColor: ThemesApp.primary,
                      selectedColor: ThemesApp.secondary2,
                      leading: const Icon(Icons.school),
                      title: Get.width < 1013
                          ? const SizedBox()
                          : Text(
                              "School grades",
                              style: TextStyle(
                                  fontSize: 4.sp, fontWeight: FontWeight.w500),
                            ),
                    );
                  }),
                  const Spacer(),
                  ListTile(
                    selectedTileColor: ThemesApp.primary,
                    selectedColor: ThemesApp.secondary2,
                    leading: CircleAvatar(
                      backgroundImage: controller.admin?.imageUrl == null
                          ? null
                          : NetworkImage(controller.admin!.imageUrl!),
                    ),
                    trailing: IconButton(
                        onPressed: controller.logout,
                        icon: const Icon(Icons.logout)),
                    title: Get.width < 1013
                        ? const SizedBox()
                        : Text(
                            controller.admin?.userName ?? "",
                            style: TextStyle(
                                fontSize: 4.sp, fontWeight: FontWeight.w500),
                          ),
                  )
                ],
              ))
            ],
          ),
        )),
        Expanded(
            flex: 5,
            child: GetBuilder<AdminController>(
              builder: (controller) => [
                const Text("Dashboard"),
                const CategoryView(),
                const QuizView(),
                const Text("Users"),
                const RankView(),
                const Text("School grades"),
              ][controller.index],
            ))
      ],
    ));
  }
}
