import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/core/themes/themes.dart';
import 'app/routes/app_pages.dart';
import 'client_services.dart';

void main() async {
  await Get.putAsync(() async => ClientServices());
  await ScreenUtil.ensureScreenSize();
  runApp(
    ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: "Thuto",
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.AUTH,
            unknownRoute: AppPages.unkonwnRoutes,
            theme: ThemesApp.light,
            getPages: AppPages.routes,
          );
        }),
  );
}
