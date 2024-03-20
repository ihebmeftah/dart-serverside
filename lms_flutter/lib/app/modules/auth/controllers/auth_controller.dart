import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  void signIn() {
    if (form.currentState!.validate()) {}
  }
}
