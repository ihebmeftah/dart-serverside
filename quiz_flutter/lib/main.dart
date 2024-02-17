import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_client/quiz_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'app/routes/app_pages.dart';

final Client client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(
    GetMaterialApp(
      title: "Quiz",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
