import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/app/modules/category/views/category_view.dart';
import 'package:lms_flutter/app/modules/users/views/users_view.dart';

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
              GetBuilder<HomeController>(
                  id: 0,
                  builder: (_) {
                    return ListTile(
                      onTap: () => controller.changeView(0),
                      selected: _.currentScreen == 0,
                      leading: const Icon(Icons.dashboard),
                      title: const Text("Dashboard"),
                    );
                  }),
              GetBuilder<HomeController>(
                  id: 1,
                  builder: (_) {
                    return ListTile(
                      onTap: () => controller.changeView(1),
                      selected: _.currentScreen == 1,
                      leading: const Icon(Icons.person),
                      title: const Text("Users"),
                    );
                  }),
              GetBuilder<HomeController>(
                  id: 2,
                  builder: (_) {
                    return ListTile(
                      onTap: () => controller.changeView(2),
                      selected: _.currentScreen == 2,
                      leading: const Icon(Icons.category),
                      title: const Text("Category"),
                    );
                  }),
              GetBuilder<HomeController>(
                  id: 3,
                  builder: (_) {
                    return ListTile(
                      onTap: () => controller.changeView(3),
                      selected: _.currentScreen == 3,
                      leading: const Icon(Icons.quiz),
                      title: const Text("Quizes"),
                    );
                  }),
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
        body: GetBuilder<HomeController>(
            id: "body",
            builder: (_) {
              return [
                controller.obx(
                  (state) => Column(
                    children: [
                      SizedBox(
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
                    ],
                  ),
                  onError: (error) => Text(error ?? "Somthing wrong"),
                ),
                const UsersView(),
                const CategoryView(),
                const Text('Quizs is working'),
              ][controller.currentScreen];
            }));
  }
}
