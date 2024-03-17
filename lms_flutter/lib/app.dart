import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'flavors.dart';
import 'initclient.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: F.title,
      initialRoute: sessionManager.isSignedIn ? Routes.HOME : Routes.AUTH,
      getPages: AppPages.routes,
    );
  }
}
