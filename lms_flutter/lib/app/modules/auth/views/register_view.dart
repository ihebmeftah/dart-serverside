import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/themes/themes.dart';

class RegisterView extends GetView {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemesApp.primary,
      appBar: AppBar(
        backgroundColor: ThemesApp.primary,
      ),
      body: const Center(
        child: Text(
          'RegisterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
