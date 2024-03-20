import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(controller.user!.imageUrl!),
                ),
                accountName: Text(
                    "${controller.user!.userName}(${controller.user!.scopeNames.join("-")})"),
                accountEmail: Text(controller.user!.email ?? "")),
            ListTile(
              onTap: () => Get.toNamed(Routes.USERS),
              leading: const Icon(Icons.person),
              title: const Text("Users"),
            ),
            ListTile(
              onTap: () => Get.toNamed(Routes.CATEGORY),
              leading: const Icon(Icons.category),
              title: const Text("Category"),
            ),
            ListTile(
              onTap: () => Get.toNamed(Routes.QUIZ),
              leading: const Icon(Icons.quiz),
              title: const Text("Quizes"),
            ),
            const Spacer(),
            ListTile(
              tileColor: Colors.red.shade500,
              onTap: controller.logout,
              trailing: Icon(Icons.logout, color: Colors.red.shade50),
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.red.shade50),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(),
      body: SizedBox(
        width: Get.width,
        height: 60,
        child: Row(
          children: [
            Expanded(
                child: Card(
              child: Column(
                children: [
                  Text(controller.nbAdmins.toString()),
                  const Text("ADMIN"),
                ],
              ),
            )),
            Expanded(
                child: Card(
              child: Column(
                children: [
                  Text(controller.nbPlayer.toString()),
                  const Text("PLAYERS"),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
