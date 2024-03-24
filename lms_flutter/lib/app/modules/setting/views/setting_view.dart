import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/core/themes/themes.dart';

import '../../../routes/app_pages.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: ThemesApp.secondary2),
                currentAccountPicture: CircleAvatar(
                  radius: 25.r,
                  backgroundImage: NetworkImage(controller.userInfo!.imageUrl!),
                ),
                accountName:
                    Text(controller.userInfo!.userName.capitalizeFirst!),
                accountEmail: Text(controller.userInfo!.email ?? "--")),
            ListTile(
              onTap: () => Get.toNamed(Routes.PROFILE),
              title: Text(
                "Profile",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: ThemesApp.secondary1),
              ),
            ),
            ListTile(
              trailing: GetBuilder<SettingController>(
                  id: "sound",
                  builder: (_) {
                    return Switch.adaptive(
                        value: controller.soundStatus,
                        onChanged: controller.changeSound);
                  }),
              subtitle: Text(
                "turn on or off sounds",
                style: TextStyle(fontSize: 12.sp, color: ThemesApp.secondary1),
              ),
              title: Text(
                "Sound",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: ThemesApp.secondary1),
              ),
            ),
            ListTile(
              trailing: GetBuilder<SettingController>(
                  id: "notification",
                  builder: (_) {
                    return Switch.adaptive(
                        value: controller.notificationStatus,
                        onChanged: controller.changeNotification);
                  }),
              subtitle: Text(
                "turn on or off notifications",
                style: TextStyle(fontSize: 12.sp, color: ThemesApp.secondary1),
              ),
              title: Text(
                "Notification",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: ThemesApp.secondary1),
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Language",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: ThemesApp.secondary1),
                  ),
                  Text(
                    "English (UK)",
                    style:
                        TextStyle(fontSize: 14.sp, color: ThemesApp.secondary1),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () => Get.toNamed(Routes.ABOUT),
              title: Text(
                "About",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: ThemesApp.secondary1),
              ),
            ),
            ListTile(
              onTap: () => Get.toNamed(Routes.HELP),
              title: Text(
                "Help",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: ThemesApp.secondary1),
              ),
            ),
          ],
        ),
        SafeArea(
          child: ListTile(
            onTap: controller.logout,
            title: Text(
              "Log out",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
            trailing: const Icon(Icons.logout, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
