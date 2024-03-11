import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
            const Spacer(),
            ListTile(
              onTap: controller.logout,
              trailing: const Icon(Icons.logout),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
