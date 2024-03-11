import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'initclient.dart';

void main() async {
  await appClientInit();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: sessionManager.isSignedIn ? Routes.HOME : Routes.AUTH,
      getPages: AppPages.routes,
    ),
  );
}
