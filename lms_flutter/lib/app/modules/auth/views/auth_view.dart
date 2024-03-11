import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Row(
        children: [
          Expanded(
              child: Container(
            color: Colors.teal,
          )),
          Expanded(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                width: Get.width / 5,
                child: const TabBar(
                  tabs: [Tab(text: "Login"), Tab(text: "Registre")],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: TabBarView(
                    children: [
                      Form(
                          key: controller.loginkey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: controller.email,
                                decoration: const InputDecoration(
                                    hintText: "user@gmail.com"),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Field is required";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: controller.pwd,
                                decoration: const InputDecoration(
                                  hintText: "*****************",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Field is required";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 40),
                              ElevatedButton(
                                  onPressed: controller.login,
                                  child: const Text("Login"))
                            ],
                          )),
                      Form(
                          key: controller.registrekey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: controller.username,
                                decoration:
                                    const InputDecoration(hintText: "username"),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Field is required";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: controller.createemail,
                                decoration: const InputDecoration(
                                    hintText: "user@gmail.com"),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Field is required";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: controller.createpwd,
                                decoration: const InputDecoration(
                                  hintText: "*****************",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Field is required";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 40),
                              ElevatedButton(
                                  onPressed: controller.registre,
                                  child: const Text("registre"))
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ))
        ],
      )),
    );
  }
}
