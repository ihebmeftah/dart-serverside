import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_flutter/initclient.dart';
import 'app/routes/app_pages.dart';

FutureOr<void> main() async {
  await appClientInit();
  runApp(GetMaterialApp(
    title: "Thuto LMS",
    initialRoute: sessionManager.isSignedIn ? Routes.HOME : Routes.AUTH,
    getPages: AppPages.routes,
  ));
}
