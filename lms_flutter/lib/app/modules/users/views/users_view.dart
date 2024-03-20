import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/users_controller.dart';

class UsersView extends GetView<UsersController> {
  const UsersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: controller.obx(
        (state) => ListView(
          children: [
            ...List.generate(
                controller.admins.length,
                (index) => ListTile(
                      trailing: controller.admins[index].userInfo!.blocked
                          ? const Icon(
                              Icons.block,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.verified,
                              color: Colors.green,
                            ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            controller.admins[index].userInfo!.imageUrl!),
                      ),
                      title: Text(controller.admins[index].userInfo!.userName),
                      subtitle: Text(
                          "Scope : ${controller.admins[index].userInfo!.scopeNames.join("-")}"),
                    )),
            ...List.generate(
                controller.players.length,
                (index) => ListTile(
                      trailing: controller.players[index].userInfo!.blocked
                          ? const Icon(
                              Icons.block,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.verified,
                              color: Colors.green,
                            ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            controller.players[index].userInfo!.imageUrl!),
                      ),
                      title: Text(controller.players[index].userInfo!.userName),
                      subtitle: Text(
                          "Scope : ${controller.players[index].userInfo!.scopeNames.join("-")}"),
                    ))
          ],
        ),
        onError: (error) => Text(error ?? "Somthing wrong"),
        onEmpty: const Center(child: Text("You don't have any user")),
      ),
    );
  }
}
