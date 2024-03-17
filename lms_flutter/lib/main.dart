import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lms_flutter/initclient.dart';
import 'app.dart';

FutureOr<void> main() async {
  await appClientInit();
  runApp(const App());
}
