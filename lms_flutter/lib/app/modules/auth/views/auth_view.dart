import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lms_flutter/flavors.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text(F.name)),
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(30),
                child: TabBar(
                  tabs: [Tab(text: "Login"), Tab(text: "Registre")],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                                  if (value!.isEmpty ||
                                      GetUtils.isEmail(value) == false) {
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
                                  if (GetUtils.isEmail(value) == false) {
                                    return "Field is email";
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
          ),
        ),
      ),
    );
  }
}
