import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_client/quiz_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'app/routes/app_pages.dart';

final Client client = Client(
    GetPlatform.isAndroid ? 'http://10.0.2.2:8080/' : 'http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz",
      theme: ThemeData(
          colorSchemeSeed: Colors.blue.shade900,
          scaffoldBackgroundColor: Colors.blue.shade900,
          appBarTheme: AppBarTheme(
              toolbarHeight: 70,
              backgroundColor: Colors.blue.shade900,
              titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 26)),
          cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.symmetric(vertical: 10)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 60),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold))),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          )),
      initialRoute: Routes.QUIZ,
      getPages: AppPages.routes,
    ),
  );
}
