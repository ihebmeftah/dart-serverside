import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_flutter/client_services.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final username = TextEditingController(), email = TextEditingController();
  final user = ClientServices.session.signedInUser;

  @override
  void onInit() {
    username.text = user!.userName;
    email.text = user!.email!;
    super.onInit();
  }
}
